var app = angular.module('app', []);

$.fn.fileinput.defaults.showUpload = false;
$('.summernote').summernote();

app.controller('UserCtrl', function($scope){

});

app.controller('SongCtrl', function($scope){

  $('[data-provider="summernote"]').each(function(){
    $(this).summernote({
      toolbar: [
        // [groupName, [list of button]]
        ['style', ['bold', 'italic', 'underline', 'fontname']],
        ['fontsize', ['fontsize']],
        ['color', ['color']],
        ['para', ['paragraph']]
      ],
      placeholder: 'Insert song lyrics here...',
      fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New'],
      height: 400
    });
  })

})

app.directive('fileinput', function ($timeout) {
  return {
    restrict: 'A',
    link: function ($scope, element, attrs) {
      $timeout(function(){
        $(element).fileinput({
          browseClass: "btn btn-primary",
          showCaption: true,
          showRemove: false,
          showUpload: false
        })
      })
    } //DOM manipulation
  }
});

app.directive('summernote', function ($timeout) {
  return {
    restrict: 'A',
    link: function ($scope, element, attrs) {
      $timeout(function(){
        $(element).summernote({
          toolbar: [
            // [groupName, [list of button]]
            ['style', ['bold', 'italic', 'underline']],
            ['fontsize', ['fontsize']],
            ['color', ['color']],
            ['para', ['paragraph']]
          ],
          placeholder: 'Insert song lyrics here...',
          height: 400
        })
      })
    } //DOM manipulation
  }
});