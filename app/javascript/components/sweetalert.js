import swal from 'sweetalert';

function bindSweetAlertButtonDemo() {
  const swalButton = document.getElementById('delete');
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal("Hello world!");
    });
  }
}

export { bindSweetAlertButtonDemo };
