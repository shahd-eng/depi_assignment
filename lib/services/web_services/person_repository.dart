import 'package:depi_assignment/models/person.dart';
import 'package:dio/dio.dart';

class PersonRepository {
  final Dio _dio = Dio();
  final String apiKey = "2dfe23358236069710a379edd4c65a6b";
  Future<Person> fetchPopularPersons() async
  {
    try {
      final response = await _dio.get(
        "https://api.themoviedb.org/3/person/popular",
        queryParameters: {"api_key": apiKey},);


      return  Person.fromJson(response.data);

    }

    catch
    (e) {
      throw Exception("Failed to load persons: $e");
    }
  }

}