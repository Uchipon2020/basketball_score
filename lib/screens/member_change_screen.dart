import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../member/teams.dart';

class MemberChangeScreen extends StatefulWidget {
  late int counter;
  MemberChangeScreen({Key? key, required this.counter}) : super(key: key);
  @override
  MemberChangeScreenState createState() => MemberChangeScreenState();
}
class MemberChangeScreenState extends State<MemberChangeScreen> {

  TextEditingController numberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  late String changedName;
  late String changedNumber;

  @override
  Widget build(BuildContext context) {
    var membersB = Teams().teamB;
    numberController.text = membersB[widget.counter]['背番号'].toString();
    nameController.text = membersB[widget.counter]['name'];

    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      insetPadding: const EdgeInsets.only(left: 8.0 ,top:10.0,right: 8.0),
      content: SizedBox(
        width: 500.0,
        height: 200,
        child: Scaffold(
          /*appBar: AppBar(
            centerTitle: true,
            title: const Text('背番号・名前変更'),
          ),*/
          body: Padding(
            padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 25.0,),
            child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 60.0,
                        child: Card(
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            controller: numberController,
                            onChanged: (value) {
                             changedNumber  = numberController.text;
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            controller: nameController,
                            onChanged: (value) {
                              changedName = nameController.text;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        membersB[widget.counter]['name'] = 'takeshi';
                        membersB[widget.counter]['背番号'] = 3;
                      });
                      Navigator.pop(context);
                    },
                    child: const Text('変更終了'),
                  ),
                ],
              ),
          ),
          ),
        ),
    );
  }
}
