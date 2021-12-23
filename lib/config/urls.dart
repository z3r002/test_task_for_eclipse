import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:task_for_eclipse/screens/posts/PostsStore.dart';
import 'package:task_for_eclipse/screens/user/UsersStore.dart';

const baseUrl = 'https://jsonplaceholder.typicode.com/';
const fakeUserImage = 'https://i.stack.imgur.com/i5FIW.jpg?s=328&g=1';
var userStore = UsersStore();
var postsStore = PostsStore();
final storage = FlutterSecureStorage();
