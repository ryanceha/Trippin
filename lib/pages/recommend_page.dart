import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:intl/intl.dart';
import 'package:trippin/pages/success_page.dart';

class RecommendPage extends StatefulWidget {
  const RecommendPage({super.key});

  @override
  State<RecommendPage> createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();
  DateTimeRange? countDays;
  double progress = 0.1;

  PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        progress = (_pageController.page ?? 0) / 7;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 64),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (_pageController.page! > 0) {
                        _pageController.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Container(
                      width: 15,
                      height: 30,
                      child: SvgPicture.asset('lib/images/recommend/back.svg'),
                    ),
                  ),
                  LinearPercentIndicator(
                    animation: true,
                    animationDuration: 1000,
                    lineHeight: 10,
                    percent: progress.clamp(0, 1.0),
                    progressColor: Color(0xFF3485FF),
                    backgroundColor: Color(0xFFECECEC),
                    width: MediaQuery.of(context).size.width - 100,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      child:
                          SvgPicture.asset('lib/images/recommend/cancel.svg'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  children: [
                    _buildDatePickerPage(),
                    _buildRegionPage(),
                    _buildPlacePage(),
                    _buildActivityPage(),
                    _buildVibePage(),
                    _buildCulinaryPage(),
                    _buildDetailPage(),
                    _buildSpendingPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDatePickerPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            "When do you plan to travel?",
            style: TextStyle(
                fontFamily: 'Inter', fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 30),
        _buildDatePicker("From", fromDate, (date) {
          setState(() {
            fromDate = date;
          });
        }),
        const SizedBox(height: 20),
        _buildDatePicker("To", toDate, (date) {
          setState(() {
            toDate = date;
          });
        }),
        const SizedBox(height: 30),
        Center(
          child: Text(
            countDays != null ? "${countDays!.duration.inDays} Days" : '',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3485FF),
            ),
          ),
        ),
        const Spacer(),
        Center(
          child: ElevatedButton(
            onPressed: () {
              _pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: Text("Next",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inter',
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              textStyle: TextStyle(fontSize: 16),
              backgroundColor: Color(0xFF3485FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDatePicker(
      String label, DateTime? selectedDate, Function(DateTime) onDateSelected) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 30),
          child: Text(
            label,
            style: TextStyle(
                fontFamily: 'Inter', fontSize: 18, fontWeight: FontWeight.w800),
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () async {
            final DateTimeRange? dateTimeRange = await showDateRangePicker(
              context: context,
              firstDate: DateTime(2000),
              lastDate: DateTime(3000),
              builder: (context, child) {
                return Theme(
                  data: ThemeData.light().copyWith(
                    primaryColor: Color(0xFF3485FF),
                    colorScheme: ColorScheme.light(
                      primary: Color(0xFF3485FF),
                      onPrimary: Colors.white,
                    ),
                    highlightColor: Color(0xFF3485FF),
                    // selectedRowColor: Color(0xFF3485FF),
                    splashColor: Color(0xFF3485FF),
                    buttonTheme: ButtonThemeData(
                      textTheme: ButtonTextTheme.primary,
                    ),
                  ),
                  child: child!,
                );
              },
            );
            if (dateTimeRange != null) {
              setState(() {
                fromDate = dateTimeRange.start;
                toDate = dateTimeRange.end;
                countDays = dateTimeRange;
              });
            }
          },
          child: Center(
            child: Container(
                width: 220,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 2, color: Colors.black),
                  ),
                ),
                child: Center(
                  child: Text(
                    selectedDate != null
                        ? DateFormat('dd / MMMM / yyyy').format(selectedDate)
                        : 'DD / MM / YYYY',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600),
                  ),
                )),
          ),
        ),
      ],
    );
  }

  Widget _buildRegionPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "How far are we going ?",
          style: TextStyle(
              fontFamily: 'Inter', fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildOptionCard(
                "International", 'lib/images/recommend/international.jpg'),
            const SizedBox(width: 20),
            _buildOptionCard("Domestic", 'lib/images/recommend/domestic.jpg'),
          ],
        ),
      ],
    );
  }

  Widget _buildOptionCard(String text, String imagePath) {
    return Container(
      width: 150,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              _pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 16,
                    spreadRadius: 4,
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  text,
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlacePage() {
    String? valueChoose;
    List<String> listCity = [
      // list of popular cities in Japan
      "Tokyo",
      "Kyoto",
      "Osaka",
      "Hiroshima",
      "Nara",
      "Yokohama",
      "Sapporo",
      'Okinawa'
    ];
    List<String> listCountry = [
      // list of popular countries all around the world
      "Singapore",
      "Thailand",
      "United Arab Emirates",
      "France",
      "United States",
      "United Kingdom",
      "Japan",
      "South Korea",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Where do you want to go?",
          style: TextStyle(
              fontFamily: 'Inter', fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 30),
        Center(
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                width: 200, // Ensure the DropdownButton has a defined width
                child: DropdownButton<String>(
                  value: valueChoose,
                  onChanged: (newValue) {
                    setState(() {
                      valueChoose = newValue as String?;
                    });
                  },
                  items: listCountry.map((valueItem) {
                    return DropdownMenuItem<String>(
                      value: valueItem,
                      child: Text(valueItem),
                    );
                  }).toList(),
                  hint: Text("Select Country",
                      style: TextStyle(color: Colors.black)),
                  underline: Container(
                    height: 2,
                    color: Colors.black,
                  ),
                  isExpanded:
                      true, // Ensure the DropdownButton expands to the full width of its container
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                width: 200, // Ensure the DropdownButton has a defined width
                child: DropdownButton<String>(
                  value: valueChoose,
                  onChanged: (newValue) {
                    setState(() {
                      valueChoose = newValue as String?;
                    });
                  },
                  items: listCity.map((valueItem) {
                    return DropdownMenuItem<String>(
                      value: valueItem,
                      child: Text(valueItem),
                    );
                  }).toList(),
                  hint: Text("Select City",
                      style: TextStyle(color: Colors.black)),
                  underline: Container(
                    height: 2,
                    color: Colors.black,
                  ),
                  isExpanded:
                      true, // Ensure the DropdownButton expands to the full width of its container
                ),
              );
            },
          ),
        ),
        const Spacer(),
        Center(
          child: ElevatedButton(
            onPressed: () {
              _pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: Text("Next",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inter',
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              textStyle: TextStyle(fontSize: 16),
              backgroundColor: Color(0xFF3485FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActivityPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "What kind of activity do you want to do in this trip?",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Inter', fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildOptionCard("Active", 'lib/images/recommend/active.jpg'),
            const SizedBox(width: 20),
            _buildOptionCard('Leasure', 'lib/images/recommend/leasure.jpg')
          ],
        ),
        const SizedBox(height: 20),
        Center(
            child: _buildOptionCard(
                'Active + Lasure', 'lib/images/recommend/activeleasure.jpg'))
      ],
    );
  }

  Widget _buildVibePage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Which one do you prefer?",
          style: TextStyle(
              fontFamily: 'Inter', fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildOptionCard("Nature", 'lib/images/recommend/nature.jpg'),
            const SizedBox(width: 20),
            _buildOptionCard('Urban', 'lib/images/recommend/urban.jpg')
          ],
        ),
        const SizedBox(height: 20),
        Center(
            child: _buildOptionCard(
                'Nature + Urban', 'lib/images/recommend/natureurban.jpg'))
      ],
    );
  }

  Widget _buildCulinaryPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Do you like to go culinary?",
          style: TextStyle(
              fontFamily: 'Inter', fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildOptionCard("Yes", 'lib/images/recommend/likefood.jpg'),
            const SizedBox(width: 20),
            _buildOptionCard('No', 'lib/images/recommend/nolikefood.jpg')
          ],
        ),
      ],
    );
  }

  Widget _buildDetailPage() {
    List<String> cardName = [
      'Beach',
      'Mountain',
      'Rafting',
      'Tracking',
      'Museum',
      'Mall',
      'Savory Meal',
      "Sweet Meal"
    ];
    List<String> imagePaths = [
      'lib/images/recommend/beach.jpg',
      'lib/images/recommend/mountain.jpg',
      'lib/images/recommend/rafting.jpg',
      'lib/images/recommend/tracking.jpg',
      'lib/images/recommend/museum.jpg',
      'lib/images/recommend/mall.jpg',
      'lib/images/recommend/savory.jpg',
      'lib/images/recommend/sweet.jpg',
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Do you like to go culinary?",
          style: TextStyle(
              fontFamily: 'Inter', fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 30),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 0.75,
            ),
            itemCount: 8,
            itemBuilder: (context, index) {
              return _buildOptionCard(cardName[index], imagePaths[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSpendingPage() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "How much do you want to spend for this trip?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your budget',
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Spacer(),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // head to HomePage()
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SuccessPage()),
                        );
                      },
                      child: Text("Next",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Inter',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                        textStyle: TextStyle(fontSize: 16),
                        backgroundColor: Color(0xFF3485FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: RecommendPage(),
  ));
}
