import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trippin/pages/dashboard_page.dart';

class AddActivity extends StatefulWidget {
  const AddActivity({super.key});

  @override
  State<AddActivity> createState() => _AddActivityState();
}

class _AddActivityState extends State<AddActivity> {
  final TextEditingController _activityController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();
  final TextEditingController _expensesController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime? _selectedDate;
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;
  Color? _selectedColor;
  String? _selectedIcon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32.0),
        child: SingleChildScrollView(
          child: Column(
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
                    'Add Activity',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _label("Activity Name"),
              const SizedBox(height: 5),
              _inputField('Your Activity', _activityController),
              const SizedBox(height: 20),
              _label("Place"),
              const SizedBox(height: 5),
              _inputField('Place to Visit', _placeController),
              const SizedBox(height: 20),
              Row(
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _label("Date"),
                        const SizedBox(height: 5),
                        _dateField(context),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _label("Expense"),
                        const SizedBox(height: 5),
                        _inputField('Add Expenses', _expensesController),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              _label("Start Time and End Time"),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                      child: _timeField(context, "From", _startTime,
                          (selectedTime) {
                    setState(() {
                      _startTime = selectedTime;
                    });
                  })),
                  const SizedBox(width: 10),
                  Expanded(
                      child:
                          _timeField(context, "To", _endTime, (selectedTime) {
                    setState(() {
                      _endTime = selectedTime;
                    });
                  })),
                ],
              ),
              const SizedBox(height: 20),
              _label("Description"),
              const SizedBox(height: 5),
              _inputField('Add your notes here', _descriptionController),
              const SizedBox(height: 20),
              _label("Color"),
              const SizedBox(height: 5),
              _colorPicker(),
              const SizedBox(height: 20),
              _label("Icon"),
              const SizedBox(height: 5),
              _iconPicker(),
              const SizedBox(
                  height: 100), // Provide space for the floating button
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DashboardPage()));
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

  Widget _label(String label) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        label,
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'Inter',
        ),
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

  Widget _dateField(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final selectedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );
        setState(() {
          _selectedDate = selectedDate;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color(0xFF9C9C9C)),
        ),
        child: Row(
          children: [
            Text(
              _selectedDate == null
                  ? 'Choose a date'
                  : "${_selectedDate!.toLocal()}".split(' ')[0],
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

  Widget _timeField(BuildContext context, String hint, TimeOfDay? selectedTime,
      Function(TimeOfDay) onTimePicked) {
    return GestureDetector(
      onTap: () async {
        final pickedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
        if (pickedTime != null) {
          onTimePicked(pickedTime);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color(0xFF9C9C9C)),
        ),
        child: Row(
          children: [
            Text(
              selectedTime == null ? hint : selectedTime.format(context),
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Inter',
                fontSize: 16,
              ),
            ),
            Spacer(),
            SvgPicture.asset(
              'lib/images/add_activity/clock.svg',
              color: Colors.grey,
              width: 20,
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _colorPicker() {
    List<Color> colors = [
      Color(0xFFEFB949),
      Color(0xFFE2305F),
      Color(0xFF47712D),
      Color(0xFF0037F8),
      Color(0xFF9747FF),
      Color(0xFF00FFF0),
      Color(0xFFFF0000)
    ];
    return Wrap(
      spacing: 10,
      children: colors.map((color) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedColor = color;
            });
          },
          child: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: _selectedColor == color
                      ? Colors.black.withOpacity(0.5)
                      : Colors.transparent,
                  spreadRadius: 2,
                  blurRadius: 2,
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _iconPicker() {
    List<String> icons = [
      'lib/images/add_activity/route.svg',
      'lib/images/add_activity/shop.svg',
      'lib/images/add_activity/food.svg',
      'lib/images/add_activity/indoor.svg',
      'lib/images/add_activity/outdoor.svg',
      'lib/images/add_activity/play.svg',
    ];
    return Wrap(
      spacing: 20,
      children: icons.map((icon) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedIcon = icon;
            });
          },
          child: Container(
            width: 40,
            height: 40,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: _selectedIcon == icon
                    ? Color(0xFF3485FF)
                    : Colors.transparent,
                width: 2,
              ),
            ),
            child: SvgPicture.asset(
              icon,
              width: 24,
              height: 24,
              color: _selectedIcon == icon ? Color(0xFF3485FF) : Colors.grey,
            ),
          ),
        );
      }).toList(),
    );
  }
}
