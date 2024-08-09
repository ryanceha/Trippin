import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PackingListPage extends StatelessWidget {
  final String tripTitle;
  const PackingListPage({Key? key, required this.tripTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PackingListBody(
        tripTitle: tripTitle,
      ),
    );
  }
}

class PackingListBody extends StatefulWidget {
  final String tripTitle;
  const PackingListBody({Key? key, required this.tripTitle}) : super(key: key);

  @override
  _PackingListBodyState createState() => _PackingListBodyState();
}

class _PackingListBodyState extends State<PackingListBody> {
  List<Map<String, dynamic>> items = [
    {'name': 'Passport', 'checked': true},
    {'name': 'Tickets', 'checked': true},
    {'name': 'Sunglasses', 'checked': false},
    {'name': 'Clothes', 'checked': false},
    {'name': 'Toiletries', 'checked': false},
    {'name': 'Camera', 'checked': false},
    {'name': 'Charger', 'checked': false}
  ];

  void _addItem(String itemName) {
    setState(() {
      items.add({'name': itemName, 'checked': false});
    });
  }

  void _showAddItemDialog() {
    TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Your Item'),
          content: TextField(
            controller: controller,
            decoration:
                InputDecoration(hintText: 'Please Input Your Item Entry'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  _addItem(controller.text);
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                // redirect to HomePage()
                Navigator.pop(context);
              },
              child: Container(
                width: 24,
                height: 24,
                child: SvgPicture.asset('lib/images/recommend/back.svg'),
              ),
            ),
            const SizedBox(width: 20),
            Text(
              'Packing List',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.tripTitle,
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter'),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(), // Disable scrolling
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Checkbox(
                        value: items[index]['checked'],
                        onChanged: (bool? value) {
                          setState(() {
                            items[index]['checked'] = value!;
                          });
                        },
                      ),
                      Expanded(
                        child: Text(
                          items[index]['name'],
                          style: TextStyle(
                            fontSize: 18,
                            decoration: items[index]['checked']
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          setState(() {
                            items.removeAt(index);
                          });
                        },
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _showAddItemDialog,
                child: Text(
                  '+ Add List Item',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0XFF3485FF),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
