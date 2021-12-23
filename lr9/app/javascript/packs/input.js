document.addEventListener('DOMContentLoaded', function () {
  const form = document.querySelector('#calculation-form');
  const result = document.querySelector('#result');

  if (!form || !result) {
    return;
  }

  form.addEventListener('ajax:success', function (event) {
    const [detail,] = event.detail;

    if (detail.error) {
      result.textContent = detail.error;
    } else {
      result.textContent = `Было: ${detail.query}, стало: ${detail.result}`;
    }
  });
});