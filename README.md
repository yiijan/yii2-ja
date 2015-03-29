Yii 2 日本語ドキュメント
========================

## プロジェクト (レポジトリ)

Yii 2 のドキュメントとその日本語翻訳はいくつかのレポジトリに分散して格納されています。
この yiijan organization においては、それらのレポジトリを本家からフォークしてホストしています。

- [yii2](https://github.com/yiijan/yii2) ... フレームワーク本体
    - フレームワークのメッセージ ... framework/messages/ja/yii.php
    - ユーザガイド ... docs/guide-ja/*
    - 開発者ガイド ... docs/internals-ja/*
- [yii2-app-advanced](https://github.com/yiijan/yii2-app-advanced)
- [yii2-authclient](https://github.com/yiijan/yii2-authclient)
- [yii2-bootstrap](https://github.com/yiijan/yii2-bootstrap)
- [yii2-codeception](https://github.com/yiijan/yii2-codeception)
- [yii2-debug](https://github.com/yiijan/yii2-debug)
- [yii2-elasticsearch](https://github.com/yiijan/yii2-elasticsearch)
- [yii2-faker](https://github.com/yiijan/yii2-faker)
- [yii2-gii](https://github.com/yiijan/yii2-gii)
- [yii2-jui](https://github.com/yiijan/yii2-jui)
- [yii2-twig](https://github.com/yiijan/yii2-twig)
- [yii2-mongodb](https://github.com/yiijan/yii2-mongodb)
- [yii2-redis](https://github.com/yiijan/yii2-redis)
- [yii2-smarty](https://github.com/yiijan/yii2-smarty)
- [yii2-sphinx](https://github.com/yiijan/yii2-sphinx)

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
こうすると、Yii 開発チームがワンクリックであなたの変更をマージすることが確実に出来るようになります。

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

あなたのプルリクエストが受け入れられた後、あなたが作業してきたブランチをローカルレポジトリおよび yiijan から削除することが出来ます。

    git checkout master
    git branch -D docs-ja-zyz-translation
    git push origin --delete docs-ja-zyz-translation
