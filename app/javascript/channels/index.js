// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

function price(){
  const item_price = document.getElementById("item-price");
  const add_tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

    item_price.addEventListener("keyup", () => {
        const sum_price = item_price.value; 
        
        let fee = Math.floor(sum_price / 10)
        let gains = sum_price - fee;
        add_tax.textContent = fee;
        profit.textContent = gains;
  });
  
  }
  window.addEventListener('load', price);