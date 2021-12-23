import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:task_for_eclipse/components/user_album_card.dart';
import 'package:task_for_eclipse/config/urls.dart';

import 'details_user_screen.dart';

class UsersScreen extends StatelessWidget {
  UsersScreen({Key? key}) : super(key: key) {
    userStore.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Observer(
          builder: (_) => Padding(
            padding: const EdgeInsets.all(15),
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: userStore.usersArr.length,
              itemBuilder: (BuildContext context, int index) => AlbumCardWidget(
                imageUrl: fakeUserImage,
                title: '${userStore.usersArr[index]['username']}\n'
                    '${userStore.usersArr[index]['name']}',
                onTap: ()  {
                   userStore
                      .userPostAndAlbums(userStore.usersArr[index]['id']);
                   Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsUserScreen(
                        user: userStore.usersArr[index],
                        detail: const [],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
