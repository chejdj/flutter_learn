import 'package:flutter/material.dart';

import '../../domain/library.dart';
import '../../widgets/author_list.dart';

class AuthorsPage extends StatelessWidget {
  final String title = 'Authors';

  const AuthorsPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: AuthorList(
          authors: libraryInstance.allAuthors,
          onTap: (author) {
            // no op
          },
        ),
      );
}
