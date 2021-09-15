// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "./application.scss"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

require("trix")
require("@rails/actiontext")

document.addEventListener("turbolinks:load", () => {
  const forms = document.querySelectorAll('form[data-remote="true"]');
  forms.forEach(form => {
    form.addEventListener("ajax:success", (event) => {
      window.location.reload();
    });
    form.addEventListener("ajax:error", (event) => {
      alert(event.detail[0]);
    });
  });
});
