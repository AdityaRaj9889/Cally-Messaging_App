import 'package:callingapp/app_pages.dart';
import 'package:callingapp/constant/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AppbarWidget extends GetView<AppbarWidget>
    implements PreferredSizeWidget {
  final RxString title;
  final RxString? firstIcon;
  final RxString? secondIcon;
  final RxString? lastIcon;
  final void Function()? fIconClick;
  final void Function()? sIconClick;
  final void Function()? lIconClick;
  final bool leading;
  final String profile;
  final bool? moreOption;

  AppbarWidget({
    super.key,
    required this.title,
    this.firstIcon,
    this.fIconClick,
    this.secondIcon,
    this.sIconClick,
    this.lastIcon,
    this.lIconClick,
    this.leading = true,
    this.profile = '',
    this.moreOption = false,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  List<String> menuList = ["Contact", "New Chat", "New Group", "Settings"];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.only(top: 15),
          child: AppBar(
            title: Text(
              title.value,
              style: TextStyle(fontSize: 21, color: ColorConst.color7),
            ),
            leadingWidth: profile.isEmpty ? 48 : 86,
            titleSpacing: 8,
            backgroundColor: ColorConst.color3,
            elevation: 0,
            leading: leading
                ? Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Icon(
                            Icons.arrow_back,
                            size: 21,
                            color: ColorConst.color1,
                          ),
                        ),
                      ),
                      if (profile.isNotEmpty)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100.0),
                          child: Image.asset(
                            profile,
                            height: 37,
                            width: 37,
                          ),
                        ),
                    ],
                  )
                : null,
            actions: [
              Row(
                children: [
                  firstIcon == null
                      ? Container()
                      : GestureDetector(
                          onTap: fIconClick,
                          child: Container(
                            margin: const EdgeInsets.only(right: 8.0),
                            height: 35,
                            width: 35,
                            padding: const EdgeInsets.all(9.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorConst.color10,
                            ),
                            child: SvgPicture.asset(
                              firstIcon!.value,
                              color: ColorConst.color1,
                            ),
                          ),
                        ),
                  secondIcon == null
                      ? Container()
                      : GestureDetector(
                          onTap: sIconClick,
                          child: Container(
                            margin: const EdgeInsets.only(right: 8.0),
                            height: 35,
                            width: 35,
                            padding: const EdgeInsets.all(9.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorConst.color10,
                            ),
                            child: SvgPicture.asset(
                              secondIcon!.value,
                              color: ColorConst.color1,
                            ),
                          ),
                        ),
                  lastIcon == null
                      ? Container()
                      : GestureDetector(
                          onTap: lIconClick,
                          child: Container(
                            margin: const EdgeInsets.only(right: 15.0),
                            height: 35,
                            width: 35,
                            padding: const EdgeInsets.all(9.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorConst.color10,
                            ),
                            child: SvgPicture.asset(
                              lastIcon!.value,
                              color: ColorConst.color1,
                            ),
                          ),
                        ),
                  if (moreOption as bool)
                    PopupMenuButton(
                      color: ColorConst.color3,
                      onSelected: (value) {
                        if (value == "Profile") {
                          Get.toNamed(Routes.PROFILE);
                        } else if (value == "about") {
                          // Get.toNamed(Routes.PROFILE);
                        }
                      },
                      itemBuilder: (context) {
                        return List.generate(menuList.length, (index) {
                          return PopupMenuItem(
                            value: menuList[index],
                            child: Text(
                              menuList[index],
                              style: TextStyle(
                                color: ColorConst.color7,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          );
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 15.0),
                        height: 35,
                        width: 35,
                        padding: const EdgeInsets.all(9.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorConst.color10,
                        ),
                        child: SvgPicture.asset(
                          AssetsSVG.more,
                          color: ColorConst.color1,
                        ),
                      ),
                    )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
