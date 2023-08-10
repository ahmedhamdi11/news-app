import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late final TextEditingController searchController;

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // back button
        IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(IconlyBroken.arrow_left_2),
        ),

        // search field
        Flexible(
          child: TextFormField(
            magnifierConfiguration: TextMagnifierConfiguration.disabled,
            controller: searchController,
            textInputAction: TextInputAction.search,
            autofocus: true,
            decoration: InputDecoration(
              isDense: true,
              fillColor: Theme.of(context).cardColor,
              filled: true,
              contentPadding: const EdgeInsets.only(
                left: 16.0,
                bottom: 8.0,
                top: 8.0,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide.none,
              ),
              hintText: 'Search',
            ),
          ),
        ),

        // clear search field button
        IconButton(
          onPressed: () => searchController.clear(),
          icon: const Icon(
            IconlyBroken.close_square,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
