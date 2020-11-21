const dateToggle = () => {
  const buttons = document.querySelectorAll(".yes-or-no")
  buttons.forEach((button) => {
    button.addEventListener("change", (e) => {
      if (e.target.value === "Oui") {
        document.querySelector("#if-yes").classList.remove("d-none")
      } else {
        document.querySelector("#if-yes").classList.add("d-none")
      }
    })
  })
}


export {dateToggle} ;
