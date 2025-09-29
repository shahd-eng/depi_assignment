import 'package:bloc/bloc.dart';
import 'package:depi_assignment/services/web_services/person_repository.dart';
import 'package:meta/meta.dart';

import '../../models/person.dart';

part 'person_state.dart';

class PersonCubit extends Cubit<PersonState> {
  PersonCubit() : super(PersonInitial());

  Future<void> loadPersons()async
  {
    emit(PersonLoading());
    try{
      final repository=  PersonRepository();
      final person=await repository.fetchPopularPersons();
      emit(PersonLoaded(person));

    }
    catch(e)
    {
      emit(PersonError(e.toString()));
    };

  }
}
