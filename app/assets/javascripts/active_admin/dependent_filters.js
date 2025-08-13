// document.addEventListener("turbo:load", () => {
//   const makeSelect  = document.getElementById("make_select");
//   const modelSelect = document.getElementById("model_select");

//   if (!makeSelect || !modelSelect) return;

//   makeSelect.addEventListener("change", () => {
//     modelSelect.innerHTML = '<option value="">Select Model</option>';

//     if (!makeSelect.value) return;

//     fetch(`/car_models/for_make?make_id=${makeSelect.value}`)
//       .then(res => res.json())
//       .then(data => {
//         data.forEach(item => {
//           const opt = document.createElement("option");
//           opt.value = item.id;
//           opt.text  = item.name;
//           modelSelect.appendChild(opt);
//         });
//       });
//   });
// });