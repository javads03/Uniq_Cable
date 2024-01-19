part of 'home_bloc_bloc.dart';

sealed class HomeBlocEvent extends Equatable {
  const HomeBlocEvent();

  @override
  List<Object> get props => [];
}
// navigate to backpage
class NavBack extends HomeBlocEvent {}