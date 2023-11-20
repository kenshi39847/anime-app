# アプリケーション名
No Netabare Anime Life


# アプリケーション概要
アニメに関するネタバレを避けつつ、アニメの情報を得ることができます。


# URL
https://anime-app-0wl4.onrender.com/


# テスト用アカウント
・Basic認証パスワード：2222  
・Basic認証ID：admin  
〇テスト用アカウント1  
・メールアドレス：test1@example.com  
・パスワード：kt12345  
〇テスト用アカウント2  
・メールアドレス：test2@example.com  
・パスワード：kt123456  

# 利用方法
### アニメ投稿
1.トップページ（一覧ページ）のヘッダーからユーザー新規登録を行います  
2.新規投稿ボタンから、アニメの内容（アニメタイトル・アニメの画像・あらすじ・ジャンル・良いところ・どんな人におすすめか・アニメを観た感想）を入力し、投稿します。  
### コメントや質問をする
1.質問したいアニメ投稿をクリックし、詳細ページへ遷移します。  
2.コメント入力欄からコメントや質問をします。
### ネタバレボタンをクリックする
1.アニメ投稿をクリックし、詳細ページへ遷移します。  
2.内容を見てネタバレと思ったら、「ネタバレ！」をクリックします。


# アプリケーションを作成した背景
面白いアニメを探そうとしたときに、そのアニメのどこが良いのか、どんな人におすすめなのかをネタバレ無しで知りたいと思いました。なので、ネタバレを避けたいという人のために、他の人にネタバレ無しでおすすめしてもらえたり、おすすめしてもらった人にスレッドのような形式で質問できるアプリケーションを開発することにしました。


# 洗い出した要件
https://docs.google.com/spreadsheets/d/1uUXSaH9SH_AFsS83MqFVDaH-cQ26J2G-/edit?usp=sharing&ouid=105158140806080467471&rtpof=true&sd=true

# 実装した機能について
### ユーザー管理機能
ヘッダーの右上から新規登録/ログインすることができます。  
[![Image from Gyazo](https://i.gyazo.com/344a28ce4d960c1743d7a184aeac191d.png)](https://gyazo.com/344a28ce4d960c1743d7a184aeac191d)  
[![Image from Gyazo](https://i.gyazo.com/7e004dc189c5e380530d9d8e2ce87ae2.png)](https://gyazo.com/7e004dc189c5e380530d9d8e2ce87ae2)  

ログイン状態でヘッダーの右上の「ニックネーム」をクリックするとマイページへ遷移することができます。  
[![Image from Gyazo](https://i.gyazo.com/52f323a4be01a4c435356f62d59cb6af.png)](https://gyazo.com/52f323a4be01a4c435356f62d59cb6af)  


### アニメ一覧機能  
トップページにて投稿されたアニメの一覧が表示されます。  

[![Image from Gyazo](https://i.gyazo.com/74f9ff5d44ff0b2feb1d4f275f7576d8.png)](https://gyazo.com/74f9ff5d44ff0b2feb1d4f275f7576d8)  


### アニメ投稿機能
トップページの「新規投稿」ボタンをクリックするとアニメ投稿ページが開き、アニメを投稿することができます。  
[![Image from Gyazo](https://i.gyazo.com/ffddde91271563950ad114d10f3d9157.png)](https://gyazo.com/ffddde91271563950ad114d10f3d9157)  


### アニメ編集機能
ログイン状態かつ自分の投稿ならば、編集ページへ遷移することができます。また、1度編集を行うと、一覧ページ、マイページ、検索ページ、詳細ページに「編集済み」という文字が現れます。  
[![Image from Gyazo](https://i.gyazo.com/5e4eee6916692e3ca5d2505501d6d8ea.png)](https://gyazo.com/5e4eee6916692e3ca5d2505501d6d8ea)  


### アニメ削除機能
ログイン状態かつ自分の投稿ならば、投稿したアニメを削除することができます。  
[![Image from Gyazo](https://i.gyazo.com/85e2a4ea03517388b338f89f603aa685.png)](https://gyazo.com/85e2a4ea03517388b338f89f603aa685)  

[![Image from Gyazo](https://i.gyazo.com/0b24c165026dad3064c0b7cd3ebb1b35.png)](https://gyazo.com/0b24c165026dad3064c0b7cd3ebb1b35)  


### アニメ詳細機能
投稿されたアニメをクリックすると詳細ページへ遷移することができます。  
[![Image from Gyazo](https://i.gyazo.com/ab53aeb893733cbaab0b544a01d372f2.png)](https://gyazo.com/ab53aeb893733cbaab0b544a01d372f2)  


### アニメ検索機能
トップページから投稿されたアニメの検索をすることができます。  
[![Image from Gyazo](https://i.gyazo.com/a31422c3aa00564c7572967af887081e.png)](https://gyazo.com/a31422c3aa00564c7572967af887081e)  


### コメントと質問機能
詳細ページでは投稿されたアニメに対して、コメントや質問ができます。また、そのコメントに対して返信することもできます。  
[![Image from Gyazo](https://i.gyazo.com/1a14eeb18b4295064e57b23518802ae8.png)](https://gyazo.com/1a14eeb18b4295064e57b23518802ae8)  


### ネタバレカウント機能
ネタバレカウント機能とは、投稿したアニメ情報に対して、ネタバレだと感じた人がどのくらいいるかを確認できる機能です。  
アニメ投稿者ではないユーザーが詳細ページを見て、ネタバレだと思った場合にネタバレボタンを押すことで、カウントを増やすことができます。  
まだその詳細ページを見ていないユーザーは一覧ページやマイページ、検索ページにて詳細ページにネタバレがあるかどうか分かるようになります。  
また、アニメ投稿者はカウントの数を見て、自分のアニメ投稿がネタバレだと感じる人がどのくらいいるのかを確認することができます。  
さらに、アニメ投稿者が編集を行うと「編集済み」と表示されます。  
編集後、ネタバレボタンを以前押したユーザーが、詳細ページがもうネタバレではないと感じた場合は再度ネタバレボタンを押すことで、ネタバレカウントを下げることができます。  
[![Image from Gyazo](https://i.gyazo.com/82ca0e9397eb8504b29deaa2634eb4a1.png)](https://gyazo.com/82ca0e9397eb8504b29deaa2634eb4a1)  


# 実装予定の機能
・マイページを装飾する機能  
・フレンド機能  
・DM機能  


# データベースの設計
[![Image from Gyazo](https://i.gyazo.com/e82da951a26b536e007f0aa13b64a2de.png)](https://gyazo.com/e82da951a26b536e007f0aa13b64a2de)  


# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/f2430d42bb49894136073491e2966582.png)](https://gyazo.com/f2430d42bb49894136073491e2966582)  


# 開発環境
・フロントエンド  
・バックエンド  
・インフラ  
・テスト  
・テキストエディタ  
・Ruby  
・Ruby on Rails  
・JavaScript  
・jQuery  
・ActiveStorage  


# ローカルでの動作方法
% git clone https://github.com/kenshi39847/anime-app.git  
% cd anime-app  
% bundle install  
% rails db:create  
% rails db:migrate  


# 工夫したポイント
コメント機能で、それぞれのコメントに対して返信をつけることができました。また、jqueryとアコーディオンメニューを使用することによって、返信入力欄を表示したり、隠したりできるようにしました。  


# 改善点
・「編集済み」という表示が出ると、その文字の分投稿されたアニメがずれているので、修正を行います。  


# 製作時間
2023年11月20日更新  
開発：145時間  

