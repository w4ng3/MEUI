// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meui/api/alert_dialog_api.dart';

/// 创建时间：2023/1/19
/// 作者：w2gd
/// 描述：我的自定义Dialog

class WDDialog extends StatefulWidget {
  const WDDialog(
      {Key? key,
      this.runByMultiEngines = false,
      this.maker,
      this.onClickConfirm,
      this.onClickCancel})
      : super(key: key);

  final bool runByMultiEngines;
  final AlertDialogConfigMaker? maker;
  final void Function()? onClickConfirm;
  final void Function()? onClickCancel;

  @override
  State<WDDialog> createState() => _WDDialogState();
}

class _WDDialogState extends State<WDDialog> {
  late AlertDialogHostAPI hostAPI;
  late AlertDialogConfigMaker maker;

  @override
  void initState() {
    super.initState();
    if (!widget.runByMultiEngines) {
      maker = widget.maker ?? AlertDialogConfigMaker();
      return; // 非多引擎调用，则直接调用
    }
    hostAPI = AlertDialogHostAPI(); // 初始化实例
    // 这里写过前端的同学就很容易明白，内外 this 指向不一致，所以声明一个 that
    var that = this;
    // 调用 AlertDialogFlutterAPI setup 方法
    AlertDialogFlutterAPI.setup(AlertDialogFlutterAPIHandle(
      makerCallback: (maker) {
        // 更新 maker
        that.maker = maker;
        setState(() {});
      },
      dismissCallback: () {
        print("dismiss~~~");
      },
    ));
  }

  /// 封装点击确定的方法
  void onClickConfirm() {
    if (widget.onClickConfirm != null) {
      // 如果 Flutter 有实现，说明是 Flutter 调用的组件，则直接回调
      // 当然，也可以用上文中定义的 runByMultiEngines 来判断
      widget.onClickConfirm!();
      return;
    }
    // 调用 pigeon hostAPI
    hostAPI.onClickConfirm().catchError((error) {
      debugPrint("hostAPI onClickConfirm no exists");
    });
  }

  /// 封装点击取消的方法
  void onClickCancel() {
    if (widget.onClickCancel != null) {
      widget.onClickCancel!();
      return;
    }
    hostAPI.onClickCancel().catchError((error) {
      debugPrint("hostAPI onClickConfirm no exists");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: CupertinoAlertDialog(
        title: _buildTitle(context),
        content: _buildContent(),
        actions: [
          CupertinoButton(child: Text("${maker.confirmText}"), onPressed: () => onClickConfirm()),
          CupertinoButton(child: Text("${maker.cancelText}"), onPressed: () => onClickCancel()),
        ],
      ),
    );
  }

  /// 标题
  Widget _buildTitle(context) {
    return Row(
      children: [
        Icon(CupertinoIcons.lightbulb_slash, color: Colors.red),
        Expanded(
            child: Text(
          "${maker.title}",
          style: TextStyle(color: Colors.red, fontSize: 20),
        )),
        Icon(CupertinoIcons.lightbulb)
      ],
    );
  }

  /// 内容
  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.only(top: 18),
      child: Text(
        "${maker.content}",
        style: TextStyle(
          color: Color(0xff5b5959),
          fontSize: 16,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}

/// API 实现
class AlertDialogFlutterAPIHandle extends AlertDialogFlutterAPI {
  // 提供 config 初始化方法回调
  final void Function(AlertDialogConfigMaker maker) makerCallback;

  // 提供 dismiss 方法回调
  final void Function() dismissCallback;

  AlertDialogFlutterAPIHandle({
    required this.makerCallback,
    required this.dismissCallback,
  });

  // 实现 config()
  @override
  void config(AlertDialogConfig config) {
    // 这里暂时忽略，后文会讲
    var item = AlertDialogConfigMaker(
      title: config.title!,
      content: config.content!,
      confirmText: config.confirmText!,
      cancelText: config.cancelText!,
    );
    makerCallback(item);
  }
}

/// 重新构建一个 Config 对象，因为pigeon 自动生成的对象是没有默认值的
/// 我希望 maker 的声明是自带默认值，对组件开发者无需各种判空，对外部使用者来说可以可选赋值使用
class AlertDialogConfigMaker {
  AlertDialogConfigMaker({
    this.title = "提示",
    this.content = "",
    this.confirmText = "确定",
    this.cancelText = "取消",
  });

  /// 对话框标题
  String? title;

  /// 对话框内容
  String? content;

  /// 确认按钮文案
  String? confirmText;

  /// 取消按钮文案
  String? cancelText;
}
