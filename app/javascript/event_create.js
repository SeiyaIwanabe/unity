$(function() {
  $('#new-event').click(function(event) {
    if(!confirm('本当にこのイベントを作成しますか？')){
      // キャンセルの処理
      alert("イベントの作成をキャンセルしました。")
      return false; // 処理を終了する
    } else {
      // OKの処理
      alert("イベントの作成が完了しました！");
    }
  });
});