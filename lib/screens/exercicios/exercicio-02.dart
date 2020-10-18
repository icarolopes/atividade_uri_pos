import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Exercicio02 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Exercicio01State();

}
class Exercicio01State extends State {
  static const platform = const MethodChannel("uri_exercicios");

  TextEditingController titleController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController salarioController = TextEditingController();
  TextEditingController totalVendaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = 'URI 1009';
    nomeController.text = '';
    salarioController.text = '';
    totalVendaController.text = '';
    return Scaffold(
        appBar: AppBar(
          title: Text('URI 1009'),
        ),
        body: Padding(
            padding: EdgeInsets.only(top:35.0, left: 10.0, right: 10.0),
            child: ListView(children: <Widget>[Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top:15.0, bottom: 15.0),
                  child: Text('O arquivo de entrada contém um texto (primeiro nome do empregado), e dois valores de dupla precisão, que são o salário do vendedor e o valor total vendido por ele/ ela.'),
                ),
                Padding(
                    padding: EdgeInsets.only(top:15.0, bottom: 15.0),
                    child: TextField(
                      controller: nomeController,
                      style: TextStyle(fontSize: 10),
                      decoration: InputDecoration(
                          labelText: "Digite o nome",
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
                      controller: salarioController,
                      style: TextStyle(fontSize: 10),
                      decoration: InputDecoration(
                          labelText: "Digite o salário",
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
                      controller: totalVendaController,
                      style: TextStyle(fontSize: 10),
                      decoration: InputDecoration(
                          labelText: "Digite o total de vendas",
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
                        final String result = await platform.invokeMethod("exercicio02", <String, dynamic>{
                          'nome': nomeController.text,
                          'salario': salarioController.text,
                          'totalVenda': totalVendaController.text
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

