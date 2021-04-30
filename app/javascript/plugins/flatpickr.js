import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".datepicker", {
    minDate: "today",
    altInput: true
  });

  flatpickr(".timepicker", {
    enableTime: true,
    noCalendar: true
  });
}

export { initFlatpickr };
