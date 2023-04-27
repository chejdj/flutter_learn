import '../data/author.dart';
import '../data/book.dart';

final libraryInstance = Library()
  ..addBook(title: '天龙八部', authorName: '金庸', isPopular: true, isNew: true)
  ..addBook(title: '射雕英雄传', authorName: '金庸', isPopular: false, isNew: true)
  ..addBook(title: '神雕侠侣', authorName: '金庸', isPopular: true, isNew: false)
  ..addBook(title: '笑傲江湖', authorName: '金庸', isPopular: false, isNew: false)
  ..addBook(title: '楚留香传奇', authorName: '古龙', isPopular: true, isNew: true)
  ..addBook(title: '小李飞刀', authorName: '古龙', isPopular: false, isNew: true)
  ..addBook(title: '陆小凤传奇', authorName: '古龙', isPopular: false, isNew: true)
  ..addBook(title: '萧十一郎', authorName: '古龙', isPopular: false, isNew: false);

class Library {
  final List<Book> allBooks = [];
  final List<Author> allAuthors = [];

  void addBook({
    required String title,
    required String authorName,
    required bool isPopular,
    required bool isNew,
  }) {
    var author = allAuthors.firstWhere(
      (author) => author.name == authorName,
      orElse: () {
        final value = Author(allAuthors.length, authorName);
        allAuthors.add(value);
        return value;
      },
    );
    var book = Book(allBooks.length, title, isPopular, isNew, author);

    author.books.add(book);
    allBooks.add(book);
  }

  List<Book> get popularBooks => [
        ...allBooks.where((book) => book.isPopular),
      ];

  List<Book> get newBooks => [
        ...allBooks.where((book) => book.isNew),
      ];
}
