import 'dart:io';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:stories_editor/stories_editor.dart';

class StoriesEditorPage extends StatefulWidget {
  const StoriesEditorPage({Key? key}) : super(key: key);

  @override
  State<StoriesEditorPage> createState() => _StoriesEditorPageState();
}

class _StoriesEditorPageState extends State<StoriesEditorPage> {
  @override
  Widget build(BuildContext context) {
    return StoriesEditor(
      giphyKey: "WeO2Ogf5lFL37XMHUJzuYmGvyO93BJ0G",
      onDone: (val) {
        print("============================");
        print("VAL: $val");
        print("============================");

        // File image = File(val);

        Share.shareXFiles([XFile(val)]);
      },
      gradientColors: [
        [Colors.orange, Colors.white, Colors.green],
        [Colors.red, Colors.deepOrange, Colors.amberAccent],
        [Colors.indigo, Colors.blue, Colors.lightBlue],
      ],
      galleryThumbnailQuality: 150,
      isCustomFontList: true,
      fontFamilyList: [
        "MW",
        "RS",
        "DS",
      ],
      middleBottomWidget: Image.asset(
        "assets/images/logo.png",
        scale: 3,
      ),
    );
  }
}
