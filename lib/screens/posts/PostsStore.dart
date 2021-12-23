// ignore_for_file: file_names

import 'package:mobx/mobx.dart';
import 'package:task_for_eclipse/services/network.dart';

part 'PostsStore.g.dart';

class PostsStore = _PostsStore with _$PostsStore;

abstract class _PostsStore with Store {
  @observable
  var name = '';

  @observable
  var email = '';

  @observable
  var comment = '';

  @observable
  var isShowButton = true;

  @observable
  var commentsArr = [];

  @action
  changeShowButton() {
    isShowButton = !isShowButton;
  }

  @action
  setName(value) {
    name = value;
  }

  @action
  setEmail(value) {
    email = value;
  }

  @action
  setComment(value) {
    comment = value;
  }

  @action
  Future sendComment() async {
    try {
      Map body = {"email": email, "name": name, "body": comment};
      var response = await Network().post('comments', body);
    } catch (e) {
      print(e);
    }
  }

  @action
  Future getCommentsForPost(var postId) async {
    try {
      var comments = await Network().get('comments');
      commentsArr = comments.where((el) => el['postId'] == postId).toList();
    } catch (e) {
      print(e);
    }
  }
}
