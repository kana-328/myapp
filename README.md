# アプリケーションの概要

ペットの体調管理、ホテル等の予約をカレンダー表示できるサービス。
オーナー様に体調の様子のメールを簡単に送ることができます。

# 機能
☆朝昼夜を分け体調管理表記入できる<br>
☆管理表の内容をオーナー様に送信できる<br>
☆体重を記入しグラフ化して見れる(chart.jsで表示)<br>
☆予約をカレンダー表示し混み具合を確認できる(fullcalender使用)<br>
☆本日予約が入っているペットを一覧表示<br>
☆顧客一覧表示、検索(Ransack使用)<br>
☆ペット登録<br>
☆ログイン機能(devise使用)<br>
☆CSV出力<br>

# 環境
#### フレームワーク<br>
☆Ruby on Rails<br>
☆Bootstrap<br>
#### インフラ<br>
☆AWS EC2<br>
☆Docker<br>
#### データベース<br>
☆AWS RDS<br>
☆postgreSQL<br>
#### アプリケーションサーバー<br>
☆Unicorn<br>
#### Webサーバー<br>
☆Nginx<br>
#### テスト
Rspec
