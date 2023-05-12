import 'dart:io';
import 'dart:ui';

import 'package:festival_post_app_jcf10/views/screens/sticker_editor_page.dart';
import 'package:festival_post_app_jcf10/views/screens/stories_editor_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:stickereditor/stickereditor.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey imageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RepaintBoundary(
              key: imageKey,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const StickerEditorPage(),
                  ),
                ),
                child: const Text("Sticker Editor"),
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const StoriesEditorPage(),
                ),
              ),
              child: const Text("Stories Editor"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          RenderRepaintBoundary bountry = imageKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
          var img = await bountry.toImage(
            pixelRatio: 5,
          );
          var bit = await img.toByteData(format: ImageByteFormat.png);
          var uList = bit!.buffer.asUint8List();

          print("=================================");
          print(uList.toString());
          print("=================================");

          if (uList != null) {
            Directory dir = await getApplicationDocumentsDirectory();

            DateTime d = DateTime.now();
            File file = await File("${dir.path}/FA${d.year}${d.month}${d.day}${d.hour}${d.minute}${d.second}.png").create();
            await file.writeAsBytes(uList);

            print("=================================");
            print("Image path: ${file.path}");
            print("=================================");

            Share.shareXFiles([XFile(file.path)]);
          }
        },
        child: const Icon(Icons.share),
      ),
    );
  }
}
