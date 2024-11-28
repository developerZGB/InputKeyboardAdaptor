import 'package:flutter/material.dart';
import 'package:input_keyboard_adaptor/src/input_keyboard_adaptor_content.dart';

class InputKeyboardAdaptor extends StatelessWidget{
  final Widget child;
  final double? keyboardDistanceFromTextField;
  final double? keyboardDistanceFromContent;
  const InputKeyboardAdaptor({
    Key? key,
    required this.child, 
    this.keyboardDistanceFromTextField, 
    this.keyboardDistanceFromContent}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: InputKeyboardAdaptorContent(
        keyboardDistanceFromTextField: keyboardDistanceFromTextField,
        keyboardDistanceFromContent: keyboardDistanceFromContent,
        child: child,
      ),
    );
  }
}