import 'package:flutter/material.dart';
import '../models/player.dart';

class MemberChangeScreen extends StatefulWidget {
  final Player player;

  const MemberChangeScreen({super.key, required this.player});

  @override
  State<MemberChangeScreen> createState() => _MemberChangeScreenState();
}

class _MemberChangeScreenState extends State<MemberChangeScreen> {
  late final TextEditingController _numberController;
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _numberController =
        TextEditingController(text: widget.player.number.toString());
    _nameController = TextEditingController(text: widget.player.name);
  }

  @override
  void dispose() {
    _numberController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  void _confirm() {
    final number =
        int.tryParse(_numberController.text) ?? widget.player.number;
    final name = _nameController.text.trim().isEmpty
        ? widget.player.name
        : _nameController.text.trim();
    Navigator.pop(context, widget.player.copyWith(number: number, name: name));
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      insetPadding:
          const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      content: Row(
        children: [
          SizedBox(
            width: 70.0,
            child: Card(
              child: TextFormField(
                textAlign: TextAlign.center,
                controller: _numberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: '番号',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(8),
                ),
                onFieldSubmitted: (_) => _confirm(),
              ),
            ),
          ),
          Expanded(
            child: Card(
              child: TextFormField(
                textAlign: TextAlign.left,
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: '名前',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(8),
                ),
                onFieldSubmitted: (_) => _confirm(),
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('キャンセル'),
        ),
        TextButton(
          onPressed: _confirm,
          child: const Text('確定'),
        ),
      ],
    );
  }
}
