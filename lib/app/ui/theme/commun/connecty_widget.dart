import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_lab/app/controller/connecty_bloc.dart';

class ConnectyWidget extends StatelessWidget {
  final Color color;
  final ConnectywidgetTipo connectywidgetTipo;
  final String textMensagem;

  const ConnectyWidget({
    Key key,
    this.textMensagem = '',
    this.color = Colors.white,
    @required this.connectywidgetTipo,
  }) : super(key: key);

  /*const ConnectyWidget({
    Key key,
    @required ConnectyBlocBloc connectyBlocBloc, this.color,
  })  : _connectyBlocBloc = connectyBlocBloc,
        super(key: key);*/

  //final ConnectyBlocBloc _connectyBlocBloc;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: Get.find<ConnectyBloc>().connectyStream,
        //stream: _connectyBlocBloc.connectyStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Container();
          else if (!snapshot.data) {
            if (connectywidgetTipo == ConnectywidgetTipo.descricao)
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: color,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 2,
                        offset: Offset(2.0, 3.0),
                        spreadRadius: 2.0)
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Text(
                      'Sem Conexão...',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Roboto Mono',
                      ),
                    ),
                    Icon(Icons.signal_wifi_off)
                  ],
                ),
              );
            else
              return IconButton(
                onPressed: () {
                  Get.snackbar('Aviso', textMensagem);
                },
                icon: const Icon(Icons.signal_wifi_off),
                color: Colors.redAccent,
              );
          } else
            return Container();
        });
  }
}

enum ConnectywidgetTipo { descricao, icone }
