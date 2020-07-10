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

const toCopy  = document.getElementById( 'to-copy' ),
    btnCopy = document.getElementById( 'copy' );


btnCopy.addEventListener( 'click', function(){
  toCopy.select();
  
  if ( document.execCommand( 'copy' ) ) {
      btnCopy.classList.add( 'copied' );
    
    
      const temp = setInterval( function(){
        btnCopy.classList.remove( 'copied' );
        clearInterval(temp);
      }, 600 );
    
  } else {
    console.info( 'document.execCommand à échouer' )
  }
  
  return false;
} );



