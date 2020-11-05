import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Examen',
      theme: ThemeData(
        
        primarySwatch: Colors.green,
       
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Examen Leire Sarobe '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if(_counter>0)//para que no cree negativos
        _counter--;
    });
  }

  //EL GRID
  Container _crearContainer(index){
    if(index%3==0){//si es multiplo de 3
      if(index%5==0){//si tambien es múltiplo de 5
        return Container(//creamos un container (el que devolveremos)
          width: 200,//anchura
          height: 200,//altrua
          child: Card(//como hijo le creamos una carta
            color: Colors.blue,//asignamos un color
            child: Center(
              child:Text('FB'),
              ),//un texto para la carta. Para que esté centrada entre el card y el text creamos un objeto Center
            ),
        );
      }//si no es múltiplo de 5
      return Container(
          width: 200,
          height: 200,
          child: Card(//como hijo le creamos una carta
            color: Colors.lightBlueAccent,//asignamos un color
            child: Center(
              child:Text('FACE'),
              ),//un texto para la carta. Para que esté centrada entre el card y el text creamos un objeto Center
            ),
        ); 
    }else if(index%5==0){//si no es multiplo de 3 pero si de 5
      return Container(
          width: 200,
          height: 200,
          child: Card(//como hijo le creamos una carta
            color: Colors.blueGrey,//asignamos un color
            child: Center(
              child:Text('BOOK'),
              ),//un texto para la carta. Para que esté centrada entre el card y el text creamos un objeto Center
            ),
        );
    }else{//si no es múltiplo ni de 3 ni de 5
      return Container(
          width: 200,
          height: 200,
          child: Card(//como hijo le creamos una carta
            color: Colors.amber,//asignamos un color
            child: Center(
              child:Text('$index'),
              ),//un texto para la carta. Para que esté centrada entre el card y el text creamos un objeto Center
            ),
        );
    }

  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(children: <Widget>[
           Row( //row para el contador
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:<Widget>[
              FloatingActionButton(
                child: Icon(Icons.remove), 
                onPressed: _decrementCounter,//invocamos la funcion NO la llamamos
                tooltip: 'quitar grid',
              ),
              Text('$_counter', style:TextStyle(fontWeight: FontWeight.bold),),
              FloatingActionButton(
                child: Icon(Icons.add), 
                onPressed: _incrementCounter,//invocamos la funcion NO la llamamos
                tooltip: 'añadir grid',
              ),
            ],
          ),
          Flexible(//grid
            child: new GridView.count(
            crossAxisCount:5,
            children: List.generate(_counter, (index) {//generar una lista con el contador 
              return Center(child: _crearContainer(index),);//creamos un container en la lista, pasamos el idex del container (su posición)
            }),
            )
          ),
         
      ]),
        
    );
      
  }
}
