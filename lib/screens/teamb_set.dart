import 'package:flutter/material.dart';
import '../models/player.dart';
import 'member_change_screen.dart';

class TeamBSet extends StatefulWidget {
  final List<Player> teams;

  const TeamBSet({super.key, required this.teams});

  @override
  State<TeamBSet> createState() => _TeamBSetState();
}

class _TeamBSetState extends State<TeamBSet> {
  late List<Player> _players;

  @override
  void initState() {
    super.initState();
    _players = List.from(widget.teams);
  }

  Future<void> _editPlayer(int index) async {
    final result = await Navigator.push<Player?>(
      context,
      MaterialPageRoute(
        builder: (context) => MemberChangeScreen(player: _players[index]),
      ),
    );
    if (result != null) {
      setState(() => _players[index] = result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, _players),
        ),
        title: const Text('淡　チーム'),
        backgroundColor: Colors.cyanAccent,
      ),
      body: ListView.builder(
        itemCount: _players.length,
        itemBuilder: (context, index) {
          final player = _players[index];
          return Row(
            children: [
              SizedBox(
                width: 60.0,
                child: Card(
                  child: ListTile(
                    onTap: () => _editPlayer(index),
                    title: Text(
                      '${player.number}',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  child: ListTile(
                    onTap: () => _editPlayer(index),
                    title: Text(player.name),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
