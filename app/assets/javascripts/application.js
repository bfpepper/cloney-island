// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$(document).ready(function(){
  $('.comment-button').on('click', function(){
    $('.comment-button').addClass('pink');
    $.ajax({
      url: "http://localhost:8080/api/v1/projects/harry-potter/comments",
      contentType: "application/json",
      type: "GET",
      dataType: "json",
      headers: { "api_key": "650c51969893f9f6bae6e7589f5741cd"},
      success: function(data) { alert("ajax worked"); },
      error: function(data) { debugger; },
      done: function(data){ alert(data); }
      });
    });
  });
