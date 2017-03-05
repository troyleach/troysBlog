// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// require turbolinks
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
// I used the jquery.turbolinks because when I navigate to the a page with angular the turbolinks would stop it from loading (the angular that is) turbolinks helps load the pages faster so this stack - http://stackoverflow.com/questions/17881384/jquery-gets-loaded-only-on-page-refresh-in-rails-4-application

//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks

//= require angular
//= require app
//= require angular-mocks
//= require bootstrap-sprockets
//= require ckeditor/init
//= require_tree .
