import 'package:faker/faker.dart';
import 'package:get_lab/app/data/repository/home_repository.dart';
import 'package:meta/meta.dart';

import 'package:get/get.dart';

class HomeController extends GetxController {
  //repository required
  final HomeRepository repository;

  HomeController({@required this.repository}) : assert(repository != null);

  //use o snippet getfinal para criar está variável
  //final RxList<Faker> _fakerList = List<Faker>().obs;
  final RxList<Faker> _fakerList = RxList<Faker>();

  List<Faker> get fakerList => _fakerList.value;

  set fakerList(value) => _fakerList.value = value;

  ///função para recuperar todos os posts
  getAll() {
    //_fakerList.value = null;

    repository.getAll().then((data) {
      // 03 maneiras de reafazer a lista com reatividade
      fakerList = data; // usando set
      //_fakerList.assignAll(data); // refazendo items
      //_fakerList.update((value) { }); ordem parar remontar a lista
    });
  }

  @override
  void onReady() {
    getAll();
    super.onReady();
  }

  void addFaker() {
    _fakerList.add(Faker());
  }

  void refazTela() {
    _fakerList.update((value) {});
  }
}
