import 'package:deliveryproyect/src/utils/colors.dart';
import 'package:deliveryproyect/src/utils/font_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum DishCounterZise { normal, mini }

class DishCounter extends StatefulWidget {
  const DishCounter(
      {Key? key,
      required this.onChanged,
      this.size = DishCounterZise.normal,
      this.initialValue = 0})
      : assert(initialValue >= 0),
        super(key: key);
  final void Function(int) onChanged;

  final DishCounterZise size;
  final int initialValue;

  @override
  State<DishCounter> createState() => _DishCounterState();
}

class _DishCounterState extends State<DishCounter> {
  int _counter = 0;

  void _updateCounter(int counter) {
    if (counter >= 0) {
      _counter = counter;
      widget.onChanged(_counter);
    }

    setState(() {});
  }

  @override
  void initState() {
    _counter = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool mini = widget.size == DishCounterZise.mini;
    final double padding = mini ? 5 : 10;
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CupertinoButton(
            minSize: 20,
            color: Colors.grey.shade200,
            padding: EdgeInsets.all(padding),
            child: const Icon(
              Icons.remove,
              color: primaryColor,
            ),
            onPressed: () => _updateCounter(_counter - 1),
          ),
          Text(
            "  $_counter  ",
            style: MyFontStyles.regular.copyWith(fontSize: mini ? 28 : 30),
          ),
          CupertinoButton(
            minSize: 20,
            color: Colors.grey.shade200,
            padding: EdgeInsets.all(padding),
            child: const Icon(
              Icons.add,
              color: primaryColor,
            ),
            onPressed: () => _updateCounter(_counter + 1),
          ),
        ],
      ),
    );
  }
}
