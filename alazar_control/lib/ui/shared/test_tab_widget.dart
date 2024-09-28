import 'package:flutter/material.dart';

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 2,
        itemBuilder: (contex, index) => LevelOneItem(index: index));
  }
}

class LevelOneItem extends StatefulWidget {
  const LevelOneItem({super.key, required this.index});
  final int index;
  static List<Color> colors = [Colors.blue, Colors.green, Colors.red];

  @override
  State<LevelOneItem> createState() => _LevelOneItemState();
}

class _LevelOneItemState extends State<LevelOneItem> {
  List<int> selections = [1, 2, 1];

  void update(int index, int val) {
    setState(() {
      final temp = List<int>.from(selections);
      temp.removeAt(index);
      temp.insert(index, val);
      selections = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: selections.length,
        itemBuilder: (context, index) => Container(
              height: 100,
              color: LevelOneItem.colors[index],
              child: LevelTwoItem(
                selected: selections[index],
                cb: (value) => update(index, value),
              ),
            ));
  }
}

class LevelTwoItem extends StatelessWidget {
  const LevelTwoItem({
    super.key,
    required this.selected,
    required this.cb,
  });
  final int selected;
  final ValueChanged<int> cb;
  final List<DropdownMenuEntry<int>> entries = const [
    DropdownMenuEntry(value: 1, label: 'one'),
    DropdownMenuEntry(value: 2, label: 'two')
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Menu'),
        DropdownMenu<int>(
          initialSelection: selected,
          dropdownMenuEntries: entries,
          onSelected: (value) => cb(value ?? selected),
        )
      ],
    );
  }
}
