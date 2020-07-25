import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/StateProvider.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<StateProvider>(context);
    return Container(
      color: Color.fromRGBO(0, 10, 30, 1),
      child: Column(
        children: [
          Text(provider.APP_NAME, 
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Consolas',
              fontSize: 60.0
            )
          ),
          InkWell(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                border: Border.all(
                  color: Colors.white,
                  width: 3.0
                )
              ),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 70.0
                      )
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10
                      ),
                      child: Text("Start", style: TextStyle (
                        fontSize: 40,
                        fontFamily: 'Consolas',
                        color: Colors.white
                      ))
                    )
                  ]
                )
              )
            ),
            onTap: () {
              provider.PADDING_ANIMATION_CONTROLLER.forward().then((value) => 
                provider.MAIN_PAGE_CONTROLLER.animateToPage(1, duration: Duration(milliseconds: 200), curve: Curves.ease)
              );
            },
          ),
          
        ],
      )
    );
  }
}