const servicePrice = parseInt(document.getElementById("provider-service-cost").innerText.slice(1), 10);
const totalPrice = document.getElementById("total-price");
const lessButton = document.getElementById("less-btn");
const addButton = document.getElementById("add-btn");


const changeTotalPrice = () => {
  if (servicePrice) {
    const numberOfGuests = parseInt(document.getElementById("guests-input").value, 10);
    totalPrice.innerText = `$${numberOfGuests * servicePrice}`
  }

  if (lessButton) {
    lessButton.addEventListener("click", event => {
      event.preventDefault();
      setTotalPrice();
    });

    addButton.addEventListener("click", event => {
      event.preventDefault();
      setTotalPrice();
    });
  };
};


const setTotalPrice = () => {
  const numberOfGuests = parseInt(document.getElementById("guests-input").value, 10);
  totalPrice.innerText = `$${numberOfGuests * servicePrice}`
};

export { changeTotalPrice };

