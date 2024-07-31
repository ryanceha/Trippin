import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditBill extends StatefulWidget {
  const EditBill({super.key});

  @override
  State<EditBill> createState() => _EditBillState();
}

class _EditBillState extends State<EditBill> {
  final List<Map<String, dynamic>> items = [
    {"name": "Bebek Panggang", "price": 150000, "quantity": 3},
    {"name": "", "price": 0, "quantity": 0},
    {"name": "", "price": 0, "quantity": 0},
    {"name": "", "price": 0, "quantity": 0},
  ];

  @override
  Widget build(BuildContext context) {
    double subtotal =
        items.fold(0, (sum, item) => sum + item['price'] * item['quantity']);
    double totalAmount =
        subtotal; // Update this line as needed for tax, service charge, etc.

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32.0),
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
                    'Edit Bill Items',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 16),
                child: Text(
                  "You can edit the title, amount and price of each item",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFD9D9D9)),
                ),
              ),
              const SizedBox(height: 24),
              for (var item in items) buildItemRow(item),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    items.add({"name": "", "price": 0, "quantity": 0});
                  });
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                  backgroundColor: Color(0xFF3485FF),
                ),
                child: const Text(
                  '+ Add Items',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
              ),
              const SizedBox(height: 32),
              buildSummaryRow('Subtotal', subtotal),
              buildSummaryRow('Tax', 0),
              buildSummaryRow('Service charge', 0),
              buildSummaryRow('Discounts', 0),
              buildSummaryRow('Others', 0),
              Divider(),
              buildSummaryRow('Total amount', totalAmount),
              const SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle confirm result action
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                    backgroundColor: Color(0xFF3485FF),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                  child: const Text(
                    'Confirm Result',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildItemRow(Map<String, dynamic> item) {
    TextEditingController nameController =
        TextEditingController(text: item['name']);
    TextEditingController priceController =
        TextEditingController(text: item['price'].toString());
    TextEditingController quantityController =
        TextEditingController(text: item['quantity'].toString());

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Expanded(
            child: _inputField(
              'Item name',
              nameController,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _inputField(
              'Price',
              priceController,
            ),
          ),
          const SizedBox(width: 8),
          Text('x', style: TextStyle(fontSize: 24)),
          const SizedBox(width: 8),
          Expanded(
            child: _inputField(
              'Quantity',
              quantityController,
            ),
          ),
          const SizedBox(width: 8),
          Text('='),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              (item['price'] * item['quantity']).toString(),
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller,
      {bool isPassword = false}) {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xFF9C9C9C)));
    return TextField(
      style: const TextStyle(color: Colors.black, fontFamily: 'Inter'),
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 15),
        hintText: hintText,
        hintStyle: const TextStyle(
            color: Color(0xFF9C9C9C), fontFamily: 'Inter', fontSize: 16),
        enabledBorder: border,
        focusedBorder: border,
      ),
      obscureText: isPassword,
    );
  }

  Widget buildSummaryRow(String label, double amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 18),
          ),
          Text(
            amount.toString(),
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
