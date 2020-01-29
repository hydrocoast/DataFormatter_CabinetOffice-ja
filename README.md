<p align="center">
<img src="https://github.com/hydrocoast/DataFormatter_CabinetOffice-ja/blob/master/img/format_img.png", width="800">
</p>  

# 内閣府中央防災会議のデータフォーマット変換ツール
## 概要
このパッケージは，[内閣府 南海トラフの巨大地震モデル検討会](http://www.bousai.go.jp/jishin/nankai/model/data_teikyou.html)
等が公開している固定長形式のデータ(10f8.2)を，メッシュデータへ変換するものです．

## 使い方
- [G空間情報センター](https://www.geospatial.jp/gp_front/)から地形データ等の内閣府 中央防災会議の公開データを取得してください．
- 各言語のディレクトリ内に `test_read`+拡張子 と名前のつくファイルがあり，このファイルでテストの実行が可能です．
いずれの言語についても`formatter()`という関数またはサブルーチンを使用します．入力引数は共通で`formatter(ファイルパス, x方向メッシュ数, y方向メッシュ数)`です．


## Pull request について
バグ報告や改善提案については，issueに投稿お願いします．些細なことは直接 pull request で構いません．  
新たな言語を追加したい場合は，言語名がわかるようなディレクトリ(例えば`python`)を作成し，
メッシュデータに整形する関数を記述したファイルと，テスト実行用のファイルを追加してください．


## License
MIT

## Author
Takuya MIYASHITA (宮下 卓也)  
miyashita (at) hydrocoast.jp  
