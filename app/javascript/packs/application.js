require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";

import { initSortable } from '../plugins/init_sortable';
import { initSelect2 } from '../plugins/init_select2';
initSelect2();
initSortable();


const icon = document.querySelector('#movie-icon');

icon.addEventListener("click", () => {
    if (icon.classList == "fas fa-plus-square fa-3x")
        icon.classList.replace("fas fa-plus-square fa-3x", "fas fa-plus-minus fa-3x") 
})


