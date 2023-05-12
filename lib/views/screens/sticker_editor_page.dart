import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StickerEditorPage extends StatefulWidget {
  const StickerEditorPage({Key? key}) : super(key: key);

  @override
  State<StickerEditorPage> createState() => _StickerEditorPageState();
}

class _StickerEditorPageState extends State<StickerEditorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Festival App"),
        centerTitle: true,
      ),
      body: Center(
          // child: StickerEditingView(
          //   assetList: List.generate(26, (index) => "assets/images/${String.fromCharCode(index + 97)}.png"),
          //   fonts: [
          //     "DS",
          //     "Foldit",
          //     "RS",
          //     "MW",
          //   ],
          //   imgUrl:
          //       "https://us.123rf.com/450wm/shushanto/shushanto2209/shushanto220900703/191842443-destruction-of-planets-concept-art-illustration-background-image.jpg?ver=6",
          //   isnetwork: true,
          // ),
          ),
    );
  }
}
