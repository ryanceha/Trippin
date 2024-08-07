import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PackingListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PackingListBody(),
    );
  }
}

class PackingListBody extends StatefulWidget {
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 12,
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
          SizedBox(height: 16),
          Text(
            'Surabaya',
            style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.bold, fontFamily: 'Inter'),
          ),
          ListView.builder(
            shrinkWrap: true,
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
              style: TextStyle(color: Colors.white), // Warna teks putih
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Warna biru untuk tombol
            ),
          ),
        ],
      ),
    );
  }
}
