import 'package:flutter/material.dart';
import 'package:flutter_learn/routing/router.dart';

import '../../data/book.dart';
import '../../domain/library.dart';
import '../../widgets/book_list.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({
    super.key,
  });

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('书籍'),
          bottom: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(
                text: '流行',
                icon: Icon(Icons.people),
              ),
              Tab(
                text: '新的',
                icon: Icon(Icons.new_releases),
              ),
              Tab(
                text: '所有',
                icon: Icon(Icons.list),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            BookList(
              books: libraryInstance.popularBooks,
              onTap: _handleBookTapped,
            ),
            BookList(
              books: libraryInstance.newBooks,
              onTap: _handleBookTapped,
            ),
            BookList(
              books: libraryInstance.allBooks,
              onTap: _handleBookTapped,
            ),
          ],
        ),
      );

  /// 携带参数的路由跳转
  void _handleBookTapped(Book book) {
    Navigator.pushNamed(context, FLRouter.bookDetail, arguments: book);
  }
}
