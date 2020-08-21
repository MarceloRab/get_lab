import 'package:get/get.dart';

abstract class Searcher {
  RxBool isModSearch;

  RxString search;

  set procure(String text);

  void setModSearch(bool value);
}
