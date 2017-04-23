// document.addEventListener(“DOMContentLoaded”, function(){
//     document.getElementById("myDropdown").classList.toggle("show");
function myFunction() {
  document.getElementById("myDropdown").classList.toggle("show");
}

window.onclick = function(e) {
  if (!e.target.matches('.dropbtn')) {
    var myDropdown = document.getElementById("myDropdown");
    if (myDropdown.classList.contains('show')) {
      myDropdown.classList.remove('show');
    }
  }
}
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  x[slideIndex-1].style.display = "block";
}

// saveButton.onclick = function(){
//   pauseSlideshow();
//   previousSlide();
// }
// var controls = document.querySelectorAll('.controls');
// for(var i=0; i<controls.length; i++){
//   controls[i].style.display = 'inline-block';
// }
//
// var slides = document.querySelectorAll('#slides .slide');
// var currentSlide = 0;
// var slideInterval = setInterval(nextSlide,10000);
//
// function nextSlide(){
//   goToSlide(currentSlide+1);
// }
//
// function previousSlide(){
//   goToSlide(currentSlide-1);
// }
//
// function goToSlide(n){
//   slides[currentSlide].className = 'slide';
//   currentSlide = (n+slides.length)%slides.length;
//   slides[currentSlide].className = 'slide showing';
// }
//
//
// var playing = true;
// var pauseButton = document.getElementById('pause');
//
// function pauseSlideshow(){
//   pauseButton.innerHTML = '&#9658;'; // play character
//   playing = false;
//   clearInterval(slideInterval);
// }
//
// function playSlideshow(){
//   pauseButton.innerHTML = '&#10074;&#10074;'; // pause character
//   playing = true;
//   slideInterval = setInterval(nextSlide,10000);
// }
//
// pauseButton.onclick = function(){
//   if(playing){
//     pauseSlideshow();
//   }
//   else{
//     playSlideshow();
//   }
// };
//
// var next = document.getElementById('next');
// var previous = document.getElementById('previous');
//
// next.onclick = function(){
//   pauseSlideshow();
//   nextSlide();
// };
// previous.onclick = function(){
//   pauseSlideshow();
//   previousSlide();
// };
