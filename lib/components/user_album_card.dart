import 'package:flutter/material.dart';
import 'package:task_for_eclipse/config/colors.dart';

import 'custom_text_widget.dart';

class AlbumCardWidget extends StatelessWidget {
  AlbumCardWidget(
      {Key? key, this.product, this.imageUrl, this.onTap, this.title = ''})
      : super(key: key);
  var product;
  var imageUrl;
  var onTap;
  var title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 200,
        width: 50,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
                CustomText(
                  text: title,
                  fontSize: 15,
                  textAlign: TextAlign.center,
                  color: blackColor,
                  maxLines: 2,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
