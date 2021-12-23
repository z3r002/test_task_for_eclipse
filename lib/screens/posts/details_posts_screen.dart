import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:task_for_eclipse/components/custom_text_widget.dart';
import 'package:task_for_eclipse/components/floating_button_widget.dart';
import 'package:task_for_eclipse/config/urls.dart';

class DetailsPostsScreen extends StatelessWidget {
  DetailsPostsScreen({Key? key, required this.post}) : super(key: key);
  var post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Observer(
          builder: (_) => ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width / 1.1,
                child: Card(
                  elevation: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: post['title'],
                        maxLines: 15,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: post['body'],
                        maxLines: 15,
                      )
                    ],
                  ),
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 30),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) => Card(
                  elevation: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: postsStore.commentsArr[index]['name'],
                        fontWeight: FontWeight.bold,
                      ),
                      CustomText(
                        text: postsStore.commentsArr[index]['body'],
                        maxLines: 15,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomText(
                          textAlign: TextAlign.right,
                          text: postsStore.commentsArr[index]['email']),
                    ],
                  ),
                ),
                itemCount: postsStore.commentsArr.length,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: const CustomFloatingButtonWidget(),
    );
  }
}
