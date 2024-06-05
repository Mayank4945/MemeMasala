import 'dart:convert';
import 'package:http/http.dart';

class FetchMeme {
  static Future<List<String>> fetchNewMeme() async {
    Response response = await get(Uri.parse("https://api.imgflip.com/get_memes"));
    Map<String, dynamic> body_data = jsonDecode(response.body);
    List<dynamic> memes = body_data["data"]["memes"];
    List<String> memeUrls = memes.map((meme) => meme["url"].toString()).toList();
    return memeUrls;
  }
}
