import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#type', {
    strings: ["Tractor", "Planter", "Fodder"],
    typeSpeed: 80,
    loop: true
  });
}

export { loadDynamicBannerText };
