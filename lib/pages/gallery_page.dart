import 'package:flutter/material.dart';
import 'package:trippin/pages/gallery_detail_page.dart';

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
      backgroundColor: Color(0xFFEEF5FB),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 32),
              albumSection(context, 'Recently', recentlyAlbums),
              albumSection(context, 'Other Albums', otherAlbums),
              const SizedBox(height: 64),
            ],
          ),
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      album['image']!,
                      height: 134,
                      width: 804,
                      fit: BoxFit.contain,
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
