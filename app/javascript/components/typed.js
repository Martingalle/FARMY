import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#type', {
    strings: ["Tractor", "Planter", "Fodder"],
    typeSpeed: 90,
    loop: true
  });
}

export { loadDynamicBannerText };
