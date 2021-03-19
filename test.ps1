<# GUIFromのサンプル

* 使い方
. .\form.ps1と先頭に書いてスクリプトを実行させておくだけ

* 引数とパラメータ []付きのパラメータは省略できます

GUIFrom -message <メッセージ>
          [-title <タイトル>]
          [-width <横>][-height <縦>]
          [-buttonmessage <決定ボタンのメッセージ>]
          [-list <チェックボックスのリスト>]
#>

. .\form.ps1

$FoodsList = @("ファミチキ","ステーキ","次郎","ダブルチーズバーガー")
$likeFoods = ""

GUIForm -title "テスト" -message "こんにちは"
GUIForm -title "テスト" -message "デカイウィンドウ" -width 900 -height 900


[array](GUIForm -title "テスト" -message "好きな食べ物を選んでください" -list $FoodsList -font "MS 明朝")|%{$likeFoods+=$_+"`n"}
if ($likeFoods -ne "`n"){
    GUIForm -title "テスト" -message $likeFoods"がお好きなんですね" -buttonMessage "そうです"
}else{
    GUIForm -title "Error" -message "どれにもチェックが入りませんでした"
}