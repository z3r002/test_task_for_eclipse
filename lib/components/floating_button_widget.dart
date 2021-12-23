import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:task_for_eclipse/config/urls.dart';

import 'bottom_sheet_widget.dart';

class CustomFloatingButtonWidget extends StatelessWidget {
  const CustomFloatingButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => postsStore.isShowButton
            ? FloatingActionButton(
                onPressed: () {
                  var sheetController = showBottomSheet(
                      context: context,
                      builder: (context) => BottomSheetWidget());
                  postsStore.changeShowButton();
                  sheetController.closed.then((value) {
                    postsStore.changeShowButton();
                  });
                },
                child: const Icon(Icons.send),
              )
            : Container());
  }
}
