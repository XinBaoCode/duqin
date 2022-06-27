import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wangyiyun/root_page.dart';

class TransitPage extends StatefulWidget {
  const TransitPage({Key? key}) : super(key: key);

  @override
  State<TransitPage> createState() => _TransitPageState();
}

class _TransitPageState extends State<TransitPage> {
  late Timer _timer;
  int _currentTime = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/common/page.png',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            right: 10,
            child: InkWell(
              onTap: _jumpRootPage,
              child: _clipButton(),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      setState(() {
        _currentTime--;
      });
      if (_currentTime <= 0) {
        _jumpRootPage();
      }
    });
  }

// 跳转首页
  void _jumpRootPage() {
    _timer.cancel();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          // ignore: prefer_const_constructors
          builder: (BuildContext context) => RootPage(),
        ),
        (route) => false);
  }

  // 跳过按钮
  Widget _clipButton() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
          width: 50,
          height: 50,
          color: Colors.black.withOpacity(0.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '跳过',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              Text(
                '${_currentTime}s',
                style: const TextStyle(color: Colors.white, fontSize: 12),
              )
            ],
          )),
    );
  }
}
