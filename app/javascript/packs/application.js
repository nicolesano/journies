/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

//= require rails-ujs
//= require jquery-ui/widgets/sortable
//= require bootstrap-sprockets
//= require activestorage
//= require turbolinks
//= require semantic-ui
//= require semantic-ui/modal
//= require semantic-ui/dropdown
//= require semantic_ui/semantic_ui
//= require rails_sortable
//= require_tree .

import "core-js/stable";
import "regenerator-runtime/runtime";

import 'jquery';
import 'popper.js';
import 'bootstrap';

(function ($) {
    $(document).on( 'turbolinks:load', function(){
        $('.sortable').railsSortable();
    });
})(jQuery);

// import { loadDynamicBannerText } from '../components/banner';

import Typed from 'typed.js';

const loadDynamicBannerText = () => {
    new Typed('#typed', {
        strings: ["Bullet journalling with a kick"],
        typeSpeed: 50,
        loop: true
    });
}

loadDynamicBannerText();
