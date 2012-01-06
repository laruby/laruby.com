$(document).ready(function() {

  jQuery(function($){
      $("#LARubyfeed").tweet({
        avatar_size: 50,
        count: 10,
        loading_text: "searching twitter...",
        query: "laruby",
        refresh_interval: 1000
      });
    });

});
