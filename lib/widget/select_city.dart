import 'package:flutter/material.dart';

class SelectCityWidget extends StatefulWidget {
  const SelectCityWidget({Key? key}) : super(key: key);

  @override
  _SelectCityWidgetState createState() => _SelectCityWidgetState();
}

final _textController = TextEditingController();

class _SelectCityWidgetState extends State<SelectCityWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select City"),
      ),
      body: Form(
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _textController,
                  decoration: InputDecoration(
                      labelText: "Şehir",
                      hintText: "Şehir Seçin",
                      border: OutlineInputBorder()),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context,_textController.text);
              },
              icon: Icon(Icons.search),
            ),
          ],
        ),
      ),
    );
  }
}
