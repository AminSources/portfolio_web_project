import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeMode: ThemeMode.system)) {
    //? listen to events
    on<ChangeThemeEvent>(changeTheme);
  }

  //? change theme method
  void changeTheme(ChangeThemeEvent event, emit) {
    //? toggle theme
    emit(ThemeState(themeMode: event.themeMode));
  }
}
