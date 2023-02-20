import 'dart:core';
import 'package:basketball_score/member/teams.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'member_change_screen.dart';

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
            return Row(
              children: [
                SizedBox(
                  width: 60.0,
                  child: Card(
                    child: ListTile(
                        title: Text(
                      '${membersB[index]['背番号']}',
                      textAlign: TextAlign.center,
                    )),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context)
                              => MemberChangeScreen(counter:index)),
                        );
                        setState(() {

                        });
                      },
                      title: Text('${membersB[index]['name']}'),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
