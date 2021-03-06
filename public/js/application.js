$(document).ready(function() {

  $("#click-tags li a").on("click", getImages);

  function getImages(event){
    event.preventDefault();
    var url = $(this).attr("href");
    var request = $.ajax({
      url: url,
      method: "get",
    });

    request.done(function(response) {
      $("#main-content-right").remove();
      $("#last-minute-hack").append(response);
    });
  };
});


// TWITTER SHARE
!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');

// FB SHARE
(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.5";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
