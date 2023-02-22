import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../member/teams.dart';

//名前と背番号変更のアラートボックス風ページ
class MemberChangeBScreen extends StatefulWidget {
  late int counter;
  MemberChangeBScreen({Key? key, required this.counter}) : super(key: key);
  @override
  MemberChangeBScreenState createState() => MemberChangeBScreenState();
}

class MemberChangeBScreenState extends State<MemberChangeBScreen> {
  final numberController = TextEditingController();
  final nameController = TextEditingController();
  final focusNode = FocusNode();
  @override
  void dispose() {
    numberController.dispose();
    focusNode.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    var membersB = Teams().teamB;
    numberController.text = membersB[widget.counter]['背番号'].toString();
    nameController.text = membersB[widget.counter]['name'];
    /*focusNode.addListener(() {
      if (focusNode.hashCode) {
        numberController.selection = TextSelection(
            baseOffset: 0, extentOffset: numberController.text.length);
        nameController.selection = TextSelection(
            baseOffset: 0, extentOffset: nameController.text.length);
      }
    });*/
  }

  @override
  Widget build(BuildContext context) {
    int? number;
    String? name;

    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      insetPadding: const EdgeInsets.only(left: 8.0, top: 10.0, right: 8.0),
      content: Row(
        children: [
          SizedBox(
            width: 60.0,
            child: Card(
              child: TextFormField(
                focusNode: focusNode,
                textAlign: TextAlign.center,
                controller: numberController,
                onChanged: (vale) {
                  number = int.parse(numberController.text);
                },
                onFieldSubmitted: (_) {
                  number = int.parse(numberController.text);
                  Navigator.pop(context, [number, name]);
                  debugPrint('$number : $name');
                },
              ),
            ),
          ),
          Expanded(
            child: Card(
              child: TextFormField(
                textAlign: TextAlign.left,
                controller: nameController,
                onChanged: (vale) {
                  name = nameController.text;
                },
                onFieldSubmitted: (_) {
                  name = nameController.text;
                  Navigator.pop(context, [number, name]);
                  debugPrint('$number : $name');
                },
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context, [number, name]);
              debugPrint('$number : $name');
            },
            child: const Text('確定'))
      ],
    );
  }
}
