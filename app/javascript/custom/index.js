// 診療曜日ラベルチェック
function updateLabelClasses() {
  console.log("updateLabelClasses was called");
  document.querySelectorAll('.weekday-label').forEach(function(label) {
    var checkbox = document.getElementById(label.getAttribute('for'));
    if (checkbox.checked) {
      label.classList.add('checked-label');
    } else {
      label.classList.remove('checked-label');
    }
  });
}

document.addEventListener('DOMContentLoaded', function() {
  updateLabelClasses();
});

document.addEventListener('turbo:load', function() {
  // ページ遷移後の適切なタイミングでラベルクラスを更新
  setTimeout(function() {
    updateLabelClasses();
    document.querySelectorAll('.weekday-label').forEach(function(label) {
      var checkbox = document.getElementById(label.getAttribute('for'));

      // ラベルをクリックしたときにチェックボックスの状態を反映
      label.addEventListener('click', function() {
        setTimeout(function() { // チェックボックスの状態が更新されるのを待つ
          if (checkbox.checked) {
            label.classList.add('checked-label');
          } else {
            label.classList.remove('checked-label');
          }
        }, 0);
      });
    });
  }, 100);  // 100ミリ秒後に実行
});

// turbo:render イベントリスナー
document.addEventListener('turbo:render', function() {
  updateLabelClasses();
});

// 診療曜日ラベルチェック
