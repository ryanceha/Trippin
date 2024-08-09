import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailGalleryPage extends StatelessWidget {
  final String albumTitle;

  DetailGalleryPage({required this.albumTitle});

  final List<String> images = [
    'lib/images/details_images/1.jpg',
    'lib/images/details_images/2.jpg',
    'lib/images/details_images/3.jpg',
    'lib/images/details_images/4.jpg',
    'lib/images/details_images/5.jpg',
    'lib/images/details_images/6.jpg',
    'lib/images/details_images/7.jpg',
    'lib/images/details_images/8.jpg',
    'lib/images/details_images/9.jpg',
    'lib/images/details_images/10.jpg',
    'lib/images/details_images/11.jpeg',
    'lib/images/details_images/12.jpeg',
    'lib/images/details_images/13.jpeg',
    'lib/images/details_images/14.jpeg',
    'lib/images/details_images/15.jpeg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
              albumTitle,
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
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
          ),
          itemCount: images.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Container(
                      child: Image.asset(
                        images[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
              child: Image.asset(
                images[index],
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => AddActivity()));
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        backgroundColor: Color(0xFF3485FF),
        child: SvgPicture.asset(
          'lib/images/expense/add.svg',
          color: Colors.white,
          width: 20,
          height: 20,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
