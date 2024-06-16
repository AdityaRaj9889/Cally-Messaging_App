import 'package:callingapp/constant/assets.dart';
import 'package:callingapp/controller/homeController.dart';
import 'package:callingapp/widgetComponents/appbar.dart';
import 'package:callingapp/widgetComponents/call/callHome.dart';
import 'package:callingapp/widgetComponents/chat/chatHome.dart';
import 'package:callingapp/widgetComponents/homeTabs.dart';
import 'package:callingapp/widgetComponents/status/statusHome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorConst.color3,
          appBar: AppbarWidget(
            title: 'WhatsApp'.obs,
            leading: false,
            firstIcon: AssetsSVG.camera.obs,
            fIconClick: () {},
            lastIcon: AssetsSVG.more.obs,
            lIconClick: () {},
          ),
          body: Column(
            children: [
              HomeTabs(),
              Expanded(
                child: TabBarView(
                  children: [
                    ChatHomeWidget(),
                    StatusHomeWidget(),
                    CallHomeWidget()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
