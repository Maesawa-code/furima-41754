const price = () => {

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
  
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");
  
    if (inputValue) {
      const tax = Math.floor(inputValue * 0.1); 
      const profit = inputValue - tax; 
  
      addTaxDom.innerHTML = tax; 
      profitDom.innerHTML = profit; 
    } else {
      addTaxDom.innerHTML = "0";
      profitDom.innerHTML = "0";
    }
  });
 };
 
 window.addEventListener("turbo:load", price);
 window.addEventListener("turbo:render", price);