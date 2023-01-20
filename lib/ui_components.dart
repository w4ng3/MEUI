import 'package:flutter/material.dart';

import 'alert_dialog/wd_dialog.dart';

/// 创建时间：2023/1/20
/// 作者：w2gd
/// 描述：多引擎 UI组件 入口

@pragma('vm:entry-point')
void MEUiAlertDialog() {
  return runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: WDDialog(runByMultiEngines: true),
  ));
}
