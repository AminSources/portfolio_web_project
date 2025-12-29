part of 'theme_bloc.dart';

sealed class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ChangeThemeEvent extends ThemeEvent {
  final ThemeMode themeMode;
  const ChangeThemeEvent({required this.themeMode});

  @override
  List<Object> get props => [themeMode];
}
