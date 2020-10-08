window.addEventListener("load", function() {
  let btn = document.getElementById("JoinEvent");

  btn.addEventListener("click", function() {
    let result = window.confirm('本当にこのイベントに申し込みますか？');
    
    if( result ) {
        console.log('イベントへの申し込みが完了しました！');
    }
    else {
        console.log('イベントへの申込みをキャンセルしました。（次は申し込んでね、、）');
    }
  });
});