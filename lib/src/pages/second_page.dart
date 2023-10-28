import 'package:flutter/material.dart';
import 'package:materi_api/src/api/fetch_data.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => SecondPageState();
}

class SecondPageState extends State<SecondPage> {
  final example = ExampleApi();

  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Page')),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: titleController,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Body'),
            controller: bodyController,
          ),
          SizedBox(height: 10),
          ElevatedButton(
              onPressed: () async {
                String title = titleController.text;
                String body = bodyController.text;

                try {
                  bool success = await example.postDataToApi(
                    title,
                    body,
                  );
                  if (success) {
                    print(title);
                    print(body);
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Data telat di post ke API')));
                  }
                } catch (e) {}
              },
              child: Text('Post to API'))
        ],
      ),
    );
  }
}
