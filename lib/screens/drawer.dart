import 'package:flutter/material.dart';
import 'package:flutter_app/configs/basic_config.dart';
import 'package:flutter_app/providers/user_state.dart';
import 'package:provider/provider.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.watch<UserState>().isDarkMode
          ? kColorBgMenuDark
          : kColorBgMenuLight,
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/image/icon.png",
                    height: 50,
                    width: 50,
                  ),
                  Text(
                    "Trình đọc",
                    style: TextStyle(
                        fontSize: 30,
                        color: context.watch<UserState>().isDarkMode
                            ? kColorBgMenuLight
                            : kColorBgMenuDark),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.home,
                          size: 30,
                          color: context.watch<UserState>().isDarkMode
                              ? kColorBgMenuLight
                              : kColorBgMenuDark),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Trang chủ",
                        style: TextStyle(
                            fontSize: 25,
                            color: context.watch<UserState>().isDarkMode
                                ? kColorBgMenuLight
                                : kColorBgMenuDark),
                      )
                    ]),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    context.read<UserState>().ChageMode();
                    Navigator.pop(context);
                  });
                },
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Icon(Icons.dark_mode,
                      size: 30,
                      color: context.watch<UserState>().isDarkMode
                          ? kColorBgMenuLight
                          : kColorBgMenuDark),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Chủ đề ứng dụng",
                      style: TextStyle(
                          fontSize: 25,
                          color: context.watch<UserState>().isDarkMode
                              ? kColorBgMenuLight
                              : kColorBgMenuDark))
                ]),
              ),
              Divider(
                height: 10,
                color: context.watch<UserState>().isDarkMode
                    ? kColorBgMenuLight
                    : kColorBgMenuDark,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Icon(Icons.share,
                    size: 30,
                    color: context.watch<UserState>().isDarkMode
                        ? kColorBgMenuLight
                        : kColorBgMenuDark),
                SizedBox(
                  width: 10,
                ),
                Text("Chia sẽ",
                    style: TextStyle(
                        fontSize: 25,
                        color: context.watch<UserState>().isDarkMode
                            ? kColorBgMenuLight
                            : kColorBgMenuDark))
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Icon(Icons.policy,
                    size: 30,
                    color: context.watch<UserState>().isDarkMode
                        ? kColorBgMenuLight
                        : kColorBgMenuDark),
                SizedBox(
                  width: 10,
                ),
                Text("Chính sách bảo mật",
                    style: TextStyle(
                        fontSize: 25,
                        color: context.watch<UserState>().isDarkMode
                            ? kColorBgMenuLight
                            : kColorBgMenuDark))
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Icon(Icons.star,
                    size: 30,
                    color: context.watch<UserState>().isDarkMode
                        ? kColorBgMenuLight
                        : kColorBgMenuDark),
                SizedBox(
                  width: 10,
                ),
                Text("Đánh giá",
                    style: TextStyle(
                        fontSize: 25,
                        color: context.watch<UserState>().isDarkMode
                            ? kColorBgMenuLight
                            : kColorBgMenuDark))
              ])
            ],
          ),
        ),
      ),
    );
  }
}
