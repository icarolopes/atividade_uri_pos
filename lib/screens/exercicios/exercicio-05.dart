import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Exercicio05 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Exercicio05State();

}
class Exercicio05State extends State {
  static const platform = const MethodChannel("uri_exercicios");

  TextEditingController titleController = TextEditingController();
  TextEditingController numeroController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = 'URI 3040';
    numeroController.text = '';
    return Scaffold(
        appBar: AppBar(
          title: Text('URI 3040'),
        ),
        body: Padding(
            padding: EdgeInsets.only(top:35.0, left: 10.0, right: 10.0),
            child: ListView(children: <Widget>[Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top:15.0, bottom: 15.0),
                  child: Text('A entrada contém uma única linha com um número inteiro N (0 ≤ N ≤ 100), representando uma nota de prova no sistema numérico.'),
                ),
                Padding(
                    padding: EdgeInsets.only(top:15.0, bottom: 15.0),
                    child: TextField(
                      controller: numeroController,
                      style: TextStyle(fontSize: 10),
                      maxLines: 8,
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
                        final String result = await platform.invokeMethod("exercicio05", { "dados":  numeroController.text });
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
                content: Text("$value"),
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

