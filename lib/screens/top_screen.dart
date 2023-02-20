import 'package:basketball_score/screens/foul_screen.dart';
import 'package:basketball_score/screens/teama_set.dart';
import 'package:basketball_score/screens/teamb_set.dart';
import 'package:flutter/material.dart';

import '../member/teams.dart';

class TopScreen extends StatefulWidget {
  const TopScreen({Key? key}) : super(key: key);

  @override
  State<TopScreen> createState() => _TopScreenState();
}

class _TopScreenState extends State<TopScreen> {
  String teamA = 'TeamA';
  String teamB = 'TeamB';
  List<Teams> teamsA = Teams().teamA.cast<Teams>();
  List<Teams> teamsB = Teams().teamB.cast<Teams>();

  TextEditingController teamANameController = TextEditingController();
  TextEditingController teamBNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TOP SCREEN'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          SizedBox(
            width: double.infinity,
            height: 380,
            child: Container(
              color: Colors.amber,
            ),
          ),
          TextField(
            controller: teamANameController,
            textAlign: TextAlign.center,
            onChanged: (value) {
              teamA = teamANameController.text;
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
          ),
          const Text(
            'VS',
            style: TextStyle(
              fontSize: 29,
              color: Colors.blue,
            ),
          ),
          TextField(
            controller: teamBNameController,
            textAlign: TextAlign.center,
            onChanged: (value) {
              teamB = teamBNameController.text;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        // 表示する画面のWidget
                        return const TeamSet();
                      },
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        // 遷移時のアニメーションを指定
                        const Offset begin = Offset(-1.0, 0.0);
                        const Offset end = Offset.zero;
                        final Tween<Offset> tween = Tween(begin: begin, end: end);
                        final Animation<Offset> offsetAnimation = animation.drive(tween);
                        return SlideTransition(
                          position: offsetAnimation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
                child: const Text('濃　チーム'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        // 表示する画面のWidget
                        return const FoulScreen();
                      },
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        // 遷移時のアニメーションを指定
                        const Offset begin = Offset(0.0, 1.0);
                        const Offset end = Offset.zero;
                        final Tween<Offset> tween = Tween(begin: begin, end: end);
                        final Animation<Offset> offsetAnimation = animation.drive(tween);
                        return SlideTransition(
                          position: offsetAnimation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
                child: const Text('記録開始'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        // 表示する画面のWidget
                        return const TeamBSet();
                      },
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        // 遷移時のアニメーションを指定
                        const Offset begin = Offset(1.0, 0.0);
                        const Offset end = Offset.zero;
                        final Tween<Offset> tween = Tween(begin: begin, end: end);
                        final Animation<Offset> offsetAnimation = animation.drive(tween);
                        return SlideTransition(
                          position: offsetAnimation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
                child: const Text('淡 チーム'),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
