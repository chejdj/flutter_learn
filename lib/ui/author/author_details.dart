import 'package:flutter/material.dart';

import '../../data/author.dart';
import '../../widgets/book_list.dart';

class AuthorDetailsPage extends StatelessWidget {
  final Author author;

  const AuthorDetailsPage({
    super.key,
    required this.author,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(author.name),
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: BookList(
                  books: author.books,
                  onTap: (book) {
                    //no op
                  },
                ),
              ),
            ],
          ),
        ),
      );
}
