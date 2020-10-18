import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Exercicio01 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Exercicio01State();

}
class Exercicio01State extends State {
  static const platform = const MethodChannel("uri_exercicios");

  TextEditingController titleController = TextEditingController();
  TextEditingController numero1Controller = TextEditingController();
  TextEditingController numero2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = 'URI 1001';
    numero1Controller.text = '';
    numero2Controller.text = '';
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
        appBar: AppBar(
          title: Text('URI 1001'),
        ),
        body: Padding(
            padding: EdgeInsets.only(top:35.0, left: 10.0, right: 10.0),
            child: ListView(children: <Widget>[Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top:15.0, bottom: 15.0),
                  child: Text('O arquivo de entrada conterá 2 números inteiros.'),
                ),
                Padding(
                    padding: EdgeInsets.only(top:15.0, bottom: 15.0),
                    child: TextField(
                      controller: numero1Controller,
                      style: textStyle,
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
                    child: TextField(
                      controller: numero2Controller,
                      style: textStyle,
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
                      style: TextStyle(fontSize: 10),
                    ),
                    onPressed: () async {
                      try {
                        final int result = await platform.invokeMethod("exercicio01", <String, dynamic>{
                          'numero1': numero1Controller.text,
                          'numero2': numero2Controller.text
                        });
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
                content: Text("X = $value"),
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

