import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:task_for_eclipse/components/custom_text_widget.dart';
import 'package:task_for_eclipse/config/urls.dart';

class DetailsAlbumScreen extends StatelessWidget {
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('user photos in album'),
        ),
        body: SafeArea(
          child: Observer(
              builder: (_) => userStore.photosInAlbum.isNotEmpty ? Padding(
                  padding: EdgeInsets.all(15),
                  child: CarouselSlider(
                    options: CarouselOptions(height: 450.0),
                    items: userStore.photosInAlbum.map((item) {
                      return Builder(
                        builder: (
                          BuildContext context,
                        ) {
                          return Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                child: Image.network(item['url']),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              SizedBox(
                                width: 300,
                                child: CustomText(
                                  text: item['title'],
                                  maxLines: 15,
                                ),
                              )
                            ],
                          );
                        },
                      );
                    }).toList(),
                  )
                  // child: GridView.builder(
                  //   scrollDirection: Axis.vertical,
                  //   shrinkWrap: true,
                  //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  //     crossAxisCount: 2,
                  //     mainAxisExtent: 250,
                  //   ),
                  //   itemCount: userStore.photosInAlbum.length,
                  //   itemBuilder: (BuildContext context, int index) =>
                  //       AlbumCardWidget(
                  //         imageUrl: userStore.photosInAlbum[index]['thumbnailUrl'],
                  //         title: userStore.photosInAlbum[index]['title']),
                  // ),
                  ): Center(child: CircularProgressIndicator(),)),
        ));
  }
}
