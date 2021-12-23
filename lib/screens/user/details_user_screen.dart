import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:task_for_eclipse/components/custom_text_widget.dart';
import 'package:task_for_eclipse/components/user_album_card.dart';
import 'package:task_for_eclipse/config/urls.dart';
import 'package:task_for_eclipse/screens/albums/albums_screen.dart';
import 'package:task_for_eclipse/screens/posts/posts_screen.dart';

class DetailsUserScreen extends StatelessWidget {
  CarouselController buttonCarouselController = CarouselController();
  late List<String> detail;
  var user;
  final List<IconData> icons = [
    Icons.person,
    Icons.email,
    Icons.phone,
    Icons.link,
    Icons.home,
    Icons.location_city,
    Icons.streetview,
  ];

  DetailsUserScreen({Key? key, this.user, required this.detail})
      : super(key: key) {
    detail = [
      user['name'],
      user['email'],
      user['phone'],
      user['website'],
      user['address']['suite'],
      user['address']['city'],
      user['address']['street'],
    ];
  }

  @override
  Widget build(BuildContext context) {
    var maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(user['username']),
      ),
      body: Observer(builder:(_)=>   userStore.userPostsArr.isNotEmpty && userStore.userAlbumWithPhotos.isNotEmpty ?
      ListView(
        padding: const EdgeInsets.all(15),
        children: [
          const SizedBox(height: 15),
          const CustomText(
              text: 'User info',
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: detail.length,
            itemBuilder: (BuildContext context, int index) => ListTile(
              leading: Icon(icons[index]),
              title: Text(detail[index]),
            ),
          ),
          const CustomText(
            text: 'Company',
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          CustomText(text: user['company']['name'], fontSize: 15),
          CustomText(text: user['company']['bs'], fontSize: 15),
          CustomText(
              text: user['company']['catchPhrase'],
              fontStyle: FontStyle.italic,
              fontSize: 15),
          const SizedBox(
            height: 15,
          ),
          const CustomText(
            text: 'Posts',
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 15,
          ),

          ListView.builder(
            padding: const EdgeInsets.all(5),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) =>   Card(
              child: Column(
                children: [
                  CustomText(
                    text: userStore.userPostsArr[index]['title'],
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(text: userStore.userPostsArr[index]['body']),
                ],
              ),
            )  ,
            itemCount: 3,
          ),
          MaterialButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostsScreen(),
                ),
              );
            },
            minWidth: maxWidth,
            child: const Icon(
              Icons.arrow_downward,
              color: Colors.blue,
              size: 30,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const CustomText(
            text: 'Albums',
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
          ),
           CarouselSlider.builder(
            options: CarouselOptions(height: 200, enableInfiniteScroll: false),
            itemCount: 4,
            itemBuilder: (BuildContext context, int index, int pageViewIndex) =>
            index == 3
                ? GestureDetector(
              child: SizedBox(
                width: maxWidth,
                child: const Card(
                  child: Icon(Icons.arrow_forward,
                      size: 50, color: Colors.blue),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AlbumsScreen(),
                  ),
                );
              },
            )
                : SizedBox(
              child: AlbumCardWidget(
                imageUrl: userStore.userAlbumWithPhotos[index]
                ['photos'][0]['thumbnailUrl'],
                title: userStore.userAlbumWithPhotos[index]['title'],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AlbumsScreen(),
                    ),
                  );
                },
              ),
              width: maxWidth,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ): Center(child: CircularProgressIndicator(),)
      )
    );
  }
}
