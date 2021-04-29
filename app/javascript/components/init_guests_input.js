document.addEventListener('turbolinks:load', () => {
  const lessButton = document.getElementById("less-btn");
  const addButton = document.getElementById("add-btn");
  const guestsInput = document.getElementById("guests-input");
  const reduceGuests = () => {
    lessButton.addEventListener("click", event => {
      event.preventDefault();
      if (parseInt(guestsInput.value, 10) > 0) {
        guestsInput.setAttribute('value',(parseInt(guestsInput.value, 10) - 1).toString());
      }
    });
  };

  const incrementGuests = () => {
    addButton.addEventListener("click", event => {
      event.preventDefault();
      guestsInput.setAttribute('value',(parseInt(guestsInput.value, 10) + 1).toString());
    });
  };


  const changeGuests = () => {
    if (guestsInput) {
      reduceGuests();
      incrementGuests();
    };
  };


 changeGuests();
});



