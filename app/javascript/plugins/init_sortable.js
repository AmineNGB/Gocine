import Sortable from 'sortablejs';

const initSortable = () => {
  const list = document.querySelector('#favorite');

  if (list) {
    // buildData();
    Sortable.create(list, {
      ghostClass: "ghost",
      animation: 150,
      onEnd: (event) => {
        // buildData();
        fetch("/api/draganddrop", {
          method: "PATCH",
          headers: {
            'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content,
            'Content-Type': 'application/json'
          },
          body: JSON.stringify( buildData() )
        })
      }
    });
  }
};

const buildData = () => {
  const dataId = document.querySelectorAll('#favsortable');
  let data = []
  dataId.forEach(element => data.push(element.dataset.id));
  return data;
}


export { initSortable };
