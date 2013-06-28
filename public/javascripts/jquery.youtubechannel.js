
;(function($){
    $.fn.youtubeChannel = function(settings) {
            // this plugin's version
        var version         = {major:0,minor:5,build:10},
            // the API version to use
            apiVersion      = 2,
            // the element where the plugin was called
            $ytEl           = $(this),
            // the list element
            $ytList         = $('<ul/>',{'class':'yt-channel-list'}),
            // the header
            $ytHead,
            // the footer (copyright note)
            $ytFoot,
            // maximum number of results that the api can return per call
            maxApiResults   = 50,
            // string to hold the html to be inserted
            listHtml        = '',
            // the plugin's options
            options         = $.extend({}, {username:'',query:'',startIndex:1,maxResults:50,orderBy:'published'}, settings),
            // the array of videos (currently not used...)
            videos          = [],
            // the current offset (must start at 1)
            resultOffset    = options.startIndex    = (options.startIndex < 1 ? 1 : options.startIndex);
            /*  -- PLUGIN FUNCTIONS --  */
            // get the html for the header
            getTitle    = function() {
                if (options.username!=='') {
                    return ['<a href="http://www.youtube.com/user/',options.username,'" target="_blank">',options.username,'</a>'].join('');
                }
                else if (options.query!=='') {
                    return ['<a href="http://www.youtube.com/results?',encodeURIComponent(options.query),'&aq=f" target="_blank">&quot;',options.query,'&quot;</a>'].join('');
                }
                else {
                    return '<a href="http://www.youtube.com/" target="_blank">YouTube</a>';
                }
            },
            // get the plugin's version
            getVersion  = function() {
                return [version.major,version.minor,version.build].join('.');
            },
            // calculate the next set of results to request from the API
            nextSet     = function() {
                var resultCall = options.startIndex + options.maxResults - resultOffset;
                return (resultCall > maxApiResults) ? maxApiResults : resultCall;
            },
            // build the url to make the API call
            buildUrl    = function() {
                var base    = 'https://gdata.youtube.com/feeds/api/videos',
                    params  = ['alt=json','v='+apiVersion,'orderby='+options.orderBy,'start-index='+resultOffset,'max-results='+nextSet()];
                if (options.username!=='') {
                    params.push('author='+options.username);
                }
                else if (options.query!=='') {
                    params.push('q='+encodeURIComponent(options.query));
                }
                params.push('callback=?');
                return base+'?'+params.join('&');
            },
            // parse the videos' time (from secs to mins:secs)
            parseTime   = function(secs) {
                var m,s = parseInt(secs,10);
                m = Math.floor(s / 60);
                s -= (m * 60);
                return m+':'+s;
            },
            // add a video to the list
            addVideo    = function(vid) {
                // add video data to the videos array
                videos.push(vid);
                // return the styled HTML
                return [
                    '<li class="yt-channel-video">',
                        '<a target="_blank" href="',vid.link,'">',
                            '<span class="thumb-wrap">',
                                '<img class="vid-thumb" alt="',vid.title,'" src="',vid.thumb,'"/>',
                                '<span class="vid-duration">',parseTime(vid.duration),'</span>',
                            '</span>',
                            '<div class="vid-details">',
                                '<span class="vid-title">',vid.title,'</span>',
                                '<span class="vid-views">',vid.views,' views</span>',
                            '</div>',
                        '</a>',
                    '</li>'].join('');
            },
            // parse the list of videos sent from the API
            parseList   = function(data) {
                var vid, e, length;
                // do we have videos to add?
                if (data.feed.entry) {
                    length = data.feed.entry.length;
                    // parse each video returned
                    for (var i=0; i<length; i++) {
                        // local cache of the video entry
                        e = data.feed.entry[i];
                        // add the video to the videos array and return the HTML for the list
                        listHtml += addVideo({
                            link:       (e ? e.media$group.media$player.url : ''),
                            title:      (e ? e.media$group.media$title.$t : ''),
                            thumb:      (e ? e.media$group.media$thumbnail[1].url : ''),
                            duration:   (e ? e.media$group.yt$duration.seconds : 0),
                            views:      (e && e.yt$statistics ? e.yt$statistics.viewCount : 0)
                        });
                        resultOffset++;
                    }
                    // check if we want to list more results
                    if (resultOffset < options.maxResults) {
                        // make one more api call for more results
                        $.getJSON(buildUrl(),parseList);
                    } else {
                        // done retrieving videos, compile the HTML
                        outputHtml();
                    }
                } else {
                    // if no results were returned on the first call...
                    if (resultOffset === options.startIndex) {
                        listHtml += '<li class="yt-channel-video"><a>NO RESULTS</a></li>';
                    }
                    // we're done here, compile the HTML
                    outputHtml();
                }
            },
            // output the final HTML
            outputHtml  = function() {
                // append header
                $ytHead.appendTo($ytList);
                // append the list of videos
                $ytHead.after(listHtml);
                // append footer
                $ytFoot.appendTo($ytList);
                // display the list of videos
                $ytList.appendTo($ytEl);
            };
        /*  -- PLUGIN MAIN CODE --  */
        // apply styling to the parent element
        $ytEl.addClass('yt-channel-holder');
        // set the header
        $ytHead = $('<li/>',{'class':'yt-channel-title'}).html(getTitle());
        // set copyright notice
        $ytFoot = $('<li/>',{'class':'yt-channel-copy'}).html('v'+getVersion()+' &copy; dharyk 2011');
        // start querying the API
        $.getJSON(buildUrl(),parseList);
        // maintain jQuery chainability
        return this;
    };
})(jQuery);
