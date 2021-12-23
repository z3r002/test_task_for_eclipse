import 'package:flutter/material.dart';
import 'package:task_for_eclipse/components/custom_button_widget.dart';
import 'package:task_for_eclipse/config/urls.dart';

import 'custom_input_widget.dart';

class BottomSheetWidget extends StatelessWidget {
  BottomSheetWidget({Key? key}) : super(key: key);
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _commentFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, left: 15, right: 15),
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            height: 400,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      color: Colors.grey.shade300,
                      spreadRadius: 5)
                ]),
            child: Column(
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomInput(
                          hint: 'Enter your name',
                          maxLength: 20,
                          focus: _nameFocus,
                          inputType: TextInputType.text,
                          nextFocus: _emailFocus,
                          onChange: (value) => postsStore.setName(value)),
                      CustomInput(
                          hint: 'Enter your email',
                          maxLength: 60,
                          focus: _emailFocus,
                          inputType: TextInputType.emailAddress,
                          nextFocus: _commentFocus,
                          onChange: (value) => postsStore.setEmail(value)),
                      CustomInput(
                          hint: 'Comment',
                          maxLength: 200,
                          focus: _commentFocus,
                          inputType: TextInputType.text,
                          nextFocus: _commentFocus,
                          onChange: (value) => postsStore.setComment(value)),
                      CustomButton(
                        text: 'send',
                        onClick: () async {
                          FocusScope.of(context).requestFocus(FocusNode());
                          if (_formKey.currentState!.validate()) {
                            Navigator.pop(context);
                            postsStore.sendComment();
                          }
                        },
                        height: 40,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
