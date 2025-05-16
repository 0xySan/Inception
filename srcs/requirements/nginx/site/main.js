function goToPage2() {
  window.location.href = 'page2.html'; // Change this to your target HTML file
}

function goToPage3() {
  window.location.href = 'page3.html'; // Change this to your target HTML file
}

function goToPage1() {
  window.location.href = 'rickroll.html'; // Change this to your target HTML file
}

function goToIndex() {
  window.location.href = 'index.html'; // Change this to your target HTML file
}


const themeSelector = document.getElementById('themeSelector');

themeSelector.addEventListener('change', function() {
  document.documentElement.className = this.value;
});

const img = document.getElementById('pfp');

img.addEventListener('click', function() {
  window.location.href = 'https://duckduckgo.com/?q=Canadian+Marble+Fox&iax=images&ia=images';
});