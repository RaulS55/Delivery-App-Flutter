import 'package:deliveryproyect/src/utils/font_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchButtom extends StatelessWidget {
  const SearchButtom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 25),
      child: CupertinoButton(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            children: [
              const Icon(Icons.search, color: Colors.grey),
              const SizedBox(width: 20),
              Text(
                "Buscar",
                style: MyFontStyles.regular.copyWith(color: Colors.grey),
              ),
            ],
          ),
          onPressed: () {}),
    );
  }
}
