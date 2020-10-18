import 'package:flutter/material.dart';
import 'exercicios/exercicio-01.dart';
import 'exercicios/exercicio-02.dart';
import 'exercicios/exercicio-03.dart';
import 'exercicios/exercicio-04.dart';
import 'exercicios/exercicio-05.dart';

class List extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ListState();

}

class ListState extends State {
  var dataList = ['Exercício 01', 'Exercício 02', 'Exercício 03', 'Exercício 04', 'Exercício 05'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListItems(),
    );
  }

  ListView ListItems() {
    return ListView.builder(
      itemCount: dataList.length,
      itemBuilder: (BuildContext context, int position) {
        return _exerciciosCard(context, position);
      },
    );
  }
  Widget _exerciciosCard(BuildContext context, int index) {
    return Card(
      color: Colors.white,
      elevation: 2.0,
      child: ListTile(
        title: Text(dataList[index]),
        onTap: () {
          // debugPrint("Tapped on " + this.todos[position].id.toString());
          switch (dataList[index]) {
            case 'Exercício 01':
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => Exercicio01()),
              );
              break;
            case 'Exercício 02':
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => Exercicio02()),
              );
              break;
            case 'Exercício 03':
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => Exercicio03()),
              );
              break;
            case 'Exercício 04':
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => Exercicio04()),
              );
              break;
            case 'Exercício 05':
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => Exercicio05()),
              );
              break;
          }
        },
      ),
    );
  }
}
