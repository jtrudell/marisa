$(document).ready(function() {


var getInstagramId = $.ajax({
  url: "https://api.instagram.com/v1/users/search?q=msg0927&client_id=a963ba34ecb443bcbaeafa815a9154a9",
  method: "get"
});

var instagramId = getInstagramId.done(function(response){
  return response;
});

console.log(instagramId);

//   $.ajax({
//     url: "https://api.instagram.com/v1/users/" + instagramId + "/media/recent/",
//     method: "get"
//   })
//
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
