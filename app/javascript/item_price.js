window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");

  priceInput.addEventListener("input", () => {
    const addTaxDom = document.getElementById("add-tax-price");
    const price = parseFloat(priceInput.value); // 入力値を浮動小数点数に変換
    const tax = Math.floor(price * 0.1); // 税金を計算し切り捨て
    addTaxDom.innerHTML = tax;

    const addProfitDom = document.getElementById("profit");
    const profit = Math.floor(price - tax); // 利益を計算し切り捨て
    addProfitDom.innerHTML = profit;
  });
});