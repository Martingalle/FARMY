import flatpickr from "flatpickr";
import 'flatpickr/dist/themes/material_green.css'


function datepickr() {
  const date = document.querySelector('.flatpickr');
  if (date) {
    console.log("im here")
    flatpickr(date,
      {
        minDate: "today",
        enableTime: true,
        mode: "range",
        minTime: "09:00",
        showAlways: false,
        theme: "light"
      });
  }
}

export { datepickr };
