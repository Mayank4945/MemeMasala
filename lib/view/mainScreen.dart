import 'package:flutter/material.dart';
import 'package:mememasala/controller/fetchMeme.dart';

class MainScreen extends StatefulWidget { // Changed class name to follow Dart naming conventions
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> memeUrls = []; // Added list to store meme URLs
  int currentIndex = 0; // Added index to track the current meme

  @override
  void initState() {
    super.initState();
    fetchMemes(); // Fetch memes when the widget is initialized
  }

  void fetchMemes() async {
    List<String> memes = await FetchMeme.fetchNewMeme(); // Fetch meme URLs
    setState(() {
      memeUrls = memes; // Update state with the fetched meme URLs
    });
  }

  void updateImg() {
    setState(() {
      if (memeUrls.isNotEmpty) {
        currentIndex = (currentIndex + 1) % memeUrls.length; // Increment index to show the next meme
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String imgUrl = memeUrls.isNotEmpty ? memeUrls[currentIndex] : "https://i.imgflip.com/30b1gx.jpg"; // Use current meme URL if available

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 120),
            Text("Meme #${currentIndex + 1}", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
            SizedBox(height: 10),
            Text("Target 500 Memes", style: TextStyle(fontSize: 18)),
            SizedBox(height: 50),
            Container(
              width: 300,
              height: 300,  // Set fixed dimensions
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: Image.network(
                imgUrl,
                fit: BoxFit.contain,  // Adjust the image size within the container
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                updateImg();
              },
              child: Container(
                height: 50,
                width: 150,
                child: Center(
                  child: Text("More Fun!", style: TextStyle(fontSize: 20)),
                ),
              ),
            ),
            Spacer(),
            Text("APP CREATED BY", style: TextStyle(fontSize: 20)),
            Text("MAYANK SHARMA", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
