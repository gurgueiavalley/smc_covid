import 'package:flutter/material.dart';


class CustomButton extends StatefulWidget {
  final title;
  final icon;
  final onPressed;
  final color;
  final cor_indicador;
  const CustomButton( {Key key, this.title, this.icon, this.onPressed, this.color, this.cor_indicador}): super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool status=true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Visibility(
        visible: status,
        child: _botao(context),
        replacement: _carregando(context),

      ),
    );
  }

  _botao(var context) {
    return AnimatedContainer(
      curve: Curves.linear,
      duration: Duration(milliseconds: 400),
      width: MediaQuery.of(context).size.width * 0.87,
      height: 60,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black38,
          blurRadius: 5,
          offset: Offset(-1, 5)
        )
      ], color: widget.color==null?Colors.white:widget.color, borderRadius: BorderRadius.circular(50)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: MaterialButton(
          onPressed: () {
            setState(() {
              status=!status;
              widget.onPressed();
            });
          },
          child: Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: widget.icon,
                ),
              ),
              Container(
                  width: 150,
                  alignment: Alignment.center,
                  child: widget.title,
                ),
              
              Expanded(
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }


   _carregando(var context) {
    return AnimatedContainer(
      curve: Curves.linear,
      duration: Duration(milliseconds: 400),
      width: 70,
      height: 60,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 7,
        )
      ], color: widget.color==null?Colors.white:widget.color, borderRadius: BorderRadius.circular(50)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: MaterialButton(
          onPressed: null,
          child: Row(
            children: [              
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(widget.cor_indicador),
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }



}




