import swal from 'sweetalert';

const initSweetalert = () => {
  const swalInstance = (selector, options = {}, callback = () => {}) => {
    if (selector) { // protect other pages
      // swalButton.forEach((button) => {
        // const bttn = button;
        selector.addEventListener('click', () => {
          event.preventDefault();
          swal(options).then(callback); // <-- add the `.then(callback)`
        });
      // })
    }
  };

  const swalButton = document.querySelectorAll('#sweet-alert2');

  swalButton.forEach((button) => {

    swalInstance(button, {
      title: "Voulez-vous vraiment supprimer cette transaction ?",
      // text: "Toute suppression est définitive",
      // icon: "warning",
      buttons: ["Surtout pas !", "Oui, ouste !"],
      // dangerMode: true,
      confirmButtonColor: '#000000',
      // cancelButtonColor: '#d33',
      className: "",
      closeOnClickOutside: true
    }, (value) => {
      if (value) {
        console.dir(button);
        const link = button.nextElementSibling;
        link.click();

      }
    });
  });

}

export { initSweetalert };
