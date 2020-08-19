import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_lab/app/controller/home_controller.dart';
import 'package:get_lab/app/routes/app_route.dart';
import 'package:get_lab/app/ui/theme/commun/connecty_widget.dart';

class HomePage extends GetView<HomeController> {
//repository and controller  injection bindings

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
        actions: [
          const ConnectyWidget(
            // color: Colors.white,
            connectywidgetTipo: ConnectywidgetTipo.icone,
            textMensagem: ' Verifique internet. ',
          ),
        ],
      ),
      body: Obx(() {
        //return controller.fakerList.length < 1
        return controller.fakerList == null
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
                        child: Text(controller.fakerList[index].person.name())),
                    subtitle: GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.TESTE);
                        },
                        child: Text(
                            controller.fakerList[index].person.lastName())),
                  );
                },
                itemCount: controller.fakerList.length,
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

class HomePageGetX extends GetView<HomeController> {
//repository and controller  injection bindings

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomePage')),
      body: Container(
        child: GetX<HomeController>(
            //init: HomeController(repository: HomeRepository()),
            initState: (state) {
          Get.find<HomeController>().getAll();
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

class HomePageBuilder extends GetView<HomeController> {
//repository and controller  injection bindings

  final HomeController controller_2 = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomePage')),
      body: Container(
        child: GetBuilder<HomeController>(
          initState: (state) {
            Get.find<HomeController>().getAll();
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
