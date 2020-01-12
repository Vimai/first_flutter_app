import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildHome();
  }

  Widget _buildHome(){
    return Scaffold(
      body: _buildCard(),
      appBar: _buildAppBar(),
    );
  }

  Widget _buildCard(){
    return SizedBox(
      height: 300,
      child: Card(
          margin: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  _buildImage(),
                  _buildCardText()
                ],
              ),
            ],
          )
      ),
    );
  }

  Widget _buildCardText(){
    return Positioned(
      bottom: 10,
      right: 10,
      child: Text('Bolo de Fubá', style: TextStyle(fontSize: 20),),
    );
  }

  Widget _buildImage(){
    return Image.network('https://vovopalmirinha.com.br/wp-content/uploads/2016/06/bolo-simples.jpg', fit: BoxFit.fill, height: 268,);
  }

  Widget _buildAppBar(){
    return AppBar(
        title: Text('Cozinhando em casa')
    );
  }
}
