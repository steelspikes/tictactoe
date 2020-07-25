import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/StateProvider.dart';
import 'dart:math';

class Game3x3 extends StatefulWidget {
  @override
  _Game3x3State createState() => _Game3x3State();
}

class _Game3x3State extends State<Game3x3> with TickerProviderStateMixin {

  AnimationController GAME_3X3_ANIMATION_CONTROLLER;
  Animation GAME_3X3_ANIMATION;
  AnimationController WIN_PLAYER_1_ANIMATION_CONTROLLER;
  Animation WIN_PLAYER_1_ANIMATION;
  AnimationController WIN_PLAYER_2_ANIMATION_CONTROLLER;
  Animation WIN_PLAYER_2_ANIMATION;


  void initState() {
    super.initState();

    GAME_3X3_ANIMATION_CONTROLLER = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 400
      )
    );
    GAME_3X3_ANIMATION_CONTROLLER.addListener(() {
      setState(() {});
    });

    GAME_3X3_ANIMATION = Tween(
      begin: 0.0,
      end: 1.0
    ).animate(
      CurvedAnimation(
        curve: Curves.ease,
        parent: GAME_3X3_ANIMATION_CONTROLLER
      )
    );

    GAME_3X3_ANIMATION_CONTROLLER.forward();

    WIN_PLAYER_1_ANIMATION_CONTROLLER = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300)
    );
    WIN_PLAYER_1_ANIMATION_CONTROLLER.addListener(() {
      setState(() {});
    });
    WIN_PLAYER_1_ANIMATION_CONTROLLER.addStatusListener((status) {
      if(status == AnimationStatus.completed) {
        WIN_PLAYER_1_ANIMATION_CONTROLLER.reverse();
      }
    });

    WIN_PLAYER_1_ANIMATION = Tween(
      begin: 1.0,
      end: 2.5
    ).animate(CurvedAnimation(
      curve: Curves.ease,
      parent: WIN_PLAYER_1_ANIMATION_CONTROLLER
    ));

    WIN_PLAYER_2_ANIMATION_CONTROLLER = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300)
    );
    WIN_PLAYER_2_ANIMATION_CONTROLLER.addListener(() {
      setState(() {});
    });
    WIN_PLAYER_2_ANIMATION_CONTROLLER.addStatusListener((status) {
      if(status == AnimationStatus.completed) {
        WIN_PLAYER_2_ANIMATION_CONTROLLER.reverse();
      }
    });

    WIN_PLAYER_2_ANIMATION = Tween(
      begin: 1.0,
      end: 2.5
    ).animate(CurvedAnimation(
      curve: Curves.ease,
      parent: WIN_PLAYER_2_ANIMATION_CONTROLLER
    ));
  }

  Widget getElementWidgetToDisplay(item_data) {
    if(item_data['used']) {
      return Image(
        image: item_data['owner'] == 1 ? AssetImage('images/circle.png') : AssetImage('images/mark.png'),
      );
    } else {
      return Container (

      );
    }
  }

  List ELEMENTS = [
    {
      'number': 1,
      'used': false,
      'owner': 0,
      'border': {
        'top': false,
        'left': false,
        'right': true,
        'bottom': true
      }
    },
    {
      'number': 2,
      'used': false,
      'owner': 0,
      'border': {
        'top': false,
        'left': true,
        'right': true,
        'bottom': true
      }
    },
    {
      'number':3,
      'used': false,
      'owner': 0,
      'border': {
        'top': false,
        'left': true,
        'right': false,
        'bottom': true
      }
    },
    {
      'number':4,
      'used': false,
      'owner': 0,
      'border': {
        'top': true,
        'left': false,
        'right': true,
        'bottom': true
      }
    },
    {
      'number':5,
      'used': false,
      'owner': 0,
      'border': {
        'top': true,
        'left': true,
        'right': true,
        'bottom': true
      }
    },
    {
      'number':6,
      'used': false,
      'owner': 0,
      'border': {
        'top': true,
        'left': true,
        'right': false,
        'bottom': true
      }
    },
    {
      'number':7,
      'used': false,
      'owner': 0,
      'border': {
        'top': true,
        'left': false,
        'right': true,
        'bottom': false
      }
    },
    {
      'number':8,
      'used': false,
      'owner': 0,
      'border': {
        'top': true,
        'left': true,
        'right': true,
        'bottom': false
      }
    },
    {
      'number':9,
      'used': false,
      'owner': 0,
      'border': {
        'top': true,
        'left': true,
        'right': false,
        'bottom': false
      }
    }
  ];

  int PLAYING = 1;

  bool WINNER = false;
  int WINNER_ID = 0;

  int PLAYER_1_SCORE = 0;
  int PLAYER_2_SCORE = 0;

  int ELEMENT_COUNTER = 0;

  void declareWinner(int winner_id) {
    setState(() {
      if(winner_id == 1) {
        PLAYER_1_SCORE++;
        WIN_PLAYER_1_ANIMATION_CONTROLLER.forward();
      } else {
        PLAYER_2_SCORE++;
        WIN_PLAYER_2_ANIMATION_CONTROLLER.forward();
      }
      ELEMENTS = [
      {
        'number': 1,
        'used': false,
        'owner': 0,
        'border': {
          'top': false,
          'left': false,
          'right': true,
          'bottom': true
        }
      },
      {
        'number': 2,
        'used': false,
        'owner': 0,
        'border': {
          'top': false,
          'left': true,
          'right': true,
          'bottom': true
        }
      },
      {
        'number':3,
        'used': false,
        'owner': 0,
        'border': {
          'top': false,
          'left': true,
          'right': false,
          'bottom': true
        }
      },
      {
        'number':4,
        'used': false,
        'owner': 0,
        'border': {
          'top': true,
          'left': false,
          'right': true,
          'bottom': true
        }
      },
      {
        'number':5,
        'used': false,
        'owner': 0,
        'border': {
          'top': true,
          'left': true,
          'right': true,
          'bottom': true
        }
      },
      {
        'number':6,
        'used': false,
        'owner': 0,
        'border': {
          'top': true,
          'left': true,
          'right': false,
          'bottom': true
        }
      },
      {
        'number':7,
        'used': false,
        'owner': 0,
        'border': {
          'top': true,
          'left': false,
          'right': true,
          'bottom': false
        }
      },
      {
        'number':8,
        'used': false,
        'owner': 0,
        'border': {
          'top': true,
          'left': true,
          'right': true,
          'bottom': false
        }
      },
      {
        'number':9,
        'used': false,
        'owner': 0,
        'border': {
          'top': true,
          'left': true,
          'right': false,
          'bottom': false
        }
      }
    ];
      WINNER = true;
      PLAYING = 1;
      ELEMENT_COUNTER = 0;
    });

  }

  void checkForAWinner() {
      //Horizontal
      if(ELEMENTS[0]['owner'] == 1 && ELEMENTS[1]['owner'] == 1 && ELEMENTS[2]['owner'] == 1) {
        declareWinner(1);
      }
      if(ELEMENTS[0]['owner'] == 2 && ELEMENTS[1]['owner'] == 2 && ELEMENTS[2]['owner'] == 2) {
        declareWinner(2);
      }


      if(ELEMENTS[3]['owner'] == 1 && ELEMENTS[4]['owner'] == 1 && ELEMENTS[5]['owner'] == 1) {
        declareWinner(1);
      }
      if(ELEMENTS[3]['owner'] == 2 && ELEMENTS[4]['owner'] == 2 && ELEMENTS[5]['owner'] == 2) {
        declareWinner(2);
      }


      if(ELEMENTS[6]['owner'] == 1 && ELEMENTS[7]['owner'] == 1 && ELEMENTS[8]['owner'] == 1) {
        declareWinner(1);
      }
      if(ELEMENTS[6]['owner'] == 2 && ELEMENTS[7]['owner'] == 2 && ELEMENTS[8]['owner'] == 2) {
        declareWinner(2);
      }

      //Vertical
      if(ELEMENTS[0]['owner'] == 1 && ELEMENTS[3]['owner'] == 1 && ELEMENTS[6]['owner'] == 1) {
        declareWinner(1);
      }
      if(ELEMENTS[0]['owner'] == 2 && ELEMENTS[3]['owner'] == 2 && ELEMENTS[6]['owner'] == 2) {
        declareWinner(2);
      }

      if(ELEMENTS[1]['owner'] == 1 && ELEMENTS[4]['owner'] == 1 && ELEMENTS[7]['owner'] == 1) {
        declareWinner(1);
      }
      if(ELEMENTS[1]['owner'] == 2 && ELEMENTS[4]['owner'] == 2 && ELEMENTS[7]['owner'] == 2) {
        declareWinner(2);
      }

      if(ELEMENTS[2]['owner'] == 1 && ELEMENTS[5]['owner'] == 1 && ELEMENTS[8]['owner'] == 1) {
        declareWinner(1);
      }
      if(ELEMENTS[2]['owner'] == 2 && ELEMENTS[5]['owner'] == 2 && ELEMENTS[8]['owner'] == 2) {
        declareWinner(2);
      }

      //Across
      if(ELEMENTS[0]['owner'] == 1 && ELEMENTS[4]['owner'] == 1 && ELEMENTS[8]['owner'] == 1) {
        declareWinner(1);
      }
      if(ELEMENTS[0]['owner'] == 2 && ELEMENTS[4]['owner'] == 2 && ELEMENTS[8]['owner'] == 2) {
        declareWinner(2);
      }

      if(ELEMENTS[2]['owner'] == 1 && ELEMENTS[4]['owner'] == 1 && ELEMENTS[6]['owner'] == 1) {
        declareWinner(1);
      }
      if(ELEMENTS[2]['owner'] == 2 && ELEMENTS[4]['owner'] == 2 && ELEMENTS[6]['owner'] == 2) {
        declareWinner(2);
      }

      print(ELEMENT_COUNTER);

      if(ELEMENT_COUNTER == 9 && !WINNER) {
        setState(() {
          ELEMENTS = [
          {
            'number': 1,
            'used': false,
            'owner': 0,
            'border': {
              'top': false,
              'left': false,
              'right': true,
              'bottom': true
            }
          },
          {
            'number': 2,
            'used': false,
            'owner': 0,
            'border': {
              'top': false,
              'left': true,
              'right': true,
              'bottom': true
            }
          },
          {
            'number':3,
            'used': false,
            'owner': 0,
            'border': {
              'top': false,
              'left': true,
              'right': false,
              'bottom': true
            }
          },
          {
            'number':4,
            'used': false,
            'owner': 0,
            'border': {
              'top': true,
              'left': false,
              'right': true,
              'bottom': true
            }
          },
          {
            'number':5,
            'used': false,
            'owner': 0,
            'border': {
              'top': true,
              'left': true,
              'right': true,
              'bottom': true
            }
          },
          {
            'number':6,
            'used': false,
            'owner': 0,
            'border': {
              'top': true,
              'left': true,
              'right': false,
              'bottom': true
            }
          },
          {
            'number':7,
            'used': false,
            'owner': 0,
            'border': {
              'top': true,
              'left': false,
              'right': true,
              'bottom': false
            }
          },
          {
            'number':8,
            'used': false,
            'owner': 0,
            'border': {
              'top': true,
              'left': true,
              'right': true,
              'bottom': false
            }
          },
          {
            'number':9,
            'used': false,
            'owner': 0,
            'border': {
              'top': true,
              'left': true,
              'right': false,
              'bottom': false
            }
          }
        ];
          ELEMENT_COUNTER = 0;
          PLAYING = 1;
          WINNER = false;
        });
      }

      setState(() {
          WINNER = false;
      });
      
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<StateProvider>(context);
    var SCREEN_WIDTH = MediaQuery.of(context).size.width;
    

    return Container(
      color: Color.fromRGBO(0, 10, 30, 1),
      child: Transform.scale(
        scale: GAME_3X3_ANIMATION.value,
        child: Container(
          color: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                /*Text("Let's go!", style: TextStyle(
                  fontFamily:'Consolas',
                  fontSize: 50.0,
                  color: Colors.white
                )),*/
                Center(
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    width: SCREEN_WIDTH - 60.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 3.0
                      )
                    ),
                    child: Column(
                      children:[
                        Text("Playing", style: TextStyle(
                          fontFamily:'Consolas',
                          fontSize: 40.0,
                          color: Colors.white
                        )),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 20.0
                          ),
                          child: Image(
                            width: 40.0,
                            image: PLAYING == 1 ? AssetImage('images/circle.png') : AssetImage('images/mark.png'),
                          )
                        )
                      ]
                    )
                  )
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 20.0
                  ),
                  color: Colors.transparent,
                  width: SCREEN_WIDTH,
                  height: SCREEN_WIDTH,
                  child: GridView.count(
                    primary: false,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                    crossAxisCount: 3,
                    children: ELEMENTS.map((item) {
                      return InkWell(
                        onTap:() {
                          if(!ELEMENTS[item['number']-1]['used']) {
                            setState(() {
                              ELEMENT_COUNTER++;
                              ELEMENTS[item['number']-1]['used'] = true;
                              ELEMENTS[item['number']-1]['owner'] = PLAYING;
                              if(PLAYING == 1) {
                                PLAYING = 2;
                              } else {
                                PLAYING = 1;
                              }
                            });
                            checkForAWinner();
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border(
                              left: BorderSide(
                                color: item['border']['left'] ? Colors.white : Colors.transparent,
                                width: 2
                              ),
                              right: BorderSide(
                                color: item['border']['right'] ? Colors.white : Colors.transparent,
                                width: 2
                              ),
                              bottom: BorderSide(
                                color: item['border']['bottom'] ? Colors.white : Colors.transparent,
                                width: 2
                              ),
                              top: BorderSide(
                                color: item['border']['top'] ? Colors.white : Colors.transparent,
                                width: 2
                              )
                            )
                          ),
                          width: SCREEN_WIDTH/3,
                          height: SCREEN_WIDTH/3,
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: getElementWidgetToDisplay(item)
                          )
                          
                        )
                      );
                    }).toList()
                  )
                ),
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 15.0
                        ),
                        child: Text('Scores', style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Consolas',
                          fontSize: 40.0
                        )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Transform.scale(
                            scale: WIN_PLAYER_1_ANIMATION.value,
                              child: Column(
                                children: [
                                  Image(
                                    width: 40.0,
                                    image: AssetImage('images/circle.png')
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 15.0
                                    ),
                                    child: Text(PLAYER_1_SCORE.toString(), style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Consolas',
                                      fontSize: 30.0
                                    ))
                                  )
                                ],
                              )
                            ),
                          Transform.scale(
                            scale: WIN_PLAYER_2_ANIMATION.value,
                            child: Column(
                              children: [
                                Image(
                                  width: 40.0,
                                  image: AssetImage('images/mark.png')
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 15.0
                                  ),
                                  child: Text(PLAYER_2_SCORE.toString(), style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Consolas',
                                    fontSize: 30.0
                                  ))
                                )
                              ],
                            )
                          )
                        ]
                      )
                    ]
                  )
                )
              ]
            )
          )
        )
      )
    );
  }
}