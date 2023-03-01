import 'package:just_audio/just_audio.dart';

class FAudioManager {
  final _audioPlayer = AudioPlayer();

  Future<void> stopAndPlayAudio(String audioUrl) async {
    await _audioPlayer.stop();
    await _audioPlayer.setUrl(audioUrl);
    await _audioPlayer.play();
  }

  int get max => _audioPlayer.duration?.inSeconds ?? 0;
  Duration? get duration => _audioPlayer.duration;
  Stream<Duration> get position => _audioPlayer.positionStream;

  void setSpeed(double speed) {
    _audioPlayer.setSpeed(speed);
  }

  Future<void> seek(Duration position) => _audioPlayer.seek(position);

  void onPause() {
    _audioPlayer.pause();
  }

  void onResume() {
    _audioPlayer.play();
  }

  void onStop() {
    _audioPlayer.stop();
  }

  Future<void> onLoad(String audioUrl) async {
    _audioPlayer.setUrl(audioUrl);
    await _audioPlayer.load();
  }
}
