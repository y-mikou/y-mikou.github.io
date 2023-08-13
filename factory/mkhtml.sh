#!/bin/bash
export lang=ja_jp.utf-8

#################################################
# pandocコマンドを使用して、mdからhtmlをつくる
# .mdファイルと拡張子部分以外同名の.htmlファイルを、pandocで変換作成する。
# pandocがインストールされていて、'pandoc'コマンドにパスが通っていないと使えない。
#   引数1:.mdファイルの置かれているディレクトリのパス
#   引数2:.htmlファイルを出力するディレクトリのパス
# ※引数2つとも必須
# ※引数1、2のパスともに存在しないとエラー(自動的にディレクトリは作らない)
#################################################

cmdret=$(type pandoc)

if [[ ! ${cmdret%%/*} == 'pandoc is ' ]]; then
  echo 'Pandoc がコマンドとして認識されません。'
  echo 'Pandoc がインストールされており、pathが通っていることを確認してください。'
  exit 1
fi

if [[ ${2} == '' ]]; then
  echo "💩引数が不正です。"
  echo "第1引数:.mdのおいてあるディレクトリ"
  echo "第2引数:.htmlを出力するディレクトリ"
  exit 1
fi

inputPath=${1}
outputPath=${2}
mode=0

echo  -n '実行パス: '
pwd

# 引数のパスの末尾の「/」を補完する。
if [[ ${inputPath: -1} != '/' ]]; then
  inputPath="${inputPath}/"
fi
if [[ ${outputPath: -1} != '/' ]]; then
  outputPath="${outputPath}/"
fi

if [ ! -e ${inputPath} ]; then
  echo "💩 ${inputPath}なんてディレクトリいないです"
  exit 1
fi
if [ ! -e ${outputPath} ]; then
  echo "💩 ${outputPath}なんてディレクトリいないです"
  exit 1
fi

#変換実行
cnt=0
  list=`find ${inputPath} -type f`

for file in ${list}; do
  filename=`basename $file`
  ext=${filename##*.}
  if [[ $ext == "md" ]]; then
    body=${filename%%.*}
    `pandoc ${inputPath}${body}.md -o ${outputPath}${body}.html`
    echo "✓ ${inputPath}${body}.md を ${outputPath}${body}.html として変換・出力しました。"
    cnt=$((cnt+1))
  fi
done

echo "🙌 ${cnt}個のファイルを変換しました。"
echo '終了します'
exit 0