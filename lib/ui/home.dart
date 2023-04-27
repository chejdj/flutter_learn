import 'package:flutter/material.dart';
import 'package:flutter_learn/ui/author/authors.dart';
import 'package:flutter_learn/ui/book/books.dart';
import 'package:flutter_learn/ui/common/common.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  static const int homeTabLength = 3;
  TabController? controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: homeTabLength, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller?.index ?? 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.book), label: '书籍'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '作者'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '通用'),
        ],
        onTap: (int? tapIndex) {
          setState(() {
            controller?.animateTo(tapIndex ?? 0);
          });
        },
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: const <Widget>[
          BooksPage(),
          AuthorsPage(),
          CommonPage(),
        ],
      ),
    );
  }
}
