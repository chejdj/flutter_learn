import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonPage extends StatefulWidget {
  const CommonPage({super.key});

  @override
  State<CommonPage> createState() => _CommonPageState();
}

///通道使用方式: Flutter侧和Native侧需要定义同一个名字的通道，然后利用通道进行互相通信
MethodChannel methodChannel = const MethodChannel('nativeCall');

class _CommonPageState extends State<CommonPage> {
  @override
  Widget build(BuildContext context) => const Center(child: CommonContent());

  @override
  void initState() {
    super.initState();
    methodChannel.setMethodCallHandler((call) async {
      switch (call.method) {
        case 'getFlutterContent':
          if (kDebugMode) {
            print('-------native call getFlutterContent------');
          }
          return 'I am from flutter';
      }
    });
  }
}

class CommonContent extends StatelessWidget {
  const CommonContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextButton(
            onPressed: () => showDialog<String>(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('弹窗的标题'),
                content: const Text('提示的内容写在这里...'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('取消'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('确认'),
                  ),
                ],
              ),
            ),
            child: const Text('点击弹窗'),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: TextButton(
              onPressed: () async {
                final int? result = await methodChannel
                    .invokeMethod<int>('increment', {'count': 1001});
                if (kDebugMode) {
                  print(
                      '-----------native call increment result: $result -------------------');
                }
              },
              child: const Text('调用native方法'),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: TextButton(
              onPressed: () async {
                methodChannel.invokeMethod('callFlutterMethod');
              },
              child: const Text('native 调用Flutter代码'),
            ),
          ),
        ],
      );
}
