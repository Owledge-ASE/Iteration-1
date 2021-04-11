// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import {Dom} from "../app/main";
import '@rails/ujs';
import 'bootstrap';
import { library } from '@fortawesome/fontawesome-svg-core'
import { faThumbsUp } from '@fortawesome/free-solid-svg-icons'
import 'app/tree';

library.add(faThumbsUp)

Rails.start()
Turbolinks.start()
ActiveStorage.start()

console.log(document.readyState);
if( document.readyState !== 'loading' ) {
    console.log('load it');
    Dom.run();
} else {
    console.log('domcontentloaded');
    window.addEventListener('DOMContentLoaded', Dom.run);
}
