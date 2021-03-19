import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white, // navigation bar color
    statusBarColor: Color.fromRGBO(4, 211, 97, 1),
    statusBarIconBrightness: Brightness.light,

    // status bar color
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'APP Final'),
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
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  TextEditingController n1Controller = TextEditingController();
  TextEditingController n2Controller = TextEditingController();
  String message = "";

  void refreshFields() {
    n1Controller.text = "";
    n2Controller.text = "";

    setState(() {
      _formKey = GlobalKey<FormState>();
    });
  }

  void calculate() {
    setState(() {
      double n1 = double.parse(n1Controller.text);
      double n2 = double.parse(n2Controller.text);
      double media = ((n1 * 2) + (n2 * 3)) / 5;
      double avfinal = 0;

      if (media > 3 && media < 7) {
        avfinal = 10 - media;
        message =
            "Recuperação, Média: $media, para ser aprovado você precisa tirar: $avfinal";
      } else if (media < 3) {
        message = "Reprovado, Média: $media";
      } else if (media > 7) {
        message = "Aprovado, Média: $media";
      }

      print(media);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(32, 32, 36, 1),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.refresh,
                  color: Color.fromRGBO(4, 211, 97, 1),
                ),
                onPressed: () => {refreshFields()}),
          ],
        ),
        backgroundColor: Color.fromRGBO(18, 18, 20, 1),
        body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(padding: EdgeInsets.only(top: 40.0)),
                  Icon(
                    Icons.calculate,
                    size: 80,
                    color: Color.fromRGBO(4, 211, 97, 1),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 40.0)),
                  TextFormField(
                      controller: n1Controller,
                      validator: (valor) {
                        if (valor.isEmpty) {
                          return 'Informe a primeira nota!';
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                          color: Color.fromRGBO(4, 211, 97, 1), fontSize: 18.0),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromRGBO(32, 32, 36, 1),
                          hintText: 'N1',
                          hintStyle: TextStyle(
                              fontSize: 14.0,
                              color: Color.fromRGBO(168, 168, 179, 1)),
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 8.0, top: 8.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(41, 41, 46, 1)),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: new OutlineInputBorder(
                            borderSide:
                                new BorderSide(color: Colors.red, width: 0.0),
                          ),
                          focusedErrorBorder: new OutlineInputBorder(
                            borderSide:
                                new BorderSide(color: Colors.red, width: 0.0),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          labelText: "Primeira nota",
                          labelStyle: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1)))),
                  Padding(padding: EdgeInsets.only(top: 24.0)),
                  TextFormField(
                      controller: n2Controller,
                      validator: (valor) {
                        if (valor.isEmpty) {
                          return 'Informe a segunda nota!';
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                          color: Color.fromRGBO(4, 211, 97, 1), fontSize: 18.0),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromRGBO(32, 32, 36, 1),
                          hintText: 'N2',
                          hintStyle: TextStyle(
                              fontSize: 14.0,
                              color: Color.fromRGBO(168, 168, 179, 1)),
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 8.0, top: 8.0),
                          errorBorder: new OutlineInputBorder(
                            borderSide:
                                new BorderSide(color: Colors.red, width: 0.0),
                          ),
                          focusedErrorBorder: new OutlineInputBorder(
                            borderSide:
                                new BorderSide(color: Colors.red, width: 0.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(41, 41, 46, 1)),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          labelText: "Segunda nota",
                          labelStyle: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1)))),
                  Padding(
                    padding: EdgeInsets.only(top: 40, bottom: 10.0),
                    child: Container(
                      height: 54.0,
                      child: ElevatedButton(
                          child: Text(
                            'Calcular Média',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                          onPressed: () => {
                                if (_formKey.currentState.validate())
                                  {
                                    calculate(),
                                    showDialog(
                                        context: context,
                                        builder: (_) {
                                          return AlertDialog(
                                            title: Text('Resultado'),
                                            titleTextStyle: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1),
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold),
                                            content: Text(message),
                                            contentTextStyle: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1)),
                                            backgroundColor:
                                                Color.fromRGBO(32, 32, 36, 1),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    context,
                                                    true), // passing true
                                                child: Text(
                                                  'OK',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ],
                                          );
                                        }).then((exit) {
                                      if (exit == null) return;
                                    })
                                  }
                              },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromRGBO(4, 211, 97, 1)))),
                    ),
                  ),
                ],
              ),
            )));
  }
}
