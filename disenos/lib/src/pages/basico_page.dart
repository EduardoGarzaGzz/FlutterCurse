import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {
  final textTitulo = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final textSubTitulo = TextStyle(fontSize: 18.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'scroll');
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _crateImage(),
                _crateTitle(),
                _createActions(),
                _createText(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _crateImage() {
    return Container(
      width: double.infinity,
      child: Image(
          height: 200.0,
          fit: BoxFit.cover,
          image: NetworkImage(
              'https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-1.2.1&w=1000&q=80')),
    );
  }

  Widget _crateTitle() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Un texto bien bonits',
                  style: textTitulo,
                ),
                SizedBox(
                  height: 7.0,
                ),
                Text(
                  'Una super descripcion bla bla bla bla bla',
                  style: textSubTitulo,
                )
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red,
            size: 41.0,
          ),
          Text(
            '41',
            style: TextStyle(fontSize: 20.0),
          )
        ],
      ),
    );
  }

  Widget _createActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _createAction(Icons.call, 'CALL'),
        _createAction(Icons.near_me, 'ROUTER'),
        _createAction(Icons.share, 'SHARE'),
      ],
    );
  }

  Widget _createAction(IconData icon, String txt) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          size: 40.0,
          color: Colors.blue,
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          txt,
          style: TextStyle(color: Colors.blue, fontSize: 15.0),
        )
      ],
    );
  }

  Widget _createText() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0,),
      child: Text(
        'Sunt solemes prensionem brevis, emeritis cliniases. '
        'Axonas messis in cirpi! Historias sunt zeluss de fatalis epos. '
        'Hercle, agripeta placidus!, vita! Orgias assimilant, '
        'tanquam varius equiso. Sunt solemes prensionem brevis, emeritis cliniases. '
        'Axonas messis in cirpi! Historias sunt zeluss de fatalis epos. '
        'Hercle, agripeta placidus!, vita! Orgias assimilant, '
        'tanquam varius equiso. Sunt solemes prensionem brevis, emeritis cliniases. '
        'Axonas messis in cirpi! Historias sunt zeluss de fatalis epos. '
        'Hercle, agripeta placidus!, vita! Orgias assimilant, '
        'tanquam varius equiso. Sunt solemes prensionem brevis, emeritis cliniases. '
        'Axonas messis in cirpi! Historias sunt zeluss de fatalis epos. '
        'Hercle, agripeta placidus!, vita! Orgias assimilant, '
        'tanquam varius equiso.',
        textAlign: TextAlign.justify,
      ),
    );
  }
}
