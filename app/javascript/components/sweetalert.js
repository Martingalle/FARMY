import swal from 'sweetalert';

function bindSweetAlertButtonDemo() {
  const swalButton = document.getElementById('delete');
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal({
        title: 'Cathy Tuche is deleting your marchin',
        width: 600,
        padding: '3em',
        background: '#fff url(/images/trees.png)',
        backdrop: `
          rgba(0,0,123,0.4)
          url('./images/nyan-cat.gif')
          center left
          no-repeat
        `
      })
    });
  }
}

export { bindSweetAlertButtonDemo };
