import 'package:faker/faker.dart';
//import 'package:meta/meta.dart';

class HomeRepository {
  //final  apiClient;

  //HomeRepository({@required this.apiClient}) : assert(apiClient != null);

  Future<List<Faker>> getAll() async {
    await Future.delayed(const Duration(seconds: 3));

    List<Faker> fakers = [];
    for (var i = 0; i < 5; ++i) {
      fakers.add(Faker());
    }

    return fakers;
  }
}
