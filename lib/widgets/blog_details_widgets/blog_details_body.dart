import 'package:flutter/material.dart';
import 'package:news_app/widgets/blog_details_widgets/image_and_action_buttons.dart';

class BlogDetailsBody extends StatelessWidget {
  const BlogDetailsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ListView(
        children: [
          // blog title
          Text(
            'Title' * 5,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 18.0),

          // date time
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('18/7/2022'),
              Text('Less than a minute'),
            ],
          ),

          const SizedBox(height: 18.0),

          // image and action buttons (add to bookmarks, share)
          const BlogImageAndActionButtons(),

          const SizedBox(height: 22.0),

          // description
          const Text(
            'Description',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
          ),

          const SizedBox(height: 18.0),

          // content
          const Text(
            'Content',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
          ),

          const SizedBox(height: 18.0),
        ],
      ),
    );
  }
}
