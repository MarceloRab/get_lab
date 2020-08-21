import 'package:diacritic/diacritic.dart';
import 'package:faker/faker.dart';
import 'package:get_lab/app/data/repository/home_repository.dart';
import 'package:get_lab/app/ui/theme/commun/search_generic_get/searcher.dart';
import 'package:meta/meta.dart';

//import 'package:get/get.dart' hide Rx;
import 'package:rxdart/rxdart.dart';
import 'package:get/get.dart';

class HomeSearchController extends GetxController implements Searcher<Faker> {
  //repository required
  final HomeRepository repository;

  HomeSearchController({@required this.repository})
      : assert(repository != null);

  //use o snippet getfinal para criar está variável
  //final RxList<Faker> _fakerList = List<Faker>().obs;
  final RxList<Faker> _fakerList = RxList<Faker>();
  final RxList<Faker> _fakerListFilted = <Faker>[].obs;

  //List<Faker> get fakerList => _fakerList.value;

  @override
  List<Faker> get initialList => _fakerList.value;

  // método para adicionar ao fluxo
  set fakerList(value) => _fakerList.value = value;

  List<Faker> get fakerListFilted => _fakerListFilted.value;

  // método para adicionar ao fluxo
  set fakerListFilted(value) => _fakerListFilted.value = value;

  //final BehaviorSubject _cart = BehaviorSubject<int>.seeded(1);

  ///função para recuperar todos os posts
  getAll() {
    //_fakerList.value = null;

    //_fakerList.
    //_cart.switchMap((value) => null);
    //_cart.debounceTime(duration)
    search.stream
        .distinct()
        .debounceTime(Duration(milliseconds: 350))
        .listen((event) {
      _filteredFakers();
    });

    repository.getAll().then((data) {
      // 03 maneiras de reafazer a lista com reatividade
      fakerList = data; // usando set
      //_fakerList.assignAll(data); // refazendo items
      //_fakerList.update((value) { }); ordem parar remontar a lista
      _filteredFakers();
    });
  }

  void _filteredFakers() {
    if (search.value.isEmpty) {
      _fakerListFilted.assignAll(initialList);
      //filteredProducts.addAll(fakerList);
    } else {
      _fakerListFilted.assignAll(initialList.where((p) =>
          removeDiacritics(p.person.firstName().toLowerCase())
              .contains(removeDiacritics(search.value.toLowerCase()))));
      //filteredProducts
      //.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    }
  }

  @override
  RxBool isModSearch = false.obs;

  @override
  RxString search = ''.obs;

  @override
  set procure(String text) {
    search.value = text;

    // remontar no debounci
  }

  @override
  void setModSearch(bool value) {
    isModSearch.value = value;
  }

  @override
  void onReady() {
    getAll();
    /*debounce(search, (dynamic value) {
      _filteredFakers();
    }, time: Duration(milliseconds: 350));*/
    super.onReady();
  }

  void addFaker() {
    _fakerList.add(Faker());
    _filteredFakers();
  }

  void refazTela() {
    _fakerList.update((value) {});
  }
}
