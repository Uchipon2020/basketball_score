import 'package:flutter/material.dart';
import '../member/teams.dart';
import '../models/player.dart';
import 'foul_screen.dart';
import 'teama_set.dart';
import 'teamb_set.dart';

class TopScreen extends StatefulWidget {
  const TopScreen({super.key});

  @override
  State<TopScreen> createState() => _TopScreenState();
}

class _TopScreenState extends State<TopScreen> {
  String teamAName = 'TeamA';
  String teamBName = 'TeamB';
  List<Player> teamsAMain = Teams.teamA;
  List<Player> teamsBMain = Teams.teamB;

  final _teamAController = TextEditingController();
  final _teamBController = TextEditingController();

  @override
  void dispose() {
    _teamAController.dispose();
    _teamBController.dispose();
    super.dispose();
  }

  Future<void> _navigateToTeamA() async {
    final result = await Navigator.of(context).push<List<Player>?>(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => TeamASet(teams: teamsAMain),
        transitionsBuilder: (_, animation, __, child) => SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
      ),
    );
    if (result != null) setState(() => teamsAMain = result);
  }

  Future<void> _navigateToTeamB() async {
    final result = await Navigator.of(context).push<List<Player>?>(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => TeamBSet(teams: teamsBMain),
        transitionsBuilder: (_, animation, __, child) => SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
      ),
    );
    if (result != null) setState(() => teamsBMain = result);
  }

  void _navigateToRecord() {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const FoulScreen(),
        transitionsBuilder: (_, animation, __, child) => SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, 1.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TOP SCREEN')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 380,
              child: Container(color: Colors.amber),
            ),
            TextField(
              controller: _teamAController,
              textAlign: TextAlign.center,
              onChanged: (value) => teamAName = value,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                hintText: 'チームA名',
              ),
            ),
            const Text(
              'VS',
              style: TextStyle(fontSize: 29, color: Colors.blue),
            ),
            TextField(
              controller: _teamBController,
              textAlign: TextAlign.center,
              onChanged: (value) => teamBName = value,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                hintText: 'チームB名',
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _navigateToTeamA,
                  child: const Text('濃　チーム'),
                ),
                ElevatedButton(
                  onPressed: _navigateToRecord,
                  child: const Text('記録開始'),
                ),
                ElevatedButton(
                  onPressed: _navigateToTeamB,
                  child: const Text('淡 チーム'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
