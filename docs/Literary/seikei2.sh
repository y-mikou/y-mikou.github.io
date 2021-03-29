#--------------------------------
# mdファイル整形2。
# ルビ・圏点・全角スペース
#--------------------------------
tgtFile=$1                                                                                      #引数で指定されたファイルを対象とする
destFile=${tgtFile/".md"/"3.md"}                                                                #末尾に3をつけたファイルへ整形して出力する
touch $destFile                                                                                 #出力先ファイルを生成
sed       's/｜\([^｜]\+\)《\([^《]\+\)》/<ruby>\1<rt>\2<\/rt><\/ruby>/g' $tgtFile > $destFile
sed -i -z 's/《《\([^《]\+\)》》/<span class="emphasis">\1<\/span>/g'     $destFile
sed -i -z 's/　/\&emsp;/g'                                                $destFile