import 'package:flutter/material.dart';
import 'package:wangyiyun/components/root_page_head.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

const List<Tab> _tabs = [
  Tab(text: "歌曲"),
  Tab(text: "推荐"),
  Tab(text: "歌手"),
  Tab(text: "小视频"),
  Tab(text: "文章"),
  Tab(text: "视频"),
];

final List<Widget> _tabsContent = [
  Text('11111'),
  Text('22222'),
  Text('33333'),
  Text('44444'),
  Text('55555'),
  Text('66666'),
];

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(initialIndex: 1, length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RootHead(),
        bottom: TabBar(
          tabs: _tabs,
          controller: _tabController,
          isScrollable: true,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabsContent,
      ),
    );
  }
}
