import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../member/teams.dart';

class MemberChangeAScreen extends StatefulWidget {
  late int counter;
  MemberChangeAScreen({Key? key, required this.counter}) : super(key: key);
  @override
  MemberChangeAScreenState createState() => MemberChangeAScreenState();
}

class MemberChangeAScreenState extends State<MemberChangeAScreen> {
  TextEditingController numberController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var membersA = Teams().teamB;
    numberController.text = membersA[widget.counter]['背番号'].toString();
    nameController.text = membersA[widget.counter]['name'];
    int? number;
    String? name;

    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      insetPadding: const EdgeInsets.only(left: 8.0, top: 10.0, right: 8.0),
      content: SizedBox(
        width: 500.0,
        height: 200,
        child: Scaffold(
          body: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 60.0,
                      child: Card(
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          controller: numberController,
                          onChanged: (vale) {
                            number = int.parse(numberController.text);
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          controller: nameController,
                          onChanged: (vale) {
                            name = nameController.text;
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
                    Navigator.pop(context, [number, name]);
                    debugPrint('$number : $name');
                  },
                  child: const Text('変更終了'),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
