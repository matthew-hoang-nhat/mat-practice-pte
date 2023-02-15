import 'package:just_audio/just_audio.dart';

class FAudioManager {
  final _audioPlayer = AudioPlayer();

  void stopAndPlayAudio(String audioUrl) {
    _audioPlayer.stop();
    _audioPlayer.setUrl(audioUrl);
    _audioPlayer.play();
  }
}
