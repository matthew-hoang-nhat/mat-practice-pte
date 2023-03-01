part of 'audio_cubit.dart';

class AudioState extends Equatable {
  const AudioState({
    required this.isPlay,
    required this.audioUrl,
    required this.speed,
    required this.duration,
  });
  final bool isPlay;
  final String audioUrl;
  final Duration duration;
  final double speed;

  factory AudioState.initial() => const AudioState(
        audioUrl: '',
        isPlay: false,
        speed: 1.0,
        duration: Duration(),
      );
  @override
  List<Object?> get props => [
        isPlay,
        audioUrl,
        speed,
        duration,
      ];

  AudioState copyWith({
    String? audioUrl,
    bool? isPlay,
    double? speed,
    Duration? duration,
  }) {
    return AudioState(
      audioUrl: audioUrl ?? this.audioUrl,
      isPlay: isPlay ?? this.isPlay,
      speed: speed ?? this.speed,
      duration: duration ?? this.duration,
    );
  }
}
