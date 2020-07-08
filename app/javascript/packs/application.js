require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";
import "bootstrap-select";

import { initSortable } from '../plugins/init_sortable';
import { initSelect2 } from '../plugins/init_select2';
initSelect2();
initSortable();

const addMovie = document.querySelectorAll(".fa-plus-square");
if (addMovie) {
  addMovie.forEach((plus) => {
    plus.addEventListener("click", (event) => {
      event.currentTarget.style.display = "none"
  });
});
}
