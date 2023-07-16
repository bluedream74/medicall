function updateLabelClasses() {
  document.querySelectorAll('.weekday-label').forEach(function(label) {
    var checkbox = document.getElementById(label.getAttribute('for'));

    if (checkbox.checked) {
      label.classList.add('checked-label');
    } else {
      label.classList.remove('checked-label');
    }
  });
}

document.addEventListener('DOMContentLoaded', updateLabelClasses);

document.addEventListener('change', function(event) {
  if (event.target.matches('.hidden-checkbox')) {
    updateLabelClasses();
  }
});


