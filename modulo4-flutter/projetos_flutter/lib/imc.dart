import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IMC extends StatefulWidget {
  @override
  _ConversorState createState() => _ConversorState();
}

class _ConversorState extends State<IMC> {
  final TextEditingController _alturaController = TextEditingController();
  final TextEditingController _pesoController = TextEditingController();

  var _resultadoIMC = "";
  var _situacaoIMC = "";

  _onItemTapped(int index){
    if(index ==  0){
      _alturaController.clear();
      _pesoController.clear();
      setState(() {
        _resultadoIMC = "";
        _situacaoIMC = "";
      });
    }
    else if(_alturaController.text.isEmpty || _pesoController.text.isEmpty){
      debugPrint("Preencher altura e peso.");
      // key.currentState.showSnackBar(SnackBar(content: Text("Preencher altura e peso.")));
    } else
      try {
        var peso = double.parse(_pesoController.text);
        var altura = double.parse(_alturaController.text);
        var imc = peso / (altura * altura);

        setState(() {
          _resultadoIMC = "IMC = ${imc.toStringAsFixed(2)}";
          if(imc < 17) {
            _situacaoIMC = 'Muito abaixo do peso';
          } else if ((imc >= 17) && (imc < 18.5)) {
            _situacaoIMC = 'Abaixo do peso';
          } else if ((imc >= 18.5) && (imc < 25)) {
            _situacaoIMC = 'Peso normal';
          } else if ((imc >= 25) && (imc < 30)) {
            _situacaoIMC = 'Acima do peso';
          } else if ((imc >= 30) && (imc < 35)) {
            _situacaoIMC = 'Obesidade I';
          } else if ((imc >= 35) && (imc < 40)) {
            _situacaoIMC = 'Obesidade II (severa)';
          } else {
            _situacaoIMC = 'Obesidade III (mórbida)';
          }
        });
      } catch (e){
      debugPrint("Formato inválido");
    }
  }
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cálculo de IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Image.asset("assets/balanca.png", width: 90,),
          TextField(
            controller: _alturaController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
                hintText: "Altura",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                icon: Icon(Icons.accessibility)
            ),
          ),
          TextField(
            controller: _pesoController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
                hintText: "Peso",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                icon: Icon(Icons.airplay)
            ),
          ),
          Text("$_resultadoIMC", style: TextStyle(fontSize: 30)),
          Text("$_situacaoIMC", style: TextStyle(fontSize: 20))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.clear, color: Colors.red,),
              label: "Limpar"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate, color: Colors.blue,),
              label: "Calcular"
          )
        ],
      ),
    );
  }
}
