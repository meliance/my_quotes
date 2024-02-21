import 'package:flutter/material.dart';

import 'quote.dart';
import 'quote_card.dart';

void main() => runApp(MaterialApp(
  home: QuoteList(),
));
class QuoteList extends StatefulWidget {
  const QuoteList({Key? key}) : super(key: key);

  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quotes = [
    Quote(author: 'Franklin D. Roosevelt', text: 'The only thing we have to fear is fear itself.'),
    Quote(author: 'Eleanor Roosevelt', text: 'Do one thing every day that scares you.'),
    Quote(author: 'Tony Robbins', text: 'The only impossible journey is the one you never begin.'),
    Quote(author: 'Abraham Lincoln', text: "In the end, it's not the years in your life that count. It's the life in your years."),
  ];

  void addQuote(String quoteText, String authorText) {
    setState(() {
      quotes.add(Quote(author: authorText, text: quoteText));
    });
  }

  void deleteQuote(int index) {
    setState(() {
      quotes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        title: Text('Awesome Quotes'),
        centerTitle: true,
        backgroundColor: Colors.indigo[100],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: quotes.length,
              itemBuilder: (context, index) {
                return QuoteCard(
                  quote: quotes[index],
                  delete: () => deleteQuote(index),
                  add: addQuote,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}



