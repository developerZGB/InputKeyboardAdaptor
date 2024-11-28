Language: English | [简体中文](./README-zh_CN.md)

# InputKeyboardAdaptor
Set the distance between the input box or adapter bottom and the keyboard when the keyboard pops up. Support iOS、Android.
[Github](https://github.com/developerZGB/InputKeyboardAdaptor.git)

## Installing

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  input_keyboard_adaptor: ^latest
```

## Import

```dart
import 'package:input_keyboard_adaptor/input_keyboard_adaptor.dart';
```

## How to use

Use `InputKeyboardAdaptor` Widget to wrap your input field. With Set `keyboardDistanceFromTextField` or `keyboardDistanceFromContent`, then it will help you to adjust the position of the keyboard.

example like this:
```dart
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  Widget build(BuildContext context) {
    return Scaffold(
      // 组件基于键盘弹起时触发的resize，如果resizeToAvoidBottomInset显式设置为false，组件设置无效
      // resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("InputKeyboardAdaptorTest"),
      ),
      body: InputKeyboardAdaptor(
        // keyboardDistanceFromTextField: 0, //键盘顶部距离当前焦点输入框底部的间距
        keyboardDistanceFromContent: 10, //键盘顶部距离InputKeyboardAdaptor组件底部的距离 二选一设置
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 240,),
              const Text("This is a test", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),),
              const SizedBox(height: 40,),
              TextField(
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                decoration: InputDecoration(
                  hintText: "Enter your name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 40,),
              TextField(
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                decoration: InputDecoration(
                  hintText: "Enter your mobile",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 40,),
              Container(
                height: 56,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 80),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(56 / 2),
                  color: const Color(0xff00c487),
                ),
                child: TextButton(
                  onPressed: () => {
                    debugPrint('Button pressed')
                  }, 
                  child: const Text("Submit", style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500))),
              ),
            ]
          ),
        ),
      ),
    );
  }
}
```

## Changelog

[CHANGELOG](./CHANGELOG.md)

## License

[License](./LICENSE)
