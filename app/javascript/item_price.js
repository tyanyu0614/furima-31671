window.addEventListener('load', () => {
  const priceField = document.getElementById("item-price");

  priceField.addEventListener("input", () => {
    
    const priceInput = document.getElementById("item-price");
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1)
  
  
  

  const ProfitDom = document.getElementById("profit");
    ProfitDom.innerHTML = Math.floor(inputValue * 0.9 )
  })
});