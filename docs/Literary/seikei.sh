#--------------------------------
# mdファイル整形。
# ##で始まる章区切りの、エッチシーンでの♥化と番号付与は手動
#--------------------------------
tgtFile=$1                                                                                      #引数で指定されたファイルを対象とする
destFile=${tgtFile/".md"/"2.md"}                                                                #末尾に2をつけたファイルへ整形して出力する
touch $destFile                                                                                 #出力先ファイルを生成
sed       '/^$/d' $tgtFile > $destFile                                                          #空行を削除し、別ファイルへ。以降は別ファイルを操作する
sed -i -z 's/\(\&emsp\;[^\n]\+\)\n/\1<\/br>\n/g' $destFile                                      #行頭全角スペースで始まる末尾に</br>タグを付与
sed -i -z 's/\([」）]\)/\1<\/br>/g' $destFile                                                   #」か）で終わる行の末尾に</br>タグを付与
sed -i    's/\(—\{1,2\}.\+\)/\1<\/br>/g' $destFile                                              #―で始まる行の末尾に</br>タグを付与
sed -i -z 's/—\{2\}/——/g' $destFile                                                             #3つ以上の―を2つに集約
sed -i -z 's/\(——[^<\/br>]\+<\/br>\)\n\(&emsp;\)/\1\n\n\2/g' $destFile                          #―で始まる行の次の行が地の文の場合、空行を挿入する
sed -i -z 's/<div class="info">\n*「\([^\n]\+\)」/<div class="info">\n\1/g' $destFile           #info内の作品名称から「」を削除
sed -i -z 's/<div class="info">\n\+\([^\n]\+\)\n\+\([^\n]\+\)\n\+\([^\n]\+\)\n\+<\/div>/<div class="info">\n\1<\/br>\n\2<\/br>\n\3<\/br>\n<\/div>\n\n---\n\n<\/br>\n<\/br>\n<\/br>\n/g' $destFile
                                                                                                #info内整形
sed -i -z 's/\([」）]\)<\/br>\n&emsp;/\1<\/br>\n\n\&emsp;/g' $destFile                          #」か）で改行して全角スペースとなる境界に空行を挿入する
sed -i -z 's/\([^」）]<\/br>\)\n\([「（]\)/\1\n\n\2/g' $destFile                                #」でも）でもない文字で改行し「で始まる行との境界に空行を挿入する
sed -i -z 's/[^\n]\n\(—\+[^\n]\+\)\n/\n\n\1\n/g' $destFile                                      #―で始まる行の前が空行でない場合、空行を挿入する
sed -i -z 's/^\(—\+[^(<\/br>)\n]\+\)\n\+\([^「（]\)/\1<\/br>\n\n\2/g' $destFile                 #―で始まる行の後ろが「でも（でもない場合、空行を追加する
sed -i -z 's/<div class=\"afterword\">/\n<\/br>\n<\/br>\n<\/br>\n\n---\n\n\#\# 後記・コメント\n<details>\n<summary>あとがき<\/summary>/g' $destFile
                                                                                                #後記・コメント領域の整形
sed -i -z 's/【\([0-9]\)/\n【\1/g' $destFile                                                    #コメントを一人毎に空行挿入する
sed -i -z 's/<\/div>\n\+<div class=\"comments\">/<\/details>\n<details open>\n<summary>コメント<\/summary>\n<details>\n<summary>夜伽現存当時のコメント<\/summary>\n/g' $destFile
                                                                                                #コメント欄の整形
sed -i -z 's/\(<\/div>\)*\n*---\(<\/br>\)*\n::: tip おてがみちょーだいっ\s*\(<\/br>\)*\nコメントなど貰えるとと喜びます\(<\/br>\)*\n>\sコメントは承認されるまで反映されません\n<staticcomments\/>\n:::/<\/details>\n<\/details>\n\n---\n\n::: tip おてがみちょーだいっ\n\nコメントなど貰えるとと喜びます<\/br>\n\n> コメントは承認されるまで反映されません\n\n<staticcomments\/>\n\n:::/g' $destFile
                                                                                                #作品末尾の整形修正
sed -i -z 's/-\{4,\}/\n/g' $destFile                                                            #-4つを超える反復は<hr>ではないとみなし削除
sed -i -z 's/\([^\n]\)\n---\n/\1\n\n---\n/g' $destFile                                          #---の前後に改行を調整
sed -i -z 's/<\/div>\n\+\(<\/br>\n\)*---\(.+\n\)*\(<\/br>\n\)*/<\/div>\n\n---\n/g' $destFile    #---の前後に改行を調整
sed -i -z 's/◆[<\/br>]*/\n<\/br>\n<\/br>\n<\/br>\n\n## □\n/g' $destFile                         #章区切りをmd用に修正
sed -i -z 's/<\/br>\n^\n<\/br>/<\/br>/g' $destFile                                              #空行を挟んだのみの</br>タグを一つに集約
sed -i -z 's/\(<\/br>\n\)\{4,\}/<\/br>\n<\/br>\n<\/br>\n/g' $destFile                           #4つ以上反復する</br>を3つに集約
sed -i -z 's/<\/div>\n\([^\n]\)/<\/div>\n\n\1/g' $destFile                                      #</div>のあとに空行がない場合、空行を挿入
sed -i -z 's/\n\{3,\}/\n\n/g' $destFile                                                         #3つ以上の改行が連続(空行が2連続)の場合、空行1つに集約
sed -i -z 's/\(投稿日時:[^\n]\+\)<\/br>/\1/g' $destFile                                         #投稿日時で始まる行の末尾から</br>タグを削除
sed -i -z 's/<div class=\"info\">\n\+\([^\n]\+\)<\/br>/---\ntitle: \1\nsidebar: auto\n---\n<div class=\"info\">\n\1<\/br>/g' $destFile
                                                                                                #ymlヘッダを付与
sed -i -z 's/<\/summary>\n<\/br>\n\+<\/br>/<\/summary>\n/g' $destFile                           #</summary>のあとに無用な改行がある場合削除
sed -i -z 's/\(<\/br>\)\+/<\/br>/g' $destFile                                                   #</br>タグが改行を挟まず連続している場合、一つに集約
sed -i -z 's/\(title: [^<]\+\)<\/br>/\1/g' $destFile                                            #タイトル末尾に</br>タグがどっかでついてしまっているので除去
sed -i -z 's/\([！？]\)\([^　！？」）—<\/br>\n]\)/\1　\2/g' $destFile                           #！？のあとに全角スペースが含まれていない場合追加。ただし直後が特定の文字の場合は入れない