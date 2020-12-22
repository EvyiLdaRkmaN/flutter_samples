import 'package:flutter/material.dart';


class ButtonLoadingPage extends StatefulWidget {

  @override
  _ButtonLoadingPageState createState() => _ButtonLoadingPageState();
}

class _ButtonLoadingPageState extends State<ButtonLoadingPage> 
    with TickerProviderStateMixin{

  //
  AnimationController _animationController;
  AnimationController _controllerContainer;

  Animation<double> _animationFadeCircular;
  Animation<double> _animationFadeContainer;
  Animation<double> _animationTransform;
  Animation<Color> _animationColor;

  bool _visible = true, _complete = false;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this, duration: Duration(milliseconds: 500));

    _controllerContainer = AnimationController(
      vsync: this, duration: Duration(milliseconds: 500));

    _animationFadeCircular 
      = Tween(begin: 0.0, end:1.0).animate(_controllerContainer);
    _animationFadeContainer 
      = Tween(begin: 1.0, end:0.0).animate(_animationController);
    _animationTransform 
      = Tween(begin: 150.0, end:50.0).animate(_animationController);
    _animationColor 
      = ColorTween(begin: Colors.red, end:Colors.transparent).animate(_animationController);
    

    // _controllerContainer.addListener(() {
      // setState(() {
      //   print(_animationTransform.value);
      // });
    //  });

    _animationController.addListener(() {
      // print(_animationFadeCircular.value);
      setState(() {
        
        if (_animationFadeContainer.value<0.4 && !_complete) {
          _visible = false;
        }
        // print('Datos 1--> ${_animationFadeContainer.value>0.4} $_complete, _visible-->$_visible');
        if (_animationFadeContainer.value>0.4 && _complete) _complete = false;

      });
    });
    _controllerContainer.addListener(() {
      
        if (_controllerContainer.isCompleted) {
          // _controllerContainer.reverse();
          Future.delayed(Duration(seconds: 1),(){
            _animationController.reverse();
            _controllerContainer.reverse();
            setState(() {
              _visible = true;
              _complete = true;
              // print('Completo-->$_visible');
            });
          });
        }
    });
    
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _controllerContainer.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // print('Visible? = $_visible');
    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonLoading'),
      ),
      body: Center(
        child: Column(
          mainAxisSize:MainAxisSize.max,
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('Reverse'),
              onPressed:(){
                _controllerContainer.reverse();
                _animationController.reverse();
              },
            ),
            Container(
              width: _animationTransform.value,
              height:40.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: _animationColor.value,
              ),
              child: _visible 
                ? FadeTransition(
                  opacity: _animationFadeContainer,
                  child: Text('Iniciar seción'),)
                : FadeTransition(
                  opacity: _animationFadeCircular,
                  child: CircularProgressIndicator())
            ),
          ],
        ),
     ),
     floatingActionButton: FloatingActionButton(onPressed: (){
       _animationController.forward();
       Future.delayed(Duration(milliseconds: 200,),(){
         print('Ejecutando delayed');
         _controllerContainer.forward();
       });
     }),
   );
  }

  temp(){
    
  }

/* FadeTransition(
            opacity: _animationFadeCircular,
            child:CircularProgressIndicator()), */
}