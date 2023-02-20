import 'dart:core';
import 'package:basketball_score/member/teams.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TeamSet extends StatefulWidget {
  const TeamSet({Key? key}) : super(key: key);
  @override
  State<TeamSet> createState() => _TeamSetState();
}
class _TeamSetState extends State<TeamSet> {
  var membersA = Teams().teamA;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('濃　チーム'),
        backgroundColor: Colors.indigo,
      ),

      body: Container(
        alignment: Alignment.center,
        child: ListView.builder(
          itemCount: membersA.length,
          itemBuilder: (BuildContext context, int index) {
            //var key = members.keys.elementAt(index);
            return Row(
              children: [
                SizedBox(
                  width: 60.0,
                  child: Card(
                    child: ListTile(
                      title: Text('${membersA[index]['背番号']}',
                          textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: ListTile(
                      title: Text('${membersA[index]['name']}'),
                    ),
                  ),
                ),
                SizedBox(
                  width: 60.0,
                  child: Card(
                    child: ListTile(
                      title: Text('${membersA[index]['背番号']}',
                        textAlign: TextAlign.center,
                      ),
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
