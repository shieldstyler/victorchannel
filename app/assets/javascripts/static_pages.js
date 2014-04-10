// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

function changeImage()
{
element = document.getElementById('myimage');
if (element.src.match("articles/article2.jpg"))
  {
  element.src = "articles/article1.jpg";
  }
else
  {
  element.src = "articles/article2.jpg";
  }
}

$(document).ready(function() {
    $('.slideshow').cycle({
        fx: 'fade', // choose your transition type, ex: fade, scrollUp, shuffle, etc...
        timeout: 6000
    });
});