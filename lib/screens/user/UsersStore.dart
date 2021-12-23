// ignore_for_file: file_names

import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:task_for_eclipse/config/urls.dart';
import 'package:task_for_eclipse/services/network.dart';
import 'dart:convert' as convert;


part 'UsersStore.g.dart';

class UsersStore = _UsersStore with _$UsersStore;

abstract class _UsersStore with Store {
  @observable
  var usersArr = [];
  @observable
  var userPostsArr = [];
  @observable
  var userAlbumsArr = [];
  @observable
  var userAlbumWithPhotos = [];
  @observable
  var photosInAlbum = [];

  @action
  Future getUsers() async {
    try {

         var response = await Network().get('users');

         usersArr = response;


    } catch (e) {
      print(e);
    }
  }

  @action
  Future userPostAndAlbums(var userId) async {
    try {

        userPostsArr = await Network().get('users/$userId/posts');
        userAlbumsArr = await Network().get('users/$userId/albums');
        //final stopwatch = Stopwatch()..start();
        var photos = await Network().get('users/$userId/photos');

        // this method executed in 0:00:04.282842

        // for (int album = userAlbumsArr.first['id'];
        //     album <= userAlbumsArr.last['id'];
        //     album++) {
        //   var photosInAlbum = await Network().get('albums/$album/photos');
        //   userAlbumWithPhotos.add({"photos": photosInAlbum});
        // }

        //this method faster executed in  0:00:00.867624
        userAlbumWithPhotos = userAlbumsArr.map((e) {
          e['photos'] =
              photos.where((photo) => photo['albumId'] == e['id']).toList();
          return e;
        }).toList();
        return true;
        // print('get and sort photos for user executed in ${stopwatch.elapsed}');

    } catch (e) {
      print(e);
    }
  }
}
