import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  if (document.querySelector('.animation-typed-js-1')) {
    new Typed('#typed', {
      stringsElement: '#typed-strings',
      typeSpeed: 5,
      loop: false,
      showCursor: false
    });
  }
}

const loadDynamicBannerTextTwo = () => {
  if (document.querySelector('.animation-typed-js-2')) {
    new Typed('#typed-two', {
      startDelay: 1000,
      stringsElement: '#typed-strings-two',
      typeSpeed: 15,
      loop: false,
      showCursor: false
    });
  }
}

// const loadDynamicBannerTextTwo = () => {
//   new Typed('#banner-typed-text-two', {
//     strings: [`Tu as ${subscriptions.length} abonnements en cours`],
//     typeSpeed: 50,
//     loop: false
//   });
// }

export { loadDynamicBannerText, loadDynamicBannerTextTwo };
