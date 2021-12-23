// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UsersStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UsersStore on _UsersStore, Store {
  final _$usersArrAtom = Atom(name: '_UsersStore.usersArr');

  @override
  List<dynamic> get usersArr {
    _$usersArrAtom.reportRead();
    return super.usersArr;
  }

  @override
  set usersArr(List<dynamic> value) {
    _$usersArrAtom.reportWrite(value, super.usersArr, () {
      super.usersArr = value;
    });
  }

  final _$userPostsArrAtom = Atom(name: '_UsersStore.userPostsArr');

  @override
  List<dynamic> get userPostsArr {
    _$userPostsArrAtom.reportRead();
    return super.userPostsArr;
  }

  @override
  set userPostsArr(List<dynamic> value) {
    _$userPostsArrAtom.reportWrite(value, super.userPostsArr, () {
      super.userPostsArr = value;
    });
  }

  final _$userAlbumsArrAtom = Atom(name: '_UsersStore.userAlbumsArr');

  @override
  List<dynamic> get userAlbumsArr {
    _$userAlbumsArrAtom.reportRead();
    return super.userAlbumsArr;
  }

  @override
  set userAlbumsArr(List<dynamic> value) {
    _$userAlbumsArrAtom.reportWrite(value, super.userAlbumsArr, () {
      super.userAlbumsArr = value;
    });
  }

  final _$userAlbumWithPhotosAtom =
      Atom(name: '_UsersStore.userAlbumWithPhotos');

  @override
  List<dynamic> get userAlbumWithPhotos {
    _$userAlbumWithPhotosAtom.reportRead();
    return super.userAlbumWithPhotos;
  }

  @override
  set userAlbumWithPhotos(List<dynamic> value) {
    _$userAlbumWithPhotosAtom.reportWrite(value, super.userAlbumWithPhotos, () {
      super.userAlbumWithPhotos = value;
    });
  }

  final _$photosInAlbumAtom = Atom(name: '_UsersStore.photosInAlbum');

  @override
  List<dynamic> get photosInAlbum {
    _$photosInAlbumAtom.reportRead();
    return super.photosInAlbum;
  }

  @override
  set photosInAlbum(List<dynamic> value) {
    _$photosInAlbumAtom.reportWrite(value, super.photosInAlbum, () {
      super.photosInAlbum = value;
    });
  }

  final _$getUsersAsyncAction = AsyncAction('_UsersStore.getUsers');

  @override
  Future<dynamic> getUsers() {
    return _$getUsersAsyncAction.run(() => super.getUsers());
  }

  final _$userPostAndAlbumsAsyncAction =
      AsyncAction('_UsersStore.userPostAndAlbums');

  @override
  Future<dynamic> userPostAndAlbums(dynamic userId) {
    return _$userPostAndAlbumsAsyncAction
        .run(() => super.userPostAndAlbums(userId));
  }

  @override
  String toString() {
    return '''
usersArr: ${usersArr},
userPostsArr: ${userPostsArr},
userAlbumsArr: ${userAlbumsArr},
userAlbumWithPhotos: ${userAlbumWithPhotos},
photosInAlbum: ${photosInAlbum}
    ''';
  }
}
