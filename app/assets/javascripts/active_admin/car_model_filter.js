// Dynamically filter car models by selected make in ActiveAdmin car form

document.addEventListener('DOMContentLoaded', function() {
  var makeSelect = document.getElementById('car_make_select');
  var modelSelect = document.getElementById('car_model_select');
  if (!makeSelect || !modelSelect) return;

  // modelsByMake will be injected via a data attribute on the make select
  var modelsByMake = makeSelect.dataset.modelsByMake ? JSON.parse(makeSelect.dataset.modelsByMake) : {};

  function updateModelOptions() {
    var makeId = makeSelect.value;
    var models = modelsByMake[makeId] || [];
    modelSelect.innerHTML = '<option value="">Select a Model</option>';
    models.forEach(function(model) {
      var opt = document.createElement('option');
      opt.value = model.id;
      opt.textContent = model.name;
      modelSelect.appendChild(opt);
    });
  }

  makeSelect.addEventListener('change', updateModelOptions);
  if (makeSelect.value) { updateModelOptions(); }
});
