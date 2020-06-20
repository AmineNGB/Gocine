require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";

import { initSortable } from '../plugins/init_sortable';
import { initSelect2 } from '../plugins/init_select2';
initSelect2();
initSortable();

console.log("je suis la");

document.querySelectorAll("i").forEach((plus) => {
    plus.addEventListener("click", (event) => {
      event.currentTarget.classList.replace("fa-plus-square", "fa-minus-square");
    });
  });
// je replace juste le plus en minus ce qui permet de voir sur si on a déjà ajouter le film
