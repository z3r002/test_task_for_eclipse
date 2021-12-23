// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PostsStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PostsStore on _PostsStore, Store {
  final _$nameAtom = Atom(name: '_PostsStore.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$emailAtom = Atom(name: '_PostsStore.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$commentAtom = Atom(name: '_PostsStore.comment');

  @override
  String get comment {
    _$commentAtom.reportRead();
    return super.comment;
  }

  @override
  set comment(String value) {
    _$commentAtom.reportWrite(value, super.comment, () {
      super.comment = value;
    });
  }

  final _$isShowButtonAtom = Atom(name: '_PostsStore.isShowButton');

  @override
  bool get isShowButton {
    _$isShowButtonAtom.reportRead();
    return super.isShowButton;
  }

  @override
  set isShowButton(bool value) {
    _$isShowButtonAtom.reportWrite(value, super.isShowButton, () {
      super.isShowButton = value;
    });
  }

  final _$commentsArrAtom = Atom(name: '_PostsStore.commentsArr');

  @override
  List<dynamic> get commentsArr {
    _$commentsArrAtom.reportRead();
    return super.commentsArr;
  }

  @override
  set commentsArr(List<dynamic> value) {
    _$commentsArrAtom.reportWrite(value, super.commentsArr, () {
      super.commentsArr = value;
    });
  }

  final _$sendCommentAsyncAction = AsyncAction('_PostsStore.sendComment');

  @override
  Future<dynamic> sendComment() {
    return _$sendCommentAsyncAction.run(() => super.sendComment());
  }

  final _$getCommentsForPostAsyncAction =
      AsyncAction('_PostsStore.getCommentsForPost');

  @override
  Future<dynamic> getCommentsForPost(dynamic postId) {
    return _$getCommentsForPostAsyncAction
        .run(() => super.getCommentsForPost(postId));
  }

  final _$_PostsStoreActionController = ActionController(name: '_PostsStore');

  @override
  dynamic changeShowButton() {
    final _$actionInfo = _$_PostsStoreActionController.startAction(
        name: '_PostsStore.changeShowButton');
    try {
      return super.changeShowButton();
    } finally {
      _$_PostsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setName(dynamic value) {
    final _$actionInfo =
        _$_PostsStoreActionController.startAction(name: '_PostsStore.setName');
    try {
      return super.setName(value);
    } finally {
      _$_PostsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(dynamic value) {
    final _$actionInfo =
        _$_PostsStoreActionController.startAction(name: '_PostsStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_PostsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setComment(dynamic value) {
    final _$actionInfo = _$_PostsStoreActionController.startAction(
        name: '_PostsStore.setComment');
    try {
      return super.setComment(value);
    } finally {
      _$_PostsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
email: ${email},
comment: ${comment},
isShowButton: ${isShowButton},
commentsArr: ${commentsArr}
    ''';
  }
}
