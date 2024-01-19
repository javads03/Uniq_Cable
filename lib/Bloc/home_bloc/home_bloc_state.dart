part of 'home_bloc_bloc.dart';

sealed class HomeBlocState extends Equatable {
  const HomeBlocState();
  
  @override
  List<Object> get props => [];
}

final class HomeBlocInitial extends HomeBlocState {}
final class HomeBlocLoading extends HomeBlocState {}
// state of the login on clicking back button
final class HomeNav extends HomeBlocState {}
