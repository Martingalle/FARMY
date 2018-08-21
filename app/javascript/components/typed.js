import Typed from 'typed.js';

function loadDynamicBannerText() {
  const typed = document.getElementById('type');
  if (typed) {
    new Typed('#type', {
      strings: ["Tractor", "Planter", "Fodder"],
      typeSpeed: 90,
      loop: true
    });
  }
}

export { loadDynamicBannerText };
