//Menu Buttons in an array is inspired by Chrisir on proccessing forums

import processing.video.*;

Movie Eyecatcher;
//PImage Eyecatcher;
PImage infoBackGround;
PImage infoPage; 
PImage highlight;
PImage cross;
PImage nutrition;
PImage allergies;
PImage gYogurt0;
PImage gYogurt1;
PImage vanilla0;
PImage vanilla1;
PImage doughnut0;
PImage doughnut1;
PImage cMilk0;
PImage cMilk1;
PFont TestText;
int page;
int crossNum;
int highlightNum;
button[] buttons = new button[10];
button[] menuButtons = new button[4];
button[] infoButtons = new button[6];
int button0_X, button0_Y, button0_SizeX, button0_SizeY;
int button1_X, button1_Y, button1_Size;
int menuButtonX, menuButtonY, menuButtonW, menuButtonH;
int spacing;//spacing between menu buttons
int start; 
int timer;
int timerValue=60000; //milliseconds before poster returns to the front page
int highlightSize;
int crossSize;
int highlight0X, highlight0Y, highlight1X, highlight1Y, highlight2X, highlight2Y, highlight3X, highlight3Y;
int cross0X, cross0Y, cross1X, cross1Y, cross2X, cross2Y, cross3X, cross3Y;
int pressY;
int press=0;

void setup () {
  frameRate(30);
  page=2; //which page we start at (useful for testing individual pages code)
  Eyecatcher=new Movie (this, "standby screen.mp4");
  Eyecatcher.loop();
  infoBackGround=loadImage("inter.png");
  infoPage=loadImage("hyldeNYmenu.png");
  highlight = loadImage("highlight.png");
  cross = loadImage("kryds.png");
  TestText = loadFont("TestText.vlw");
  nutrition = loadImage("hyldeNYnutrition.png");
  allergies = loadImage("hyldeNYallergies.png");
  gYogurt0 = loadImage("haandg.png");
  gYogurt1 = loadImage("infog.png");
  vanilla0= loadImage("haandvi.png");
  vanilla1= loadImage("hyldevi.png");
  doughnut0=loadImage("doughh.png");
  doughnut1=loadImage("doughi.png");
  cMilk0=loadImage("chocoh.png");
  cMilk1=loadImage("chocoi.png");
  imageMode(CORNER);
  size (1503, 771);
  start=millis();//timer is started

  //setup for buttons
  button0_X=0; 
  button0_Y=0;
  button0_SizeX=100;
  button0_SizeY=100;
  button1_X=5;
  button1_Y=height-25;
  button1_Size=20;
  menuButtonW=308;
  menuButtonH=95;
  menuButtonX=width-menuButtonW-65;
  menuButtonY=187;
  spacing = menuButtonH+55;

  //setup for highlights
  pressY=150;
  crossSize = 150;
  highlightSize=300;
  highlight0X=330;
  highlight0Y=405;
  highlight1X=950;
  highlight1Y=710;
  highlight2X=555;
  highlight2Y=550;
  highlight3X=137;
  highlight3Y=548;
  cross0X=150;
  cross0Y=400;
  cross1X=940;
  cross1Y=400;
  cross2X=505;
  cross2Y=400;
  cross3X=230;
  cross3Y=240;

  //non loop buttons
  buttons[0]= new button(button0_X, button0_Y, button0_SizeX, button0_SizeY);   
  buttons[1]= new button(button1_X, button1_Y, button1_Size, button1_Size);
  buttons[2]= new button(width-60, 120, 30, 30);
  infoButtons[0] = new button(highlight0X, highlight0Y, 110, 100);
  infoButtons[1] = new button(highlight1X, highlight1Y, 200, 100);
  infoButtons[2] = new button(highlight2X, highlight2Y, 100, 100);
  infoButtons[3] = new button(highlight3X, highlight3Y, 200, 100);

  //loop for menu buttons
  for (int i = 0; i < menuButtons.length; i++) {
    menuButtons[i] = new button(menuButtonX, menuButtonY+(i*spacing), menuButtonW, menuButtonH, i);
  }
}

void movieEvent(Movie m) {
  m.read();
}

