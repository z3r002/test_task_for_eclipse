import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:task_for_eclipse/components/custom_text_widget.dart';
import 'package:task_for_eclipse/config/urls.dart';
import 'package:task_for_eclipse/screens/posts/details_posts_screen.dart';

class PostsScreen extends StatelessWidget {
  PostsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('user posts'),
        ),
        body: SafeArea(
          child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) => GestureDetector(
              child: Card(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        CustomText(
                          text: userStore.userPostsArr[index]['title'],
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomText(
                          text: userStore.userPostsArr[index]['body'],
                          maxLines: 3,
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.arrow_forward,
                      color: Colors.blue,
                    )
                  ],
                ),
              ),
              onTap: () async {
                await postsStore
                    .getCommentsForPost(userStore.userPostsArr[index]['id']);
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsPostsScreen(
                      post: userStore.userPostsArr[index],
                    ),
                  ),
                );
              },
            ),
            itemCount: userStore.userPostsArr.length,
          ),
        ),
      );
    });
  }
}
