import 'package:flutter/material.dart';
import 'package:flutter_learn/data/book.dart';
import 'package:flutter_learn/ui/book/book_details.dart';

import '../ui/home.dart';

class FLRouter {
  static const String main = 'Main';
  static const String bookDetail = 'bookDetail';

  /// 路由拦截，此处根据参数构造页面，根据不同name进行页面跳转,两个方式一个传参和不传参两种方式
  static RouteFactory generateRoute = (RouteSettings settings) {
    if (settings.name == main) {
      return MaterialPageRoute(builder: (BuildContext context) {
        return const HomePage();
      });
    }
    if (settings.name == bookDetail &&
        settings.arguments != null &&
        settings.arguments is Book) {
      return MaterialPageRoute(builder: (BuildContext context) {
        return BookDetailsPage(
          book: settings.arguments as Book,
        );
      });
    }
    return null;
  };
}
