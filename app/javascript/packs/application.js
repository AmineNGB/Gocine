require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";

import { initSortable } from '../plugins/init_sortable';
import { initSelect2 } from '../plugins/init_select2';
initSelect2();
initSortable();

document.querySelectorAll("i").forEach((plus) => {
    plus.addEventListener("click", (event) => {
      event.currentTarget.style.display = "none"
  });
});
