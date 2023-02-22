import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'memberB_change_screen.dart';

//チーム名簿変更画面

class TeamASet extends StatefulWidget {
  List<Map>? teams;
  TeamASet({Key? key,required teams}) : super(key: key);
  @override
  State<TeamASet> createState() => _TeamASetState();
}

class _TeamASetState extends State<TeamASet> {
  int regularCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        //自動ではなく、戻るボタンを押しただけで、更新された名簿情報丸々戻す。
        leading: BackButton(reloadTeams: widget.teams,),//バックボタンクラスへジャンプ
        title: const Text(
          '淡　チーム',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.cyanAccent,
      ),
      body: Container(
        alignment: Alignment.center,
        child: ListView.builder(
          itemCount: widget.teams!.length,
          //このindexがカードの並び順を示す。重要。
          itemBuilder: (BuildContext context, int index) {
            return Container(
              alignment: Alignment.center,
              color: Colors.white38,
              child: Row(
                children: [
                  SizedBox(
                    width: 60.0,
                    child: Card(
                      child: ListTile(
                          onTap: () async {
                            var result = await Navigator.push<List<dynamic>?>(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MemberChangeBScreen(counter: index)),
                            );
                            reloaded(index, result!);//リロードメソッドへジャンプ（画面更新のメソッド）
                          },
                          title: Text(
                            '${widget.teams![index]['背番号']}',
                            textAlign: TextAlign.center,
                          )),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: ListTile(
                        onTap: () async {
                          var result = await Navigator.push<List<dynamic>?>(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MemberChangeBScreen(counter: index)),
                          );
                          reloaded(index, result!);
                        },
                        title: Text('${widget.teams![index]['name']}'),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }



  void reloaded(int index, List<dynamic> result) {
    setState(() {
      widget.teams![index]['name'] = result[1];
      widget.teams![index]['背番号'] = result[0];
      debugPrint('popの戻り値+ ${result[1]}');
      debugPrint('中のデータベース+ ${widget.teams![index]['name']}');
    });
  }
}

class BackButton extends StatelessWidget {
  List<Map>? reloadTeams;

  BackButton({Key? key, required reloadTeams}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        child: const Text(
          '<',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 12.0,
          ),
        ),
        onPressed: () {
          Navigator.pop(context, reloadTeams);
        });
  } // 前の画面へ遷移

}