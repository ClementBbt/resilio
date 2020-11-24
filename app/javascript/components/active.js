
// const activeButtonHome = () => {
//   const button = document.querySelector('.button-home');
//   button.addEventListener('focus', (event) => {
//   button.classList.add("active");
// });
// }

const activeButtonHome = () => {
  const button = document.querySelector('.button-home');
  button.addEventListener('mouseout', (event) => {
    console.log(event.currentTarget);
    button.classList.add("active");
    });
}

export { activeButtonHome };
