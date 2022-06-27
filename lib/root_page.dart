import 'package:flutter/material.dart';
import 'package:wangyiyun/view/root_pages/home_page.dart';
import 'package:wangyiyun/view/root_pages/music_page.dart';
import 'package:wangyiyun/view/root_pages/profile.dart';
import 'package:wangyiyun/view/root_pages/tiny_video.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

const Map<String, String> _buttonNames = {
  'home': '首页',
  'music': '音乐',
  'create_media': '',
  'tiny_video': '小视频',
  'profile': '我的',
};

class _RootPageState extends State<RootPage> {
  // 当前选中页索引
  int _currentIndex = 0;
  // 底部导航列表
  final List<BottomNavigationBarItem> _bottomNavBarList = [];
  // 页面集合
  final List<Widget> _pages = [
    HomePage(),
    MusicPage(),
    Container(),
    ProfilePage(),
    TinyVideoPage(),
  ];

  @override
  void initState() {
    super.initState();
    // 生成底部导航栏
    _buttonNames.forEach((key, value) {
      _bottomNavBarList.add(_bottomNavBarItem(key, value));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavBarList,
        currentIndex: _currentIndex,
        onTap: _onTabClick,
        type: BottomNavigationBarType.fixed,
      ),
      floatingActionButton: _createMediaButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

// 中间的发布按钮
  Widget _createMediaButton() {
    return Container(
      margin: const EdgeInsets.only(top: 56),
      child: FloatingActionButton(
        onPressed: _onCreateMedia,
        child: Image.asset(
          'assets/images/icons/create_media.png',
          width: 44,
          height: 44,
        ),
      ),
    );
  }

  // 点击发布按钮
  void _onCreateMedia() {}

  // 单个导航列表
  BottomNavigationBarItem _bottomNavBarItem(String key, String value) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        'assets/images/icons/$key.png',
        width: 24,
        height: 24,
      ),
      activeIcon: Image.asset(
        'assets/images/icons/${key}_active.png',
        width: 24,
        height: 24,
      ),
      label: value,
      tooltip: "",
    );
  }

  // 底部切换
  void _onTabClick(int index) {
    if (index == 2) {
      return _onCreateMedia();
    }
    setState(() {
      _currentIndex = index;
    });
  }
}
