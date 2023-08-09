import 'package:flutter/material.dart';
import 'package:news_app/constents/enums.dart';
import 'package:news_app/providers/home_provider.dart';
import 'package:provider/provider.dart';

class SortByDropMenu extends StatelessWidget {
  const SortByDropMenu({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);
    List<DropdownMenuItem<dynamic>>? items = [
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
    return Align(
      alignment: Alignment.topRight,
      child: Material(
        color: Theme.of(context).cardColor,
        child: DropdownButton(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          underline: const SizedBox.shrink(),
          dropdownColor: Theme.of(context).cardColor,
          value: homeProvider.sortBy,
          items: items,
          onChanged: (value) => homeProvider.sortByOnChanged(value),
        ),
      ),
    );
  }
}
