import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Conversor extends StatefulWidget {
  @override
  _ConversorState createState() => _ConversorState();
}

class _ConversorState extends State<Conversor> {
  TextEditingController _reaisController = TextEditingController();
  TextEditingController _cotacaoController = TextEditingController();

  var _resultado = "";

  limpar() {
    _reaisController.clear();
    _cotacaoController.clear();
  }

  calcular(){
    if(_reaisController.text.isNotEmpty && _cotacaoController.text.isNotEmpty){
      try{
        var reais = double.parse(_reaisController.text);
        var cotacao = double.parse(_cotacaoController.text);

        setState(() {
          _resultado = "Com ${reais.toStringAsFixed(2)} é possível comprar ${(reais/cotacao).toStringAsFixed(2)} dólares a ${cotacao.toStringAsFixed(2)} reais cada.";
        });
      } catch (e){
        debugPrint("Formato inválido");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Conversor de Dólar"),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        body: ListView(
            children: <Widget>[
              Card(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset("assets/dolar.png", width: 90,),
                      TextField(
                          controller: _reaisController,
                          keyboardType: TextInputType.numberWithOptions(
                              decimal: true),
                          decoration: InputDecoration(
                            hintText: "Valor em reais",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          )
                      ),
                      TextField(
                          controller: _cotacaoController,
                          keyboardType: TextInputType.numberWithOptions(
                              decimal: true),
                          decoration: InputDecoration(
                            hintText: "Cotação do dólar",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          )
                      ),
                      ButtonBar(
                        children: <Widget>[
                          TextButton(
                            child: Text(
                              "Limpar", style: TextStyle(fontSize: 20),),
                            onPressed: limpar,
                          ),
                          TextButton(
                            child: Text(
                                "Converter", style: TextStyle(fontSize: 20)),
                            onPressed: calcular,
                          )
                        ],
                      )
                    ]
                ),

              ),
              Text("$_resultado", textAlign: TextAlign.center, style: TextStyle(fontSize: 30,))
            ]
        )
    );
  }
}
