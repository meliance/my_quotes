import 'package:flutter/material.dart';
import 'quote.dart';

class QuoteCard extends StatelessWidget {
final Quote quote;
final void Function()? delete;
final void Function(String quote, String author)? add;

QuoteCard({required this.quote, required this.delete, required this.add});

final TextEditingController quoteController = TextEditingController();
final TextEditingController authorController = TextEditingController();

@override
Widget build(BuildContext context) {
return Card(
  margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          quote.text,
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: 4),
        Text(
          quote.author,
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey[800],
          ),
        ),
        SizedBox(height: 4),
        if (delete != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 30,
                height: 30,
                child: FloatingActionButton(
                  onPressed: delete,
                  tooltip: 'Delete quote',
                  child: Icon(Icons.delete),
                ),
              ),

              SizedBox(width: 28),
              FloatingActionButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Add New Quote'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: quoteController,
                            decoration: InputDecoration(labelText: 'Write your Quote'),
                          ),
                          TextField(
                            controller: authorController,
                            decoration: InputDecoration(labelText: 'Name of Author'),
                          ),
                        ],
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            String quote = quoteController.text;
                            String author = authorController.text;
                            add?.call(quote, author);
                            quoteController.clear();
                            authorController.clear();
                            Navigator.pop(context);
                          },
                          child: Text('Add'),
                        ),
                      ],
                    ),
                  );
                },
                tooltip: 'Add quote',
                mini: true,
                child: Icon(Icons.add),
              ),
            ],
          ),
      ],
    ),
  ),
);
}
}
