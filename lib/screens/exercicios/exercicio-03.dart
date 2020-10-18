import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Exercicio03 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Exercicio03State();

}
class Exercicio03State extends State {
  static const platform = const MethodChannel("uri_exercicios");

  TextEditingController titleController = TextEditingController();
  TextEditingController numeroController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = 'URI 1018';
    numeroController.text = '';
    return Scaffold(
        appBar: AppBar(
          title: Text('URI 1018'),
        ),
        body: Padding(
            padding: EdgeInsets.only(top:35.0, left: 10.0, right: 10.0),
            child: ListView(children: <Widget>[Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top:15.0, bottom: 15.0),
                  child: Text('O arquivo de entrada contém um valor inteiro N (0 < N < 10000000).'),
                ),
                Padding(
                    padding: EdgeInsets.only(top:15.0, bottom: 15.0),
                    child: TextField(
                      controller: numeroController,
                      style: TextStyle(fontSize: 10),
                      decoration: InputDecoration(
                          labelText: "Digite um numero inteiro",
                          // hintText: "Enter your text here",
                          labelStyle: TextStyle(fontSize: 11),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.only(top:15.0, bottom: 15.0),
                  child: RaisedButton(
                    child: Text(
                      "Enviar",
                      style: TextStyle(fontSize: 11),
                    ),
                    onPressed: () async {
                      try {
                        final String result = await platform.invokeMethod("exercicio03", { 'numero':  numeroController.text });
                        print(">> Resultado:  $result");
                        _result(result);
                      } on PlatformException catch (e) {
                        print(e.message);
                      }
                    },
                  ),
                )
              ],
            )],)
        )
    );
  }

  Future<bool>_result (value) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog (
                content: Text(value),
                actions: <Widget> [
                  FlatButton (
                      child: Text('OK'),
                      onPressed: () {
                        Navigator.pop(context);
                      }
                  ),
                ]
            );
          }
      );
      return Future.value(false);
  }
}

