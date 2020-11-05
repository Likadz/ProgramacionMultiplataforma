import 'package:calendario3/model/cuadrado.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'calendario3'),
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
 
  
  var _listaCuadrados = <Cuadrado>[];

  void _cambiarTexto(Cuadrado item){
    print(item.id);
    setState(() {
      item.texto="meh";
      item.color= Colors.cyan;
      print("cambiar datos");
    });
  }


  @override
  Widget build(BuildContext context) {
    var dias =  ['HORAS', 'LUNES','MARTES','MIERC.','JUEVES','VIERNES'];
    var horas=['HORAS', '8.00\n8.55','8.55\n9.50','9.50\n10.45','10.45\n11.40','11.40\n12.05','12.05\n13.00','13.00\n13.55','13.55\n14.50'];
    var twoDList = List.generate(8, (i) => List(6), growable: false);//el primer valor es el número de líneas

    var countId=0;
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(5),//padding general alrededor
        crossAxisSpacing: 4.0,  
        mainAxisSpacing: 8.0,  
        crossAxisCount:6,
         children:[
          for(int row = 0 ; row < twoDList.length ; row++)
            for(int col = 0 ; col < twoDList[row].length ; col++)
              if(row==0 && col==0)
                  twoDList[0][0]=_generarCuadradoNormal(Cuadrado("$row$col",dias[row],Colors.amber))
              else if(row==0 && col!=0)
                twoDList[0][col]=_generarCuadradoNormal(Cuadrado("$row$col",dias[col],Colors.amber))
              else if (col==0)
                  twoDList[row][0]=_generarCuadradoNormal(Cuadrado("$row$col",horas[row],Colors.amber))
              else
                twoDList[row][col]=_generarCuadrado(Cuadrado("$row$col","prueba$row$col",Colors.grey)),
        ] 
      /*List.generate(20, (index) {
          countId=countId+1;
          return Center(child: _generarCuadrado(Cuadrado(countId,"prueba$countId",Colors.amber)),
          );
          
        }),*/
        
      ),
      
    );
  }

  Container _generarCuadrado(Cuadrado c){
    return Container(
      height: 200,
      width: 200,
      decoration:
          BoxDecoration(color: c.color, borderRadius: BorderRadius.circular(5)),
      child: InkWell(
        onTap: ()async{
          _cambiarTexto(c);
          print("El nuevo texto es " + c.texto);
          },
        
        /*
        onTap: () async {
          print(c.id);
          // Página de detalle
          var detalle = Cuadrado(c.id,c.texto,c.color);
          _cambiarTexto(c);
          /*CuadradoWidgetAsignaturas response = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormPage(detalle: detalle),
            ),
          );

          if (response != null) {
            c.color = response.color;
            c.texto = "venga ya";
            print("a devuelto algo");

            print(c.color);
            setState();

            //setState(response);
          }*/
        },*/
        
        child: Column(
          children: [
            SizedBox(height: 10),
            Text(c.texto),
            Expanded(
              flex: 1,
              child: Container(
                width: 0,
                height: 0,
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
        
      ));
      
  }
  Container _generarCuadradoNormal(Cuadrado c){
    return Container(
      height: 200,
      width: 200,
      decoration:
          BoxDecoration(color: c.color, borderRadius: BorderRadius.circular(5)),
      child: Column(
          children: [
            SizedBox(height: 10),
            Text(c.texto),
            Expanded(
              flex: 1,
              child: Container(
                width: 0,
                height: 0,
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      );
  }
}
