import 'package:flutter/material.dart';
import 'package:news_app/constents/enums.dart';

class SortByDropMenu extends StatefulWidget {
  const SortByDropMenu({super.key});

  @override
  State<SortByDropMenu> createState() => _SortByDropMenuState();
}

class _SortByDropMenuState extends State<SortByDropMenu> {
  String sortBy = SortByEnum.popularity.name;
  List<DropdownMenuItem<dynamic>>? get items => [
        DropdownMenuItem(
          value: SortByEnum.popularity.name,
          child: Text(SortByEnum.popularity.name),
        ),
        DropdownMenuItem(
          value: SortByEnum.publishedAt.name,
          child: Text(SortByEnum.publishedAt.name),
        ),
        DropdownMenuItem(
          value: SortByEnum.relevancy.name,
          child: Text(SortByEnum.relevancy.name),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Material(
        color: Theme.of(context).cardColor,
        child: DropdownButton(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          underline: const SizedBox.shrink(),
          dropdownColor: Theme.of(context).cardColor,
          value: sortBy,
          items: items,
          onChanged: (value) {
            sortBy = value;
            setState(() {});
          },
        ),
      ),
    );
  }
}
