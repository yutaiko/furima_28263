$(function(){
  $('#item_price').change(function(){ //金額のフォーカスがはずれたら発火
    let value = $('#item_price').val();
    let fee = Math.round(value * 0.1)
    let income = (value - fee)
    let errorMessage = "価格を修正してください" 
    if (value < 10000000 && value  >=  300){
      $('#add-tax-price').html(fee)
      $('#profit').html(income)
    }else {
      $('#add-tax-price').html(errorMessage)
      $('#profit').html(errorMessage)
    }
  })
});