void draw() {

  println(press);
  if (page==0) {//Front Page
    image(Eyecatcher, 0, 0, width, height);
    crossNum=0; //removes crosses
    highlightNum=0; //removes highlights
    press=0;
  } else if (page==1) {//page 2
    image(infoBackGround, 0, 0, width, height);
  } else if (page==2) {//page 3
    image(infoPage, 0, 0, width, height);
    buttons[1].display();
    buttons[1].update();
  } else if (page==3) {
    image(nutrition, 0, 0, width, height);
  } else if (page==4) {
    image(allergies, 0, 0, width, height);
  }

  if (page==3||page==4) {
    fill(255, 0, 0);
    //buttons[2].display();
    image(cross, width-60, 120, 30, 30);
    buttons[2].update();
  }

  if (page==2||page==3||page==4) {//so that menu buttons show up on all 3 variations of the menu screen
    /*displaying menu buttons. The for loop allows us to iterate over each element in the menuButtons array 
     as the datatype (button class) has been defined as menuButton. This name is then assigned to each element in 
     the origional array with the loop. The display and update draws the functions in the page.*/
    for (button menuButton : menuButtons) {
      menuButton.update();
      menuButton.transDisplay();
    }
    rectMode(CENTER);//for fitting with highlight images
    infoButtons[0].display();
    infoButtons[1].display();
    infoButtons[2].display();
    infoButtons[3].display();
    infoButtons[0].centerUpdate();
    infoButtons[1].centerUpdate();
    infoButtons[2].centerUpdate();
    infoButtons[3].centerUpdate();
    //for when info buttons are pressed
    rectMode(CORNER);
    if (press==1) {
      image (gYogurt0, 0, pressY);
      image (gYogurt1, 0, pressY);
    } else if (press==2) {
      image(doughnut0, 0, pressY);
      image(doughnut1, 0, pressY);
    } else if (press==3) {
      image (vanilla0, 0, pressY);
      image (vanilla1, 0, pressY);
    } else if (press==4) {
      image(cMilk0, 0, pressY);
      image(cMilk1, 0, pressY);
    }
  }



  imageMode(CENTER);//set image to center for highlights
  //which highlights appear when menu buttons are pressed
  if (highlightNum==1) {
    fill(0);
    image(highlight, highlight0X, highlight0Y, highlightSize, highlightSize);
  } else if (highlightNum==2) {
    image(highlight, highlight1X, highlight1Y, highlightSize, highlightSize);
  } else if (highlightNum==3) {
    image(highlight, highlight2X, highlight2Y, highlightSize, highlightSize);
  } else if (highlightNum==4) {
    image(highlight, highlight3X, highlight3Y, highlightSize, highlightSize);
  } else if (crossNum==1) {
    image(cross, highlight1X, highlight1Y, crossSize, crossSize);
    image(cross, cross0X, cross0Y, crossSize, crossSize);
  } else if (crossNum==2) {
    image(cross, cross1X, cross1Y, crossSize, crossSize);
  } else if (crossNum==3) {
    image(cross, cross2X, cross2Y, crossSize, crossSize);
  } else if (crossNum==4) {
    image(cross, highlight2X, highlight2Y, crossSize, crossSize);
    image(cross, cross3X, cross3Y, crossSize, crossSize);
  }
  imageMode(CORNER);//reset back to corner for background images

  //timer to return to front page when X seconds have passed - dependant on assigned timerValue int in setup
  if (page!=0) { // != inequality
    fill(255); //for white text on the button
    textFont(TestText);
    timer=millis()-start; //time since sketch started minus whichever millis start currently is assigned to 
    int countdown = (timerValue - timer)/1000; //for visual countdown shown in whole seconds
    if (countdown<5) {//so that the timer is only shown when 5 seconds remain
      text(countdown, width/2, 50);//placeholder text so we can see timer
    }
    if (timer>timerValue) {
      page=0;
      start=millis();//set var start to current millis
    }
  }
}

void mousePressed() {

  start=millis();//reset timer when mouse if clicked

  if (page==0) {
    page=1;
  } else if (page==1) { 
    page=2;
  } else if (page==2) {
    buttons[1].press();
    if (buttons[1].pressed==true) { //button 1 clickable area
      page=0;
    }
  }
  if (page==3||page==4) {
    buttons[2].press();
    if (buttons[2].pressed==true) {
      page=2;
      highlightNum=0;
      press=0;
      crossNum=0;
    }
  } 
  if (page==2||page==3||page==4) {
    /*Like the previouse code assigning menuButton to the array, this add the press functionality and combines it with
     an if statement which uses a custom function to identify which button is pressed*/
    for (button menuButton : menuButtons) {
      menuButton.press();
      if (menuButton.pressed==true) {
        evalButton(menuButton);
      }
    }

    if (press>0) {
      press=0;
    } else if (press==0) {
      infoButtons[0].press();
      if (infoButtons[0].pressed==true) {
        press=1;
      }
      infoButtons[1].press();
      if (infoButtons[1].pressed==true) {
        press=2;
      }
      infoButtons[2].press();
      if (infoButtons[2].pressed==true) {
        press=3;
      }
      infoButtons[3].press();
      if (infoButtons[3].pressed==true) {
        press=4;
      }
    }
  }
}

//so that buttons do not keep the on button press color when they are not pressed
void mouseReleased() {
  for (button menuButton : menuButtons) {
    menuButton.release();
  }
  buttons[0].release();
  buttons[1].release();
  buttons[2].release();
  infoButtons[0].release();
  infoButtons[1].release();
  infoButtons[2].release();
  infoButtons[3].release();
}


/*function for calling elements in array and giving them different functions by checking the variable index which is 
 defined as the objects place in the array. This lets us specify individual highlights to individual buttons*/
void evalButton(button menuButton) {
  //println(menuButton.index);
  if (menuButton.index==0 && page==2) {
    page=3;
    highlightNum=0;
    press=0;
  } else if (menuButton.index==1 && page==2) {
    highlightNum=1;
  } else if (menuButton.index==2 && page==2) {
    highlightNum=2;
  } else if (menuButton.index==3 && page==2) {
    page=4;
    highlightNum=0;
  } else if (menuButton.index==0 && page==4) {
    crossNum=1;
  } else if (menuButton.index==1 && page==4) {
    crossNum=2;
  } else if (menuButton.index==2 && page==4) {
    crossNum=3;
  } else if (menuButton.index==3 && page==4) {
    crossNum=4;
  } else if (menuButton.index==0 && page==3) {
    highlightNum=2;
  } else if (menuButton.index==1 && page==3) {
    highlightNum=4;
  } else if (menuButton.index==2 && page==3) {
    highlightNum=3;
  } else if (menuButton.index==3 && page==3) {
    highlightNum=2;
  }
}
