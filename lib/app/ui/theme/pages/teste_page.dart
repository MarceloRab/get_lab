import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_lab/app/controller/home_controller.dart';
import 'package:get_lab/app/data/repository/teste_repository_disposable.dart';

class TestePage extends GetView<HomeController> {
//repository and controller  injection bindings

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TestePage')),
      body: Container(
        child: GetX<TesteDisposable>(
            init: TesteDisposable(),
            initState: (state) {
              Get.find<HomeController>().getAll();
            },
            builder: (testeRepository) {
              return controller.fakerList.length < 1
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title:
                              Text(controller.fakerList[index].person.name()),
                          subtitle: GestureDetector(
                              onTap: () {
                                testeRepository.testeSink.add(1);

                              },
                              child: Text(controller.fakerList[index].person
                                  .lastName())),
                          trailing: StreamBuilder<int>(
                            stream: testeRepository.testeStream,
                            builder: (_, snapshot) {
                              if (snapshot.data == null)
                                return SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: Icon(Icons.face),
                                );
                              else
                                return Text(
                                  "${testeRepository.testeInt.toString()}",
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(fontSize: 18),
                                );
                            },
                          ),
                          leading: Obx(() {
                            return Text(
                              "${testeRepository.intRx().toString()}",
                              overflow: TextOverflow.clip,
                              style: TextStyle(fontSize: 18),
                            );
                          }),
                        );
                      },
                      itemCount: controller.fakerList.length,
                    );
            }),
      ),
    );
  }
}
