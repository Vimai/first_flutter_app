import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:convert';
import '../../models/receita.dart';

class Home extends StatefulWidget {

  @override
  State<StatefulWidget> createState(){
    return new HomeState();
  }

}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return _buildHome();
  }

  Widget _buildHome(){
    return Scaffold(
      body: _buildCardList(),
      appBar: _buildAppBar(),
    );
  }

  Widget _buildCardList(){
    return FutureBuilder(
      future: DefaultAssetBundle
        .of(context)
        .loadString('assets/receitas.json'),
      builder: (context, snapshot) {
        List<dynamic> receitas = json.decode(snapshot.data.toString());

        return ListView.builder(
          itemBuilder: (BuildContext context, int index){
            Receita receita = Receita.fromJson(receitas[index]);
            return _buildCard(receita.titulo, receita.foto);
          },
          itemCount: receitas == null ? 0 : receitas.length,
        );
      },
    );
  }

  Widget _buildCard(title, image){
    return SizedBox(
      height: 300,
      child: Card(
          margin: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  _buildImage(image),
                  _buildCardGradient(),
                  _buildCardText(title)
                ],
              ),
            ],
          )
      ),
    );
  }

  Widget _buildCardGradient(){
    return Container(
      height: 268,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.deepOrange.withOpacity(0.7),
          ],
        )
      ),
    );
  }

  Widget _buildCardText(title){
    return Positioned(
      bottom: 10,
      right: 10,
      child: Text(title,
        style: TextStyle(
            fontSize: 20,
            color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildImage(image){
    return Image.asset(image, fit: BoxFit.fill, height: 268,);
  }

  Widget _buildAppBar(){
    return AppBar(
        title: Text('Cozinhando em casa')
    );
  }
}
