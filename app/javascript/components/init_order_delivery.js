const labelsDelivery = document.querySelectorAll(".form-check label");
const addressInput = document.getElementById("order_address");
const apartmentInput = document.getElementById("order_apartment");
const editForm = document.querySelector(".edit_order");

const disableInputs = () => {
  addressInput.disabled = true;
  addressInput.value = "";
  apartmentInput.disabled = true;
  apartmentInput.value = "";
}

const enableInputs = () => {
  addressInput.disabled = false;
  apartmentInput.disabled = false;
}

const changeForm = () => {
  labelsDelivery.forEach(label => {
    label.addEventListener('click', (event) => {
      if (event.target.innerText === "Retiro en local") {
        disableInputs();
      }
      if (event.target.innerText === "A domicilio") {
        enableInputs();
      }
    });
  })
}


const setDelivery = () => {
  if (editForm) {
    changeForm();
  }
};


export { setDelivery };

