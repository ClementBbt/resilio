import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#typed', {
    stringsElement: '#typed-strings',
    typeSpeed: 20,
    loop: false,
    showCursor: false
  });
}

const loadDynamicBannerTextTwo = () => {
  new Typed('#typed-two', {
    startDelay: 2000,
    stringsElement: '#typed-strings-two',
    typeSpeed: 20,
    loop: false,
    showCursor: false
  });
}

// const loadDynamicBannerTextTwo = () => {
//   new Typed('#banner-typed-text-two', {
//     strings: [`Tu as ${subscriptions.length} abonnements en cours`],
//     typeSpeed: 50,
//     loop: false
//   });
// }

export { loadDynamicBannerText, loadDynamicBannerTextTwo };
