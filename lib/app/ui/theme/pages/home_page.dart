import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_lab/app/controller/home_controller.dart';
import 'package:get_lab/app/routes/app_route.dart';
import 'package:get_lab/app/ui/theme/commun/connecty_widget.dart';
import 'package:get_lab/app/ui/theme/commun/search_generic_get/search_app_bar.dart';

class HomePage extends GetView<HomeSearchController> {
//repository and controller  injection bindings

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(
        searchButtonPosition: 1,
        controller: controller,
        elevation: 0.0,
        searchElementsColor: Colors.black,
        centerTitle: true,
        iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.white),
        hintText: 'Pesquise produto',
        title: const Text('HomePage '),
        actions: <Widget>[
          const ConnectyWidget(
            //color: MyThemeApp.background,
            connectywidgetTipo: ConnectywidgetTipo.icone,
            textMensagem: 'Necessário conexāo.',
          ),
        ],
      ),

      /*AppBar(
        title: Text('HomePage'),
        actions: [
          const ConnectyWidget(
            // color: Colors.white,
            connectywidgetTipo: ConnectywidgetTipo.icone,
            textMensagem: ' Verifique internet. ',
          ),
        ],
      ),*/
      body: Obx(() {
        List<Faker> _listFilter = [];
        final bool withoutList = controller.fakerList == null;

        if (!withoutList) _listFilter = controller.fakerListFilted;
        //return controller.fakerList.length < 1
        return withoutList
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: GestureDetector(
                        onTap: () {
                          controller.refazTela();
                        },
                        child: Text(_listFilter[index].person.name())),
                    subtitle: GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.TESTE);
                        },
                        child: Text(_listFilter[index].person.lastName())),
                  );
                },
                itemCount: _listFilter.length,
              );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          controller.addFaker();
        },
      ),
    );
  }
}

class HomePageGetX extends GetView<HomeSearchController> {
//repository and controller  injection bindings

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomePage')),
      body: Container(
        child: GetX<HomeSearchController>(
            //init: HomeController(repository: HomeRepository()),
            initState: (state) {
          Get.find<HomeSearchController>().getAll();
        }, builder: (_) {
          return _.fakerList.length < 1
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_.fakerList[index].person.name()),
                      subtitle: Text(_.fakerList[index].person.lastName()),
                    );
                  },
                  itemCount: _.fakerList.length,
                );
        }),
      ),
    );
  }
}

class HomePageBuilder extends GetView<HomeSearchController> {
//repository and controller  injection bindings

  final HomeSearchController controller_2 = Get.find<HomeSearchController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomePage')),
      body: Container(
        child: GetBuilder<HomeSearchController>(
          initState: (state) {
            Get.find<HomeSearchController>().getAll();
          },
          builder: (_) {
            return _.fakerList.length < 1
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_.fakerList[index].person.name()),
                        subtitle: Text(_.fakerList[index].person.lastName()),
                      );
                    },
                    itemCount: _.fakerList.length,
                  );
          },
          didChangeDependencies: (state) {},
        ),
      ),
    );
  }
}
