part of 'person_cubit.dart';

@immutable
sealed class PersonState {}

final class PersonInitial extends PersonState {}
final class PersonLoading extends PersonState {}

class PersonLoaded extends PersonState {
  final Person person;
  PersonLoaded(this.person);
}
final class PersonError extends PersonState {
  final String message;
  PersonError(this.message);
}