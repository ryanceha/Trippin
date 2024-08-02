import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trippin/pages/detail_gallery.dart';

class GalleryPage extends StatelessWidget {
  final List<Map<String, String>> recentlyAlbums = [
    {'title': 'Pantai Kuta', 'image': 'lib/images/gallery/kuta.png'},
    {'title': 'Bandung', 'image': 'lib/images/gallery/bandung.png'},
  ];

  final List<Map<String, String>> otherAlbums = [
    {'title': 'Jepang', 'image': 'lib/images/gallery/jepang.png'},
    {'title': 'Pulau Seribu', 'image': 'lib/images/gallery/pulau_seribu.png'},
    {'title': 'Korea Selatan', 'image': 'lib/images/gallery/korsel.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              'Albums',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 8),
            albumSection(context, 'Recently', recentlyAlbums),
            albumSection(context, 'Other Albums', otherAlbums),
          ],
        ),
      ),
    );
  }

  Widget albumSection(
      BuildContext context, String title, List<Map<String, String>> albums) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              TextButton(
                onPressed: () {},
                child: Text('See All'),
              ),
            ],
          ),
          Column(
            children: albums.map((album) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailGalleryPage(
                        albumTitle: album['title'] ?? 'No Title',
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      album['image']!,
                      height: 134,
                      width: 804,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
