// Flutterのレイアウト構築の方法を学ぶためのサンプルアプリです。
// Flutter公式ドキュメントのBuilding layoutsに沿った実装を行っています。
// ref. https://docs.flutter.dev/ui/layout/tutorial#step-3-implement-the-button-row

import 'package:flutter/material.dart';

// main関数はDartおよびFlutterにおけるエントリーポイントです。mainから処理がはじまります。
// 返却値が`void`キーワードは返却する値がないことを示します（内部で処理するだけの関数）。
// =>: Dartの糖衣構文であり、つまり以下の構文と処理は全く同じです。
// void main() {
//   runApp(const MyApp());
// }
// runApp(): Flutterフレームワークのトップレベル関数。
// 引数としてウィジェットを受け取り、それを画面にアタッチします。
// 基本的に、Flutterにユーザーインターフェースのレンダリングを開始するように指示します。
// つまり、runApp関数を呼び出すことで、Flutterアプリが画面に表示されるようになります。
// 引数として渡されたウィジェットは、アプリのルートウィジェットとなり、画面全体を構成する要素となります。
// この例だとMyAppがRoot Widgetとなります。
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Flutter layout demo';

    // MaterialAppは、Googleが開発したデザインシステムであるMaterial Designを使ったアプリを構築するためのウィジェットです。
    // Material Designはアプリに一貫性のある外観を与えるためのガイドラインを提供します。
    // MaterialAppは、アプリのルートウィジェットとして使用され、アプリ全体のテーマ、ナビゲーション、ローカライズなどを管理します。
    // 例) title: アプリのタイトルを指定します。
    // 例) home: アプリのホーム画面を指定します。
    return MaterialApp(
      title: appTitle,

      // Scaffoldは、Flutterにおける基本的なページレイアウトウィジェットです。
      // アプリの画面の基本構造を提供し、アプリバー、ボトムナビゲーションバー、ドロワー、浮動アクションボタンといった、一般的なUI要素を簡単に配置するための枠組みを提供します。
      // 考えてみてください。ほとんどのアプリは、画面上部にアプリバー（タイトルやアイコンなど）、そして画面の中央に主要なコンテンツを表示します
      // さらに、画面下部にナビゲーションバーがあったり、側面から開くドロワーメニューがあったりすることもあります。
      // これらの要素を個別に実装するのは面倒ですが、Scaffoldを使うことで、それらをまとめて簡単に配置できるのです。
      home: Scaffold(
        // AppBarは、Scaffoldウィジェットの一部であり、画面の上部に表示されるバーです。
        // 通常、アプリのタイトル、ナビゲーションアイコン、アクションボタンなどを含みます。
        // AppBarは、Material Designのガイドラインに従って設計されており、アプリに一貫性のある外観を与えます。
        // 例)title: AppBarに表示するタイトルを指定します。
        // 例)actions: AppBarの右側に表示するアクションボタンのリストを指定します。
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              ImageSection(
                image: 'images/lake.jpg',
              ),
              // テキストやスターアイコンを横に並べた塊をTitleSectionという塊で表現します。
              // buildメソッドの中にこのように記述します。Container配下に複雑なWidgetがネストされていますが、
              // それらを`titleSection`という変数に代入しているのがこちらの記述です。
              // このように記述することで、buildメソッドの中身がすっきりと見やすくなります。
              // ref. https://docs.flutter.dev/ui/layout/tutorial#add-the-title-section
              TitleSection(
                name: 'Oeschinen Lake Campground',
                location: 'Kandersteg, Switzerland',
              ),
              ButtonSection(),
              TextSection(
                description:
                    'Lake Oeschinen lies at the foot of the Blüemlisalp in the '
                    'Bernese Alps. Situated 1,578 meters above sea level, it '
                    'is one of the larger Alpine Lakes. A gondola ride from '
                    'Kandersteg, followed by a half-hour walk through pastures '
                    'and pine forest, leads you to the lake, which warms to 20 '
                    'degrees Celsius in the summer. Activities enjoyed here '
                    'include rowing, and riding the summer toboggan run.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.name,
    required this.location,
  });

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  location,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('41'),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonWithText(
            color: color,
            icon: Icons.call,
            label: 'CALL',
          ),
          ButtonWithText(
            color: color,
            icon: Icons.near_me,
            label: 'ROUTE',
          ),
          ButtonWithText(
            color: color,
            icon: Icons.share,
            label: 'SHARE',
          ),
        ],
      ),
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(
        description,
        softWrap: true,
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: 600,
      height: 240,
      fit: BoxFit.cover,
    );
  }
}
