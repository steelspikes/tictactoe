import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/Game3x3.dart';
import 'package:tictactoe/Menu.dart';
import 'package:tictactoe/StateProvider.dart'; 

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  AnimationController DIALOG_SCALE_ANIMATION_CONTROLLER;
  Animation<double> DIALOG_SCALE_ANIMATION;

  void initState() {
      super.initState();
        var provider = Provider.of<StateProvider>(context, listen: false);
        provider.PADDING_ANIMATION_CONTROLLER = AnimationController(
          vsync: this,
          duration: Duration(
            milliseconds: 400
          )
        );

        provider.PADDING_ANIMATION_CONTROLLER.addListener(() {
          setState(() {});
        });

        provider.PADDING_ANIMATION = Tween(
          begin: 30.0,
          end: 0.0
        ).animate(
          CurvedAnimation(
            curve: Curves.elasticIn,
            parent: provider.PADDING_ANIMATION_CONTROLLER
          )
        );

        provider.MAIN_PAGE_CONTROLLER = PageController(
          initialPage: 0
        );

        DIALOG_SCALE_ANIMATION_CONTROLLER = AnimationController(
          vsync: this,
          duration: Duration(
            milliseconds: 200
          )
        );

        DIALOG_SCALE_ANIMATION_CONTROLLER.addListener(() {
          setState(() {});
        });

        

        DIALOG_SCALE_ANIMATION = Tween<double>(
          begin: 0.0,
          end: 1.0
        ).animate(
          CurvedAnimation(
            parent: DIALOG_SCALE_ANIMATION_CONTROLLER, 
            curve: Curves.bounceOut
          )
        );
        
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<StateProvider>(context);
    return WillPopScope(
      onWillPop: () {
        if(provider.MAIN_PAGE_CONTROLLER.page != 0) {
          provider.MAIN_PAGE_CONTROLLER.animateToPage(0, duration: Duration(milliseconds: 200), curve: Curves.ease).then((value) {
            provider.PADDING_ANIMATION_CONTROLLER.reverse();
          });
        } else {
          DIALOG_SCALE_ANIMATION_CONTROLLER.forward();
          showDialog(
            context: context,
            builder: (context) => WillPopScope(
              onWillPop: () {
                DIALOG_SCALE_ANIMATION_CONTROLLER.reverse();
                Navigator.pop(context);
              },
              child: ScaleTransition(
                scale: DIALOG_SCALE_ANIMATION,
                child: AlertDialog(
                  content: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('¡Wait!'),
                        Text('Do you want to close the app?'),
                        Row(
                          children: [
                            InkWell(
                              child: Text('Yes'),
                              onTap: () {
                                print("You closed the app");
                                //exit(0);
                              }
                            ),
                            InkWell(
                              child: Text('No'),
                              onTap: () {
                                DIALOG_SCALE_ANIMATION_CONTROLLER.reverse();
                                Navigator.pop(context);
                              }
                            )
                          ]
                        )
                      ]
                    )
                  ),
                )
              )
            )
          );
        }
      },
      child: Scaffold(
      body: Container(
        color: Color.fromRGBO(0, 47, 119, 1),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(provider.PADDING_ANIMATION.value),
              child: Container(
                color: Color.fromRGBO(0, 67, 119, 1),
                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: provider.MAIN_PAGE_CONTROLLER,
                  children: [
                    Menu(),
                    Game3x3()
                  ],
                )
              )
            )
          ),
        )
    )
    );
  }
}