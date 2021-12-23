import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:task_for_eclipse/components/user_album_card.dart';
import 'package:task_for_eclipse/config/urls.dart';

import 'details_albums_screen.dart';

class AlbumsScreen extends StatelessWidget {
  const AlbumsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('user albums'),
        ),
        body: SafeArea(
          child: Observer(
              builder: (_) => Padding(
                    padding: EdgeInsets.all(15),
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 250,
                      ),
                      itemCount: userStore.userAlbumWithPhotos.length,
                      itemBuilder: (BuildContext context, int index) =>
                          AlbumCardWidget(
                        imageUrl: userStore.userAlbumWithPhotos[index]['photos']
                            [0]['thumbnailUrl'],
                        title: userStore.userAlbumWithPhotos[index]['title'],
                        onTap: () {
                          userStore.photosInAlbum =
                              userStore.userAlbumWithPhotos[index]['photos'];
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsAlbumScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  )),
        ));
  }
}
