import 'package:flutter/material.dart';
import 'package:trippin/pages/edit_bill_page.dart';
import 'package:trippin/pages/home_page.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScanBillPage extends StatefulWidget {
  const ScanBillPage({Key? key}) : super(key: key);

  @override
  _ScanBillPageState createState() => _ScanBillPageState();
}

class _ScanBillPageState extends State<ScanBillPage> {
  late VideoPlayerController _controller;
  bool _videoEnded = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  void _initializeVideo() {
    _controller =
        VideoPlayerController.asset('lib/images/scan_bill/scanbill.mp4')
          ..initialize().then((_) {
            setState(() {});
            _controller.play();
            _controller.addListener(() {
              if (_controller.value.position == _controller.value.duration) {
                setState(() {
                  // print 'video sudah selesai'
                  print("Video Done");
                  _videoEnded = true;
                });
              }
            });
          }).catchError((error) {
            print('Error initializing video: $error');
          });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 20),
            child: Stack(
              children: [
                Center(
                  child: Text(
                    'Scan Bill',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 20,
                  child: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: _controller.value.isInitialized
                  ? Container(
                      width: 300,
                      height: 400,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        ),
                      ),
                    )
                  : Container(
                      width: 300,
                      height: 400,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          color: Colors.grey[300],
                          child: Icon(
                            Icons.camera_alt,
                            size: 100,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 30, left: 20, right: 20, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                    'lib/images/scan_bill/galery.svg',
                    width: 40,
                    height: 40,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: SvgPicture.asset(
                    'lib/images/scan_bill/camera_icon.svg',
                    width: 60,
                    height: 60,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditBill()),
                    );
                  },
                ),
                IconButton(
                  icon: SvgPicture.asset(
                    'lib/images/scan_bill/flash_icon.svg',
                    width: 40,
                    height: 40,
                  ),
                  onPressed: () {
                    // Action for flash
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
