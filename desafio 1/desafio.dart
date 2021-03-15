import 'dart:html';
import 'dart:convert';

class Conta{
  
  int id;
  int agencia;
  int conta;
  String name;
  int balance;
  
  String get comprimento{
    return "Olá, ${name}!";
  }
}


void main() async{ 
  // Trabalhando com listas
  var list = [2,4,6,8];
  //print(list);
  //print(list.length);
  list.remove(6); // remove o objeto 6
  //print(list);
  list.removeAt(2); // remove o índice 2
  //print(list);
  list.add(10);
  //print(list);
  
  // Objetos anonimos
  var obj = {
    'id': 10,
    'nome': 'Tiemy'
  };
  //print(obj['nome']);
  //print(obj.containsKey('id'));
  
  // Requests  
  var result = await HttpRequest.getString('https://igti-film.herokuapp.com/api/accounts');
  var contasJson = jsonDecode(result);
  List<Conta> contas = new List();
  for(int i=0;i<contasJson.length; i++){
    var conta = new Conta();
    conta.id = contasJson[i]['id'];
    conta.agencia = contasJson[i]['agencia'];
    conta.conta = contasJson[i]['conta'];
    conta.name = contasJson[i]['name'];
    conta.balance = contasJson[i]['balance'];
    contas.add(conta);
    
  }
  var contasAgencia33 = contas.where((item) => item.agencia == 33).toList();  
  contasAgencia33.sort((conta1, conta2) => conta2.balance - conta1.balance);
  var balancesAgencia33 = contasAgencia33.map((conta) => conta.balance);
  //balancesAgencia33.forEach((balance) => print(balance));
  //print(contasAgencia33.every((conta)=>conta.agencia==33));
  
  var primeiraConta = contas.firstWhere((item) => item.agencia==33);
  //print(primeiraConta.name);
  //contas.skip(2).take(3).toList().forEach((conta)=>print(conta.name));
  
  // Desafio modulo 1
  print(contas.where((conta)=>conta.balance>100).toList().length);
  print(contas.where((conta)=>conta.balance>100 && conta.agencia==33).toList().length);
  contas.sort((conta1, conta2) => conta2.balance - conta1.balance);
  //contas.forEach((conta)=>print("${conta.agencia} ${conta.balance}"));
  var contasAgencia10 = contas.where((item)=>item.agencia==47).toList();
  contasAgencia10.sort((conta1,conta2)=>conta2.balance - conta1.balance);
  contasAgencia10.forEach((conta)=>print("${conta.name} ${conta.balance}"));
  //print(contasAgencia10.length);
  
  var agencias = contas.map((conta)=>conta.agencia);
  print(agencias);
  agencias= [...{...agencias}];
  print(agencias);
  
  int soma = 0;
  contas.sort((conta1,conta2)=>conta2.balance - conta1.balance);

  agencias.forEach((agencia)=>{
    soma += contas.firstWhere((item)=>item.agencia==agencia).balance
  });
  
  print("Soma: ${soma}");
}

