// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
  
channels.keys().forEach(channels)

window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
   priceInput.addEventListener("input", () => {
     const addTaxDom = document.getElementById("add-tax-price");
     addTaxDom.innerHTML = Math.round(priceInput.value * 0.1 );
     const addPofitDom = document.getElementById("profit");
     addPofitDom.innerHTML = Math.round(priceInput.value - Math.round(priceInput.value * 0.1 ))
 })
});