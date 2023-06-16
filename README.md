# swiftProjectNew

### 【快適野営君】

### 【Git 情報】

![GitHub repo size](https://img.shields.io/github/repo-size/SatoruKikuchi123/soro_project_dig_btc_kikuchi)
![GitHub last commit](https://img.shields.io/github/last-commit/SatoruKikuchi123/soro_project_dig_btc_kikuchi)
![GitHub top language](https://img.shields.io/github/languages/top/SatoruKikuchi123/soro_project_dig_btc_kikuchi)
![GitHub language count](https://img.shields.io/github/languages/count/SatoruKikuchi123/soro_project_dig_btc_kikuchi)

---

### 【使用システム】
- Swift UI
- Core Data
- MapKit



<hr>

## システム概要

このシステムは行く時期に応じて最適なキャンプ場一覧を表示します。（注：現在デモデータしか登録されていません）

### 背景

- 【困りごと】行く時期に応じた最適なキャンプ場を選びにくい
  理由 → ナップ等の既存のキャンプ場予約システムには温度情報がない
- 【欲しいシステム】 行く時期に応じた最適なキャンプ場一覧を表示
![image](https://github.com/SatoruKikuchi123/swiftProjectNew/assets/98520065/b7511d2a-00b7-4607-8ac9-dc77d5b516cd)

## 機能

- 行く月に応じて許容最低温度と許容最高温度で絞り込み
- 寒くない順によるソート
- 暑くない順によるソート
- お気に入り順によるソート
- 評価順によるソート
- メモの登録、編集
- お気に入り追加機能
- 予約サイトへのリンク
- 現在位置とキャンプ場ピンドメによる距離感の把握

## データベーススキーマ

<img width="266" alt="image" src="https://github.com/SatoruKikuchi123/swiftProjectNew/assets/98520065/06146ad5-4831-4efd-9dc8-fabf9c007943">

## 学び
学びとして
coredataについて紹介します
CoreDataは、オブジェクトを永続化するためのフレームワークでオブジェクトとリレーショナルデータベースの橋渡し役を担い、データを、SQLiteというRDBに保存します。
また逆に、特定の条件に該当するRDBのレコードをオブジェクトに変換して取得できます。
<img width="716" alt="image" src="https://github.com/SatoruKikuchi123/swiftProjectNew/assets/98520065/f210919c-6000-4f31-a15e-b92cf0987e03">
SQLiteはライブラリの形で提供され、ソフトウェアなどに内蔵されます。これを、「組み込み形式」といいます。
そのため、SQLiteのデータベースとしての利用はソフトウェアだけにとどまります。
一方
psql等の一般的なRDBMSは、データベースを利用したい各ソフトウェアはクライアントとして接続するという方式です。
この方式ですと、同じデータベースを多数のクライアントで共有できます。
使い分けですが
ATMなどの複数の端末からデータベースに操作を試みるようなシステムは、「クライアントサーバ型が向いています。
逆にそのソフトウェア内で完結するようなデータのやり取りをしたい場合は、「組み込み型」が向いています。
<img width="710" alt="image" src="https://github.com/SatoruKikuchi123/swiftProjectNew/assets/98520065/319c80fe-946f-4d09-bf44-1b0b8a689bc4">

<img width="703" alt="image" src="https://github.com/SatoruKikuchi123/swiftProjectNew/assets/98520065/7d4f347c-c74e-4529-af26-64c1cd4c8add">

データベースからデータを取得するコード
<img width="706" alt="image" src="https://github.com/SatoruKikuchi123/swiftProjectNew/assets/98520065/413a5f4b-de69-4b2f-aee0-e2928897c269">

##完成した画面
<img width="406" alt="image" src="https://github.com/SatoruKikuchi123/swiftProjectNew/assets/98520065/c555f819-523f-4874-9d44-1038e81da78f">
<img width="405" alt="image" src="https://github.com/SatoruKikuchi123/swiftProjectNew/assets/98520065/7a4f43c8-fd3d-4336-b3c7-90c2be6b3779">
<img width="413" alt="image" src="https://github.com/SatoruKikuchi123/swiftProjectNew/assets/98520065/879ec5ce-9f46-4a5b-a34f-85a6b44ce7e9">





## 作者

菊地

## 今後の計画

- データ登録
- ユーザ間の評価の共有
