import 'package:get/get.dart';

abstract class Searcher<T> {
  RxBool isModSearch;

  RxString search;

  set procure(String text);

  void setModSearch(bool value);

  List<T> get initialList;
}
