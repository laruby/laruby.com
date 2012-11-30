$(document).ready(function() {

  jQuery(function($){
      $("#LARubyfeed").tweet({
        avatar_size: 50,
        count: 10,
        loading_text: "searching twitter...",
        query: "#laruby OR @laruby",
        refresh_interval: 1000
      });
    });

    $('#youtube_channel').youtubeChannel({
      // username -or- query: required, username takes precedence over query
      username: 'losangelesruby',
      // startIndex: optional, must be >=1
      startIndex: 1,
      // maxResults: optional, defaults to 50
      maxResults: 3,
      // orderBy: optional, defaults to 'published'
      orderBy: 'published'
    });

});
