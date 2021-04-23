import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".datepicker", {
    altInput: true
  });

  flatpickr(".timepicker", {
    enableTime: true,
    noCalendar: true
  });
}

export { initFlatpickr };
