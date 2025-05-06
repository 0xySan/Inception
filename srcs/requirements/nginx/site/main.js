const themeSelector = document.getElementById('themeSelector');

themeSelector.addEventListener('change', function() {
  document.documentElement.className = this.value;
});

const img = document.getElementById('pfp');

img.addEventListener('click', function() {
  window.location.href = 'https://duckduckgo.com/?q=Canadian+Marble+Fox&iax=images&ia=images';
});