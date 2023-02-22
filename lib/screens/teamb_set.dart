import 'dart:core';
import 'package:basketball_score/member/teams.dart';
import 'package:basketball_score/screens/memberA_change_screen2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'memberB_change_screen.dart';

class TeamBSet extends StatefulWidget {
  const TeamBSet({Key? key}) : super(key: key);
  @override
  State<TeamBSet> createState() => _TeamBSetState();
}

class _TeamBSetState extends State<TeamBSet> {
  var membersB = Teams().teamB;
  bool _flag = false;
  int regularCount = 0;
  bool inputCheck = false;

  void _handleCheckbox(bool? e) {
    e! ? regularCount = regularCount + 1 : regularCount = regularCount - 1;
    if (regularCount > 4) {
      inputCheck = true;
    }
    setState(() {
      _flag = e;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            itemCount: membersB.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.white38,
                child: Row(children: [
                  SizedBox(
                    width: 60.0,
                    child: Card(
                      child: ListTile(
                        onTap: () async {
                          var result = await Navigator.push<List<dynamic>?>(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MemberChangeBScreen(counter: index),
                            ),
                          );
                          reloaded(index, result!);
                        },
                        title: Text(
                          '${membersB[index]['背番号']}',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: ListTile(
                        onTap: () async {
                          final result = await DialogUtils.showEditingDialog(
                              context, index);
                          /*var result = await Navigator.push<List<dynamic>?>(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MemberChangeBScreen(counter: index)),
                          );*/
                          setState(
                            () {
                              membersB[index]['name'] = result;
                            },
                          );
                          //reloaded(index, result!);
                        },
                        title: Text('${membersB[index]['name']}'),
                      ),
                    ),
                  ),
                ]),
              );
            },
          )),
    );
  }

  void reloaded(int index, List<dynamic> result) {
    setState(() {
      membersB[index]['name'] = result[1];
      membersB[index]['背番号'] = result[0];
      debugPrint('popの戻り値+ ${result[1]}');
      debugPrint('中のデータベース+ ${membersB[index]['name']}');
    });
  }
}

class DialogUtils {
  DialogUtils._();

  static Future<MemberChangeAScreen> showEditingDialog(
    BuildContext context,
    int index,
  ) async {
    return MemberChangeAScreen(counter: index);
  }
}
