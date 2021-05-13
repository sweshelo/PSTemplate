# touch
# Linuxのtouchみたいなことをする

$param = $Args[0]
if (Test-Path $param){
    # ファイルのタイムスタンプ更新
    (Get-Item $param).LastWriteTime = Get-Date;
}else{
    #ファイル作成
    New-Item $param
}
