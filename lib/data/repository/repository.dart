import 'package:dio/dio.dart';

import '../model/dog_model.dart';


class Repository {
  final Dio _dio = Dio();

  Future<List<DogModel>> getDogs() async {
    final Response response = await _dio.get(
      "https://api.thedogapi.com/v1/images/search?page=0&limit=10",
      options: Options(
        headers: {
          "x-api-key":
          "live_CM8BQsC1T1rNvfRvdNwoIPzD6vOjXfAk9m8mOk186P0FE0VEybdL4BCuTlJTPSaT",
        },
      ),
    );

    List<DogModel> list = [];

    response.data.forEach((dog) {
      list.add(DogModel.fromJson(dog));
    });

    return list;
  }
}