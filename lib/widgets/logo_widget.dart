import 'package:flutter/cupertino.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:70),
      child: Container(
       // height: MediaQuery.of(context).size.height*.2,
        child: Column(
          children: <Widget>[
            Image(
              image: AssetImage('images/icons/buyicon.png'),
              
            ),
            Text(
              'Buy it',
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 26,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
