# ブラッシュアップ変更点まとめ

## 新規ファイル

### `lib/models/player.dart`
- `Map<String,dynamic>` で管理していたプレイヤーデータを型安全な `Player` クラスに置き換え
- フィールド: `number`（背番号）、`name`（名前）、`foul`（ファール数）、`goal`（得点数）
- `copyWith` メソッドを用意し、一部フィールドだけ変更したコピーを作れるようにした

### `lib/screens/member_change_screen.dart`
- `memberB_change_screen.dart`（AlertDialog形式）と`memberA_change_screen2.dart`（Scaffold in Dialog で壊れていた）を統合
- クラス名を `MemberChangeScreen` に統一
- `Player` オブジェクトを受け取り、編集後の `Player` を返すシンプルな設計に変更
- `TextEditingController` を `initState` で初期化・`dispose` で解放するよう修正
- 「キャンセル」ボタンを追加
- 番号フィールドに `keyboardType: TextInputType.number` を追加

---

## 変更ファイル

### `pubspec.yaml`
- Dart SDK: `>=2.18.6 <3.0.0` → `>=3.0.0 <4.0.0`（Dart 3対応）
- `flutter_lints`: `^2.0.0` → `^4.0.0`

### `lib/main.dart`
- 未使用の `teama_set.dart` のimportを削除
- `primarySwatch: Colors.blue`（非推奨）→ `ColorScheme.fromSeed(seedColor: Colors.blue)`
- `useMaterial3: true` を追加（Material 3対応）
- アプリタイトルを `'Flutter Demo'` → `'バスケットボールスコア'` に変更

### `lib/member/teams.dart`
- `Player` モデルを使用するよう変更
- インスタンスフィールド → `static getter` に変更（呼び出し側が毎回 `Teams()` をnewしなくてよい）
- データを `List.generate` で簡潔に生成するよう変更

### `lib/screens/top_screen.dart`
- `Key? key` + `super(key: key)` → `super.key`（Dart 3スタイル）
- `List<Map>` → `List<Player>` に変更
- `TextEditingController` に `dispose` を追加（メモリリーク防止）
- `TeamBSet` にも `teamsBMain` を渡し、戻り値を受け取るよう修正（以前はTeamBの変更が保存されなかったバグ）
- ナビゲーション処理を `_navigateToTeamA`・`_navigateToTeamB`・`_navigateToRecord` メソッドに分離してbuildをすっきりさせた
- `hintText` でプレースホルダーを表示するよう改善

### `lib/screens/teama_set.dart`
- `BackButton` クラス名がFlutter組み込みの `BackButton` と衝突していた問題を修正 → `IconButton` + `Icons.arrow_back` に置き換え
- `List<Map>? teams` の型が曖昧だった問題を修正 → `final List<Player> teams` に変更
- `TeamASet({Key? key, required teams})` でteamsの型アノテーションが抜けていたバグを修正
- `widget.teams` を `initState` でローカルコピーに移し、`setState` 内での変更を安全にした
- `MemberChangeBScreen`（TeamB用）を誤って使っていた → 統合した `MemberChangeScreen` に変更
- `_editPlayer(int index)` メソッドにナビゲーション処理を集約
- 未使用import（`dart:core`、`rendering`）を削除

### `lib/screens/teamb_set.dart`
- `List<Player> teams` パラメータを追加（以前はTeamBが自前で `Teams().teamB` を生成しており、TopScreenのデータと完全に切れていた）
- `BackButton` を `IconButton` に統一（teama_setと同じ対応）
- 壊れていた `DialogUtils`・`MemberChangeAScreen` を削除し、`MemberChangeScreen` に統一
- 使われていなかった `_flag`・`regularCount`・`inputCheck` の状態変数を削除
- `super.key` に対応

### `lib/screens/memberB_change_screen.dart`
- 実装を `member_change_screen.dart` に移動し、後方互換のためのre-exportファイルに変更

### `lib/screens/memberA_change_screen2.dart`
- Scaffold を AlertDialog の content 内に置くという壊れた実装を廃止
- `build` 内で `TextEditingController.text` を直接セットしていた問題（毎回リセットされる）を廃止
- `Teams().teamB` をteamA画面で使っていたバグを廃止
- `member_change_screen.dart` へのre-exportファイルに変更

### `lib/screens/goal_screen.dart`
- `Key? key` → `super.key`

### `lib/screens/main_screen.dart`
- 未使用import（`dart:ui`、`package:flutter/services.dart`）を削除
- `super.key` に対応

### `lib/screens/foul_screen.dart`
- AppBar title が `'TOP SCREEN'` になっていたバグを修正 → `'記録画面'`
- `super.key` に対応
