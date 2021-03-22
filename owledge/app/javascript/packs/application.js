// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//= require jquery3
//= require popper
//= require bootstrap-sprockets

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

class Comment extends HTMLElement {
    // A getter/setter for an open property.
    get author() {
        return this.hasAttribute('author');
    }

    set author(val) {
        // Reflect the value of the open property as an HTML attribute.
        if (val) {
            this.setAttribute('author', '');
        } else {
            this.removeAttribute('author');
        }
        this.toggleDrawer();
    }
}
customElements.define('user-comment', Comment);