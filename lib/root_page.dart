import 'package:flutter/material.dart';

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
      body: const Center(child: Text('RootPage')),
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
      margin: EdgeInsets.only(top: 56),
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
    );
  }

  // 底部切换
  void _onTabClick(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
