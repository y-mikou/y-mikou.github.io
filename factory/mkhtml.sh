#!/bin/bash
export lang=ja_jp.utf-8

#################################################
# pandocコマンドを使用して、mdからhtmlをつくる
# .mdファイルと拡張子部分以外同名の.htmlファイルを、pandocで変換作成する。
# pandocがインストールされていて、'pandoc'コマンドにパスが通っていないと使えない。
#   引数1:.mdファイルのパス
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
  echo "第1引数:.mdファイルのパス"
  echo "第2引数:.htmlを出力するディレクトリ"
  exit 1
fi

inputPath=${1}
outputPath=${2}
mode=0

echo  -n '実行パス: '
pwd

# 引数のパスの末尾の「/」を補完する。
if [[ ${outputPath: -1} != '/' ]]; then
  outputPath="${outputPath}/"
fi

if [ ! -f ${inputPath} ]; then
  echo "💩 ${inputPath}なんてファイルいないです"
  exit 1
fi
if [ ! -e ${outputPath} ]; then
  echo "💩 ${outputPath}なんてディレクトリいないです"
  exit 1
fi

#変換実行
filename="$(basename $inputPath)"
body="${filename%%.*}"
`pandoc ${inputPath} -f markdown --template=templateMd2Html.html -o ${outputPath}${body}.html`
echo "✓ ${inputPath} を ${outputPath}${body}.html として変換・出力しました。"

echo "🙌 ファイルを変換しました。"
echo '終了します'
exit 0