import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trippin/pages/home_page.dart';

class AddTripPage extends StatefulWidget {
  const AddTripPage({Key? key});

  @override
  State<AddTripPage> createState() => _AddTripPageState();
}

class _AddTripPageState extends State<AddTripPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _tripController = TextEditingController();
  DateTime? _startDate;
  DateTime? _endDate;

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
              'Add Trip',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _inputLabel("Title"),
              const SizedBox(height: 5),
              _inputField('Your trip title', _titleController),
              const SizedBox(height: 20),
              _inputLabel("Trip"),
              const SizedBox(height: 5),
              _inputField('Where to?', _tripController),
              const SizedBox(height: 20),
              Row(
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _inputLabel("Start Date"),
                        const SizedBox(height: 5),
                        _dateField(context, "From", _startDate, (date) {
                          setState(() {
                            _startDate = date;
                          });
                        }),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _inputLabel("End Date"),
                        const SizedBox(height: 5),
                        _dateField(context, "To", _endDate, (date) {
                          setState(() {
                            _endDate = date;
                          });
                        }),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _inputLabel("Who's In This Trip?"),
              const SizedBox(height: 5),
              _participantsRow(),
              const SizedBox(
                  height: 100), // Provide space for the floating button
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        },
        // make the button round
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        backgroundColor: Color(0xFF3485FF),
        child: SvgPicture.asset(
          'lib/images/add_activity/check.svg',
          color: Colors.white,
          width: 25,
          height: 25,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _inputLabel(String label) {
    return Text(
      label,
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: 'Inter',
      ),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Color(0xFF9C9C9C)),
    );
    return TextField(
      style: const TextStyle(color: Colors.black, fontFamily: 'Inter'),
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        hintText: hintText,
        hintStyle: const TextStyle(
            color: Color(0xFF9C9C9C), fontFamily: 'Inter', fontSize: 16),
        enabledBorder: border,
        focusedBorder: border,
      ),
    );
  }

  Widget _dateField(BuildContext context, String hint, DateTime? selectedDate,
      Function(DateTime) onDatePicked) {
    return GestureDetector(
      onTap: () async {
        final pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );
        if (pickedDate != null) {
          onDatePicked(pickedDate);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xFF9C9C9C)),
        ),
        child: Row(
          children: [
            Text(
              selectedDate == null
                  ? hint
                  : "${selectedDate.toLocal()}".split(' ')[0],
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Inter',
                fontSize: 16,
              ),
            ),
            Spacer(),
            SvgPicture.asset(
              'lib/images/add_activity/calendar.svg',
              color: Colors.grey,
              width: 20,
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _participantsRow() {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('lib/images/split_billing/aryo.png'),
          radius: 18,
        ),
        const SizedBox(width: 5),
        CircleAvatar(
          backgroundImage: AssetImage('lib/images/split_billing/grace.png'),
          radius: 18,
        ),
        const SizedBox(width: 5),
        CircleAvatar(
          backgroundImage: AssetImage('lib/images/split_billing/ruth.png'),
          radius: 18,
        ),
        const SizedBox(width: 5),
        CircleAvatar(
          backgroundImage: AssetImage('lib/images/split_billing/ryan.png'),
          radius: 18,
        ),
        const SizedBox(width: 5),
        GestureDetector(
          onTap: () {
            // Handle add participant
          },
          child: CircleAvatar(
            backgroundColor: Colors.grey.shade300,
            child: Icon(Icons.add, color: Colors.black),
            radius: 18,
          ),
        ),
      ],
    );
  }
}
