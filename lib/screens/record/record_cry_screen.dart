import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'components/play_button.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class RecordCryScreen extends ConsumerStatefulWidget {
  const RecordCryScreen({super.key});

  @override
  ConsumerState<RecordCryScreen> createState() => _RecordCryScreenState();
}

void playFunc() {}
void stopPlayFunc() {}

class _RecordCryScreenState extends ConsumerState<RecordCryScreen> {
  late FlutterSoundRecorder _recordingSession;
  final recordingPlayer = AssetsAudioPlayer();
  @override
  Widget build(BuildContext context) {
    bool _playAudio = false;

    return Column(
      children: [
        PlayButton(
          pauseIcon: Icon(Icons.mic, color: Colors.grey, size: 70),
          playIcon: Icon(Icons.mic, color: Colors.black, size: 70),

          // pass start recording here
          onPressed: () {},
        ),

        //// test recorded audio
        SizedBox(
          height: 20,
        ),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(elevation: 9.0, primary: Colors.red),
          onPressed: () {
            setState(() {
              _playAudio = !_playAudio;
            });
            if (_playAudio) playFunc();
            if (!_playAudio) stopPlayFunc();
          },
          icon: _playAudio
              ? Icon(
                  Icons.stop,
                )
              : Icon(Icons.play_arrow),
          label: _playAudio
              ? Text(
                  "Stop",
                  style: TextStyle(
                    fontSize: 28,
                  ),
                )
              : Text(
                  "Play",
                  style: TextStyle(
                    fontSize: 28,
                  ),
                ),
        ),
      ],
    );
  }
}
