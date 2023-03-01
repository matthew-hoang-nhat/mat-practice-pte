import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/services/audio_manger.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';

part 'audio_state.dart';

class AudioCubit extends Cubit<AudioState> {
  AudioCubit() : super(AudioState.initial());

  final _audio = GlobalVariables.getIt<FAudioManager>();
  late final positionStream = _audio.position;

  void onClick() {
    if (state.isPlay) {
      _onPause();
    } else {
      _onResume();
    }
  }

  void setSpeed(double speed) {
    _audio.setSpeed(speed);
  }

  Future<void> seek(double position) async {
    final newPosition = Duration(seconds: position.toInt());
    _audio.seek(newPosition);
  }

  void onDone() => _onPause();

  void onRedo() {
    const normalSpeed = 1.0;
    const startPosition = 0.0;
    _onStop();
    _isPauseAndSetNormalSpeed();
    onChangeSpeed(normalSpeed);
    seek(startPosition);
  }

  void onChangeSpeed(double? speed) {
    emit(state.copyWith(speed: speed));
    _audio.setSpeed(speed!);
  }

  Future<void> onChangeAudioUrl(String audioUrl) async {
    _isPauseAndSetNormalSpeed();
    emit(state.copyWith(audioUrl: audioUrl));
    _onStop();
    await _onLoad();
    emit(state.copyWith(duration: _audio.duration));
  }

  Future<void> _onLoad() => _audio.onLoad(state.audioUrl);

  void _isPauseAndSetNormalSpeed() {
    const normalSpeed = 1.0;
    emit(state.copyWith(
      isPlay: false,
      speed: normalSpeed,
    ));
  }

  void _onPause() {
    _audio.onPause();
    emit(state.copyWith(isPlay: false));
  }

  void _onResume() {
    _audio.onResume();
    emit(state.copyWith(isPlay: true));
  }

  void _onStop() {
    _audio.onStop();
    emit(state.copyWith(isPlay: false));
  }

  @override
  Future<void> close() {
    _onStop();
    return super.close();
  }
}
