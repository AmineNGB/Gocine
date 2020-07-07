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

function showNotification() {
  const notification = new Notification("Demande d'amis !", {
    body: "Tu as reçu une demande d'amis !"
  });

  notification.onclick = (e) => {
    window.location.href === "http://localhost:3000/pages/friends/"
  }
}

if (window.location.href === "http://localhost:3000/") {
  showNotification();
}

// console.log(Notification.permission);
// if (Notification.permission == 'granted') {
//   showNotification();;
// } else if (Notification.permission !== "denied") {
//   Notification.requestPermission().then(permission => {
//     if (permission === "granted") {
//       showNotification();
//     } 
//   });
// }
