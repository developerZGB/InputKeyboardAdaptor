import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class InputKeyboardAdaptorContentRenderObject extends RenderConstrainedBox{
  double? keyboardDistanceFromTextField;
  double? keyboardDistanceFromContent;
  InputKeyboardAdaptorContentRenderObject({
    required BoxConstraints additionalConstraints,
    this.keyboardDistanceFromTextField, 
    this.keyboardDistanceFromContent, }) : super(additionalConstraints: additionalConstraints);
  @override
  void showOnScreen({RenderObject? descendant, Rect? rect, Duration duration = Duration.zero, Curve curve = Curves.ease}) {
    RenderBox? renderBox = descendant as RenderBox?;
    if (renderBox is RenderEditable) {//输入框
      if (keyboardDistanceFromContent != null) {//底部增加过距离了，这里完整显示最底部即可
        super.showOnScreen(descendant: this, rect: Rect.fromLTRB(20, size.height-40, size.width-40, size.height), duration: duration, curve: curve);
        return;
      }
      if (keyboardDistanceFromTextField != null) {
        Offset textFieldPosition = renderBox.localToGlobal(Offset.zero);
        Size textFieldSize = renderBox.size;

        Offset thisPosition = localToGlobal(Offset.zero);

        Offset textFieldPositionToThis = Offset(textFieldPosition.dx - thisPosition.dx, textFieldPosition.dy - thisPosition.dy);
        Rect rect = Rect.fromLTRB(
          textFieldPositionToThis.dx, 
          textFieldPositionToThis.dy, 
          textFieldPositionToThis.dx + textFieldSize.width, 
          textFieldPositionToThis.dy + textFieldSize.height + keyboardDistanceFromTextField!
        );
        super.showOnScreen(descendant: this, rect: rect, duration: duration, curve: curve);
        return;
      }
    }
    super.showOnScreen(descendant: descendant, rect: rect, duration: duration, curve: curve);
  }

  @override
  void performLayout() {
    super.performLayout();
    if (keyboardDistanceFromContent != null) {//底部增加距离
      size = Size(size.width, size.height + keyboardDistanceFromContent!);
    }
  }
}

class InputKeyboardAdaptorContent extends SizedBox {
  final double? keyboardDistanceFromTextField;
  final double? keyboardDistanceFromContent;
  const InputKeyboardAdaptorContent({
    Key? key, 
    Widget? child, 
    this.keyboardDistanceFromTextField, 
    this.keyboardDistanceFromContent,}) : super(key: key, child: child);
  @override
  InputKeyboardAdaptorContentRenderObject createRenderObject(BuildContext context) {
    return InputKeyboardAdaptorContentRenderObject(
      additionalConstraints: BoxConstraints.tightFor(width: width, height: height),
      keyboardDistanceFromTextField: keyboardDistanceFromTextField, 
      keyboardDistanceFromContent: keyboardDistanceFromContent, 
    );
  }
}
