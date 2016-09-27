Yii 2 日本語ドキュメント
========================

## プロジェクト (レポジトリ)

Yii 2 のドキュメントとその日本語翻訳はいくつかのレポジトリに分散して格納されています。
この yiijan organization においては、それらのレポジトリを本家からフォークしてホストしています。

- フレームワーク本体
    - [yii2](https://github.com/yiijan/yii2)
        - フレームワークのメッセージ ... framework/messages/ja/yii.php
        - ユーザガイド ... docs/guide-ja/*
        - 開発者ガイド ... docs/internals-ja/*
- アプリケーションテンプレート
    - [yii2-app-advanced](https://github.com/yiijan/yii2-app-advanced)
- 公式エクステンション
    - [yii2-authclient](https://github.com/yiijan/yii2-authclient)
    - [yii2-bootstrap](https://github.com/yiijan/yii2-bootstrap)
    - [yii2-codeception](https://github.com/yiijan/yii2-codeception)
    - [yii2-debug](https://github.com/yiijan/yii2-debug)
    - [yii2-elasticsearch](https://github.com/yiijan/yii2-elasticsearch)
    - [yii2-faker](https://github.com/yiijan/yii2-faker)
    - [yii2-gii](https://github.com/yiijan/yii2-gii)
    - [yii2-httpclient](https://github.com/yiijan/yii2-httpclient)
    - [yii2-jui](https://github.com/yiijan/yii2-jui)
    - [yii2-mongodb](https://github.com/yiijan/yii2-mongodb)
    - [yii2-redis](https://github.com/yiijan/yii2-redis)
    - [yii2-smarty](https://github.com/yiijan/yii2-smarty)
    - [yii2-sphinx](https://github.com/yiijan/yii2-sphinx)
    - [yii2-twig](https://github.com/yiijan/yii2-twig)

この **yii2-ja** レポジトリは、これらの日本語翻訳全体に関わる問題を扱います。


## 翻訳作業のワークフロー

翻訳作業については、原則として、次のワークフローを想定しています。

### 1. yiijan に加わる

まずは、yiijan organization に参加してください。
オーナーの誰かにリクエストしてくだされば、invitation を送ります。
資格を求めたりも、義務を課したりもしませんので、お気軽にご参加下さい。

### 2. 開発環境をセットアップする

対象となるレポジトリのフォークをあなたの開発環境にクローンします。
このとき、選択肢として、あなた自身のフォークを github 上に作成してそれをクローンする方法と、yiijan のフォークをクローンする方法があります。

    git clone git@github.com:YOUR-GITHUB-USERNAME/yii2.git

または、

    git clone git@github.com:yiijan/yii2.git

どちらの場合も、本家のレポジトリと yiijan のレポジトリをリモートとして追加する必要があります。

- あなた自身のフォークを作成してクローンする場合
   - 本家のレポジトリを "upstream" という名前でリモートとして追加する
   - yiijan のレポジトリを "yiijan" という名前でリモートとして追加する
- yiijan のフォークをクローンする場合
   - 本家のレポジトリを "upstream" という名前でリモートとして追加する
   - yiijan のレポジトリは "origin" という名前で既にリモートとして追加されている

どちらの方法によっても構いません。

yiijan のフォークを使う場合は、ここまでの準備を `clone-yiijan-repos` で行うことができます。

### 3. 作業開始の合図として yiijan のレポジトリに issue を立てる

ひとまとまりの比較的大きな作業をするときは、新規 issue で作業の開始を宣言します。
ただし、タイポの修正など、小さな作業については、issue を立てる必要はありません。

### 4. upstream から最新のドキュメントをフェッチする

    git fetch upstream

### 5. 現在の master ブランチを基にして、新しいブランチを作成する

> これは非常に重要です。
> なぜなら、master ブランチを使うと、そのレポジトリからは一つ以上のプルリクエストを送信することが出来なくなるからです。

独立した修正や変更は、各々、それ自身のブランチに入れるべきです。
ブランチの名前は説明的なものにしてください。 例えば、

    git checkout upstream/master
    git checkout -b docs-ja-xyz-translation

### 6. 翻訳する

作成した新しいブランチで翻訳の作業をします。

### 7. コミットする

以下のコマンドを使って、コミットしたいファイルや変更をステージングエリアに追加します。

    git add path/to/my/file.md

説明的なコミットメッセージを付けて修正をコミットしてください。
このとき、余計な自動テストをスキップするために、コミットメッセージに `[ci skip]` を含めることが推奨されます。

    git commit -m "docs-ja-xyz.md typo fixed [ci skip]"

### 8. 最新のコードを upstream からあなたのブランチにプルする

    git pull upstream master

このステップは、プルリクエストを出す前にあなたのブランチが最新のコードを持っていることを確実にするためのものです。
こうすると、Yii 開発チームが確実にワンクリックであなたの変更をマージすることが出来るようになります。

### 9. yiijan にプッシュする

    git push origin docs-ja-xyz-translation

または

    git push yiijan docs-ja-xyz-translation

上記の 2. の段階で設定したリモートの名称に従って、作業したブランチを yiijan にプッシュしてください。

### 10. yiijan から 本家に対してプルリクエストを発行する

github の yiijan のレポジトリに入って、本家に対して "Pull Request" を発行します。

### 11. yii 開発チームがあなたのブランチをメインブランチにマージする

ドキュメントの日本語翻訳に限定されている限り、プルリクエストが却下される可能性はまずありません。

### 12. クリーンアップする

あなたのプルリクエストが受け入れられた後、あなたが作業してきたブランチをローカルおよび yiijan のレポジトリから削除することが出来ます。

    git checkout master
    git branch -D docs-ja-zyz-translation
    git push origin --delete docs-ja-zyz-translation

## 本家に直接のプルリクエストをすることについて

本家に直接のプルリクエストをすることは、あなたの権利です。
誰もそれを制止する権利を持ちません。
また、何でもかんでも、一緒にやらなければならない訳でもないでしょう。
あなたの好きなやり方で yii プロジェクトに参画して下さい。


## 作業を補助するスクリプト

以下のスクリプトを作業の補助として使用することが出来ます。
(各ツールにはシェルスクリプトバージョンと Windows `*.bat` ファイルバージョンがあります)

### clone-yiijan-repos

GitHub の yiijan グループから、`repo-list.txt` に列挙されたレポジトリをクローンします。
そのとき同時に、upstream に yiisoft 本家のレポジトリを指定します。

### check-docs

特定のレポジトリについて、翻訳の追加や更新が必要な文書(またはその個所)を抽出します。

対象とするレポジトリの名前を引数として与えてください。例えば、
```
./check-docs yii2-gii
```

ただし、対象となるレポジトリは、この yii2-ja レポジトリを格納するディレクトリの兄弟ディレクトリにある必要があります。

結果は、`translation-check` ディレクトリに `<repo-name>.html` 例えば `yii2-gii.html` として格納されます。

このスクリプトは、内部的に、yii/build/build translation コマンドを使用しています。
詳細については、[翻訳ワークフロー](https://github.com/yiisoft/yii2/blob/master/docs/internals-ja/translation-workflow.md) を参照してください。

> 情報: チェック結果の html ファイルは、内容が前回と変化していない場合は、タイムスタンプが変化しません。

> 情報: `yii2` レポジトリに対しては、開発者用内部文書の翻訳も追加でチェックします。結果の html ファイルは `internals.html` です。

### check-all-docs

`repo-list.txt` に列挙されたレポジトリ全てについて、check-docs を実行します。

### check-msg

yii2 レポジトリのソースから、翻訳の対象となるメッセージを抽出して、`yii2/framework/messages/ja/yii2.php` ファイルを更新します。
`config-ja.php` を構成情報として参照します。

このバッチファイルは、内部的に、message/extract コマンドを使用しています。
詳細については、[翻訳ワークフロー](https://github.com/yiisoft/yii2/blob/master/docs/internals-ja/translation-workflow.md) を参照してください。

### update-repo

特定のレポジトリについて、ローカルおよび origin の master ブランチを upstream の master ブランチで更新します。
そして、同時に、そのレポジトリに対して `check-docs` スクリプトを実行します。

対象とするレポジトリの名前を引数として与えてください。例えば、
```
update-repo.bat yii2-gii
```

ただし、対象となるレポジトリは、この yii2-ja レポジトリを格納するディレクトリの兄弟ディレクトリにある必要があります。

### update-all-repos

`repo-list.txt` に列挙されたレポジトリ全てについて、update-repo を実行します。

