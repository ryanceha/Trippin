import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trippin/pages/split_billing_page.dart';

class EditBill extends StatefulWidget {
  final String tripTitle;
  final String tripImagePath;

  const EditBill(
      {Key? key, required this.tripTitle, required this.tripImagePath});

  @override
  State<EditBill> createState() => _EditBillState();
}

class _EditBillState extends State<EditBill> {
  // name bill text editing controller
  TextEditingController _nameController = TextEditingController();

  final List<Map<String, dynamic>> items = [
    {"name": "Bebek Panggang", "price": 150000, "quantity": 3},
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
                padding: EdgeInsets.only(left: 20, top: 5),
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
              _inputField("Bill Name", _nameController),
              const SizedBox(height: 16),
              Divider(),
              const SizedBox(height: 16),
              for (var item in items) buildItemRow(item),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    items.add({"name": "", "price": 0, "quantity": 0});
                  });
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                  backgroundColor: Color(0xFF3485FF),
                ),
                child: const Text(
                  '+ Add Items',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
              ),
              const SizedBox(height: 8),
              Divider(
                color: Color(0xFF9C9C9C),
                thickness: 0.75,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 8, bottom: 8),
                child: Text(
                  "Summary",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Divider(
                color: Color(0xFF9C9C9C),
                thickness: 0.75,
              ),
              const SizedBox(height: 4),
              buildSummaryRow('Subtotal', subtotal),
              buildSummaryRow('Tax', 0),
              buildSummaryRow('Service charge', 0),
              buildSummaryRow('Discounts', 0),
              buildSummaryRow('Others', 0),
              Divider(),
              buildSummaryRow('Total amount', totalAmount),
              const SizedBox(height: 32),
              Center(
                child: Container(
                  width: 350,
                  height: 50,
                  child: ElevatedButton(
                    // border radius

                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SplitBilling(tripTitle: widget.tripTitle, tripImagePath: widget.tripImagePath,)));
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 32),
                      backgroundColor: Color(0xFF3485FF),
                      textStyle: TextStyle(fontSize: 16),
                    ),
                    child: const Text(
                      'Confirm Result',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
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
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: _inputField(
                  'Item name',
                  nameController,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    items.remove(item);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    width: 20, // Ensure the container has a size
                    height: 20,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      'lib/images/edit_bill/delete.svg',
                      color: Colors.grey,
                      width: 15,
                      height: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 3,
                child: _inputNumberField(
                  'Price',
                  priceController,
                ),
              ),
              const SizedBox(width: 100),
              Text('x',
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold)),
              const SizedBox(width: 8),
              Flexible(
                flex: 1,
                child: _inputNumberField(
                  'Quantity',
                  quantityController,
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                flex: 2,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
                  width: 200,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 0.75),
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    (item['price'] * item['quantity']).toString(),
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller) {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Color(0xFF9C9C9C), width: 0.5));
    return TextField(
      style: const TextStyle(
          color: Colors.black, fontFamily: 'Inter', fontSize: 12),
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
        hintText: hintText,
        hintStyle: const TextStyle(
            color: Color(0xFF9C9C9C), fontFamily: 'Inter', fontSize: 12),
        enabledBorder: border,
        focusedBorder: border,
      ),
    );
  }

  Widget _inputNumberField(String hintText, TextEditingController controller) {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Color(0xFF9C9C9C), width: 0.5));
    return TextField(
      keyboardType: TextInputType.number,
      style: const TextStyle(
          color: Colors.black, fontFamily: 'Inter', fontSize: 12),
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
        hintText: hintText,
        hintStyle: const TextStyle(
            color: Color(0xFF9C9C9C), fontFamily: 'Inter', fontSize: 12),
        enabledBorder: border,
        focusedBorder: border,
      ),
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
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
            width: 120,
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF9C9C9C), width: 0.5),
                borderRadius: BorderRadius.circular(30)),
            child: Text(
              amount.toString(),
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
