import 'package:flutter/material.dart';
class splashScreen extends StatelessWidget {
  const splashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network("https://i.postimg.cc/2SqJDH7N/Meme-Masala-Logo.png"),
            SizedBox(height: 50,),
            Text("MemeMasala App",style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold))
          ],
        ),
      )
    );
  }
}

