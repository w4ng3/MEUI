import 'package:flutter/material.dart';
import 'package:meui/alert_dialog/wd_dialog.dart';

/// 创建时间：2023/1/20
/// 作者：w2gd
/// 描述：

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text('Running on: $_platformVersion\n'),
              ElevatedButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (_) => WDDialog(
                    maker: AlertDialogConfigMaker(
                      title: "Flutter",
                      content: "是否要退出应用？",
                    ),
                    onClickConfirm: () {
                      Navigator.pop(context);
                    },
                    onClickCancel: () => Navigator.pop(context),
                  ),
                ),
                child: const Text("Alert Dialog"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
