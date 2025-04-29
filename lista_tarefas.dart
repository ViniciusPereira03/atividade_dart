import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de tarefas',
      home: MyHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  State<MyHome> createState() => MyHomeState();
}

class MyHomeState extends State<MyHome> {
  List<String> _tarefas = [];
  TextEditingController _controller = TextEditingController();

  void _adicionarTarefa() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        _tarefas.add(_controller.text);
        _controller.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de tarefas'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: <Widget>[
            Form(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Descreva a nova tarefa...',
                        hintStyle: TextStyle(fontSize: 20),
                      ),
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: ElevatedButton(
                      child: Text('Add'),
                      onPressed: () {
                        _adicionarTarefa();
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _tarefas.length,
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemBuilder: (BuildContext context, index) {
                  final tarefa = _tarefas[index];
                  return Card(
                    child: Dismissible(
                      key: Key(tarefa),
                      background: Container(
                        color: Colors.green,
                        child: const Icon(Icons.check)
                      ),
                      secondaryBackground: Container(
                        color: Colors.red,
                        child: const Icon(Icons.cancel)
                      ),
                      onDismissed: (DismissDirection direction) {
                        setState(() {
                          if (direction == DismissDirection.endToStart) {
                            print('Removendo Item ${tarefa}');
                          } else if (direction == DismissDirection.startToEnd) {
                             print('Concluindo Item ${tarefa}');
                          }
                          _tarefas.removeAt(index);
                        });
                      },
                      child: ListTile(title: Text(tarefa)),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
