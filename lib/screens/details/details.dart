import 'package:flutter/material.dart';
import '../../models/receita.dart';

class Details extends StatelessWidget {

  final Receita receita;

  Details({Key key, @required this.receita}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildDetails();
  }

  Widget _buildDetails(){
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _buildImageDetail(receita.foto),
          _buildTitleDetail(receita.titulo),
          _buildLineIconDetail('${receita.porcoes} porções', receita.tempoPreparo),
          _buildSubtitleDetail('Ingredientes'),
          _buildTextDetail(receita.ingredientes),
          _buildSubtitleDetail('Modo de Preparo'),
          _buildTextDetail(receita.modoPreparo),
        ],
      ),
      appBar: _buildAppBar(),
    );
  }

  Widget _buildImageDetail(image){
    return Image.asset(image);
  }

  Widget _buildTitleDetail(title){
    return Center(
         child: Text(title, style: TextStyle(
          color: Colors.deepOrange,
          fontSize: 30,
          )
         )
    );
  }

  Widget _buildLineIconDetail(yield, preparation_time){
    return Row(
      children: <Widget>[
        _buildColumnsIconDetail(Icons.restaurant, yield),
        _buildColumnsIconDetail(Icons.timer, preparation_time),
      ],
    );
  }

  Widget _buildColumnsIconDetail(icon, text){
    return Expanded(
        child: Column(
          children: <Widget>[
            Icon(icon, color: Colors.deepOrange,),
            Text(text, style:  TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold),),
          ],
        )
    );
  }

  Widget _buildSubtitleDetail(subtitle){
    return Center(
      child: Text(subtitle, style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      ),
    );
  }

  Widget _buildTextDetail(text){
    return Container(
      padding: EdgeInsets.all(16),
      child: Text(text),
    );
  }

  Widget _buildAppBar(){
    return AppBar(
        title: Text('Cozinhando em casa')
    );
  }
}