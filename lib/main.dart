import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_portal/views/bookmark_view.dart';
import 'package:news_portal/views/home_view.dart';
import 'package:news_portal/views/notification_view.dart';
import 'package:news_portal/views/profile_view.dart';
import 'package:news_portal/views/publish_view.dart';

const Color shadowColor = Color.fromRGBO(142, 148, 153, 0.48);

const Color blue1 = Color.fromRGBO(48, 87, 255, 1);
const Color blue2 = Color.fromRGBO(151, 171, 255, 1);
const Color blue3 = Color.fromRGBO(248, 249, 255, 1);

const Color grey1 = Color.fromRGBO(142, 148, 153, 1);
const Color grey2 = Color.fromRGBO(238, 242, 244, 1);

const Color iGrey1 = Color.fromRGBO(246, 246, 246, 1);
const Color iGrey2 = Color.fromRGBO(238, 242, 244, 1);

const Color black1 = Color.fromRGBO(3, 10, 28, 1);
const Color black2 = Color.fromRGBO(9, 21, 30, 1);
const Color black3 = Color.fromRGBO(23, 37, 48, 1);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  PaintingBinding.instance.imageCache.maximumSizeBytes = 1024 * 1024 * 300;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            surfaceTintColor:Colors.white,
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          primaryColor: blue1,
          textTheme: Typography.blackHelsinki.copyWith(
            headlineLarge:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            headlineMedium:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            headlineSmall:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            displaySmall:
                const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            labelSmall: const TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: grey1),
          ),
          listTileTheme: const ListTileThemeData(
            iconColor: grey1,
            leadingAndTrailingTextStyle: TextStyle(fontSize: 12, color: grey1),
            subtitleTextStyle: TextStyle(fontSize: 12, color: grey1),
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: blue1,
            shadowColor: shadowColor,
            elevation: 3,
            padding: const EdgeInsets.all(14),
          )),
          filledButtonTheme: FilledButtonThemeData(
              style: FilledButton.styleFrom(
            textStyle: const TextStyle(fontSize: 12),
            foregroundColor: Colors.white,
            backgroundColor: blue1,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          )),
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
            foregroundColor: grey1,
            padding: const EdgeInsets.all(14),
          )),
          iconButtonTheme: IconButtonThemeData(
              style: TextButton.styleFrom(
            foregroundColor: grey1,
            padding: const EdgeInsets.all(14),
          )),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              textStyle: const TextStyle(fontSize: 12),
              foregroundColor: black1,
              side: const BorderSide(color: grey2, width: 1),
            ),
          )),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

enum PageState {
  home,
  bookmark,
  notification,
  profile;
}

class PageControllable extends InheritedWidget {
  const PageControllable(
      {super.key, required super.child, required this.state});

  final MyHomePageState state;

  @override
  bool updateShouldNotify(PageControllable oldWidget) {
    return false;
  }
}

class MyHomePageState extends State<MyHomePage> {
  PageState _pageState = PageState.home;

  PageState get pageState {
    return _pageState;
  }

  set pageState(PageState pageState) {
    if (pageState != _pageState) {
      setState(() {
        _pageState = pageState;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageControllable(
      state: this,
      child: Scaffold(
        bottomNavigationBar: NavigationBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          destinations: [
            IconButton(
              onPressed: () {
                pageState = PageState.home;
              },
              style: ElevatedButton.styleFrom(shape: const CircleBorder()),
              icon: pageState == PageState.home
                  ? const Icon(Icons.home)
                  : const Icon(Icons.home_outlined),
            ),
            IconButton(
              onPressed: () {
                pageState = PageState.bookmark;
              },
              style: ElevatedButton.styleFrom(shape: const CircleBorder()),
              icon: pageState == PageState.bookmark
                  ? const Icon(Icons.bookmark)
                  : const Icon(Icons.bookmark_outline),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PublishView()));
              },
              style: ElevatedButton.styleFrom(shape: const CircleBorder()),
              child: const Icon(Icons.add),
            ),
            IconButton(
              onPressed: () {
                pageState = PageState.notification;
              },
              style: ElevatedButton.styleFrom(shape: const CircleBorder()),
              icon: pageState == PageState.notification
                  ? const Icon(Icons.add_alert)
                  : const Icon(Icons.add_alert_outlined),
            ),
            IconButton(
              onPressed: () {
                pageState = PageState.profile;
              },
              style: ElevatedButton.styleFrom(shape: const CircleBorder()),
              icon: pageState == PageState.profile
                  ? const Icon(Icons.person)
                  : const Icon(Icons.person_outline),
            )
          ],
        ),
        body: Stack(
          children: [
            Offstage(
              offstage: _pageState != PageState.home,
              child: CupertinoTabView(builder: (context) => const HomeView()),
            ),
            Offstage(
              offstage: _pageState != PageState.bookmark,
              child:
                  CupertinoTabView(builder: (context) => const BookmarkView()),
            ),
            Offstage(
              offstage: _pageState != PageState.notification,
              child: CupertinoTabView(
                  builder: (context) => const NotificationView()),
            ),
            Offstage(
              offstage: _pageState != PageState.profile,
              child:
                  CupertinoTabView(builder: (context) => const ProfileView()),
            ),
          ],
        ),
      ),
    );
  }
}
