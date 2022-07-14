// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price")
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));
    const priceOutput = document.getElementById("profit");
    priceOutput.innerHTML = (Math.floor(inputValue - addTaxDom.innerHTML));
  })
});