import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  CustomInput(
      {required this.hint,
      required this.focus,
      required this.nextFocus,
      required this.onChange,
      this.inputType = TextInputType.text,
      this.maxLength = 20,
      this.initVal = ''});

  final FocusNode focus;
  final FocusNode nextFocus;
  final void Function(String) onChange;
  final String hint;
  final String initVal;
  final TextInputType inputType;
  final int maxLength;

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
      child: TextFormField(
        initialValue: initVal,
        maxLength: maxLength,
        keyboardType: inputType,
        textInputAction: TextInputAction.next,
        focusNode: focus,
        onFieldSubmitted: (val) => _fieldFocusChange(context, focus, nextFocus),
        decoration: InputDecoration(
          errorStyle: const TextStyle(color: Colors.red),
          labelText: hint,
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'field cant be empty';
          }
          return null;
        },
        onChanged: onChange,
      ),
    );
  }
}
