//Menu Buttons in an array is inspired by Chrisir on proccessing forums

import processing.video.*;

Movie Eyecatcher;
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
PImage milk;
PImage milkshake;
PImage musli;
PImage nuts;
PImage popcorn;
PImage reje;
PImage skyr;
PImage cod;
PImage brownie;
PImage cornflakes;
PImage energi;
PImage titel;
PImage infoBackGround, infoPage, highlight, cross, nutrition;
PImage allergies, gYogurt0, gYogurt1, vanilla0, vanilla1, doughnut0;
PImage doughnut1, cMilk0, cMilk1, milk, milkshake, musli, nuts;
PImage popcorn, reje, skyr, cod, brownie, cornflakes, energi, titel;
PFont TestText;
int page;
int crossNum;
int highlightNum;
button[] buttons = new button[3];
button[] menuButtons = new button[4];
button[] infoButtons = new button[16];
int button0_X, button0_Y, button0_SizeX, button0_SizeY;
int button1_X, button1_Y, button1_Size;
int menuButtonX, menuButtonY, menuButtonW, menuButtonH;
int spacing;//spacing between menu buttons
int start; 
int timer;
int timerValue=40000; //milliseconds before poster returns to the front page
int highlightSize;
int crossSize;
int topShelfY, topMiddelShelfY,bottomMiddelShelfY, bottomShelfY, gYogurt0X, gYogurt1X, doughnut0X, vanilla0X, cMilk0X;
int milk0X, milkshake0X, musli0X, popcornX, nuts0Y, cornflakesX;
int reje0X, skyr0X, cod0X, brownie0X, cornflakes0X, energi0X;
int groceryH;
int cross0X, cross0Y, cross1X, cross1Y, cross2X, cross2Y, cross3X, cross3Y;
int crossButtonX, crossButtonY, crossButtonSize;
int pressY;
int press=0;

void setup () {
  frameRate(60);
  page=2; //which page we start at (useful for testing individual pages code)
  Eyecatcher=new Movie (this, "standby screen.mp4");
  Eyecatcher.loop();
  titel=loadImage("titelhej.png");
  infoBackGround=loadImage("inter.png");
  infoPage=loadImage("directions.png");
  highlight = loadImage("highlight.png");
  cross = loadImage("kryds.png");
  TestText = loadFont("TestText.vlw");
  nutrition = loadImage("nut.png");
  allergies = loadImage("all.png");
  gYogurt0 = loadImage("haandg.png");
  gYogurt1 = loadImage("infog.png");
  vanilla0= loadImage("haandvi.png");
  vanilla1= loadImage("hyldevi.png");
  doughnut0=loadImage("doughh.png");
  doughnut1=loadImage("doughi.png");
  cMilk0=loadImage("chocoh.png");
  cMilk1=loadImage("chocoi.png");
  milk=loadImage("milk.png");
  milkshake=loadImage("milkshake.png");
  musli=loadImage("musli.png");
  nuts=loadImage("nuts.png");
  popcorn=loadImage("popcorn.png");
  reje=loadImage("reje.png");
  skyr=loadImage("skyr.png");
  cod=loadImage("cod.png");
  brownie=loadImage("brownie.png");
  cornflakes=loadImage("cornflakes.png");
  energi=loadImage("energi.png");
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
  pressY=150; //Y-axis offset for some info images
  crossSize = 150;//size of cross images
  highlightSize=300;//size of highlights
//standardized location for groceries depending on shelf Y-axis location
  topShelfY=250;
  topMiddelShelfY=400;
  bottomMiddelShelfY=545;
  bottomShelfY=height-75;
  groceryH=100;//shared height for all groceries(used for infobuttons)
  gYogurt0X=330;
  gYogurt1X=895;
  doughnut0X=950;
  vanilla0X=555;
  cMilk0X=137;
  milk0X=740;
  milkshake0X=710;
  musli0X=145;
  popcornX=370;
  reje0X=510;
  skyr0X=240;
  cod0X=455;
  brownie0X=725;
  cornflakesX=940;
  energi0X=110;
  cross0X=150;
  cross0Y=400;
  cross1X=940;
  cross1Y=400;
  cross2X=505;
  cross2Y=400;
  cross3X=230;
  cross3Y=240;
  crossButtonX=width-60;
  crossButtonY=120;
  crossButtonSize=30;

  //non loop buttons
  buttons[0]= new button(button0_X, button0_Y, button0_SizeX, button0_SizeY);   
  buttons[1]= new button(button1_X, button1_Y, button1_Size, button1_Size);
  buttons[2]= new button(crossButtonX, crossButtonY, crossButtonSize, crossButtonSize);
  infoButtons[0] = new button(gYogurt0X, topMiddelShelfY, 110, groceryH); //Greek yogurt button
  infoButtons[1] = new button(doughnut0X, bottomShelfY, 200, groceryH); //vegan doughnut button
  infoButtons[2] = new button(vanilla0X, bottomMiddelShelfY, 100, groceryH); //vanilla ice cream button
  infoButtons[3] = new button(cMilk0X, bottomMiddelShelfY, 200, groceryH); //chocolate milk button
  infoButtons[4] = new button(milkshake0X, topMiddelShelfY, 160, groceryH); //milkshake button
  infoButtons[5] = new button(gYogurt1X, topShelfY, 110, groceryH); //Greek yogurt top shelf button
  infoButtons[6] = new button(musli0X, bottomShelfY, 230, groceryH); //musli button
  infoButtons[7] = new button(milk0X, topShelfY, 150, groceryH); //skim milk button
  infoButtons[8] = new button(musli0X, topMiddelShelfY, 230, groceryH);//nuts button
  infoButtons[9] = new button(popcornX, bottomMiddelShelfY, 220, groceryH); //popcorn button
  infoButtons[10] = new button(reje0X, topMiddelShelfY, 220, groceryH);//shrimp button
  infoButtons[11] = new button(skyr0X, topShelfY, 85, groceryH);//skyr button
  infoButtons[12] = new button(cod0X, topShelfY, 200, groceryH);//cod button
  infoButtons[13] = new button(brownie0X, bottomShelfY, 220, groceryH);//brownie button
  infoButtons[14] = new button(cornflakesX, topMiddelShelfY, 250, groceryH);//cornflakes button
  infoButtons[15] = new button(energi0X, topShelfY, 150, groceryH);//energy drink button

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
    crossNum=0; //doesn't redraw crosses if returned to eyecatcher
    highlightNum=0; //doesn't redraw highlights if returned to eyecatcher
    press=0; //doesn't redraw info images if returned to eyecatcher
    image(titel, 0, 0);
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
    image(cross, crossButtonX, crossButtonY, crossButtonSize, crossButtonSize);
    buttons[2].update();
  }
  imageMode(CENTER);//set image to center for highlights
  //which highlights appear when menu buttons are pressed
  if (highlightNum==1) {//low carb highlights
    image(highlight, gYogurt0X, topMiddelShelfY, highlightSize, highlightSize);
    image(highlight, milk0X, topShelfY, highlightSize, highlightSize);
    image(highlight, skyr0X, topShelfY, highlightSize, highlightSize);
  } else if (highlightNum==2) {//sugar free highlights
    image(highlight, cMilk0X, bottomMiddelShelfY, highlightSize, highlightSize);
    image(highlight, milk0X, topShelfY, highlightSize, highlightSize);
    image(highlight, cod0X, topShelfY, highlightSize, highlightSize);
    image(highlight, reje0X, topMiddelShelfY, highlightSize, highlightSize);
  } else if (highlightNum==3) {//high fat highlights
    image(highlight, vanilla0X, bottomMiddelShelfY, highlightSize, highlightSize);
    image(highlight, brownie0X, bottomShelfY, highlightSize, highlightSize);
  } else if (highlightNum==4) {//plant based highlights
    image(highlight, doughnut0X, bottomShelfY, highlightSize, highlightSize);
    image(highlight, musli0X, bottomShelfY, highlightSize, highlightSize);
    image(highlight, skyr0X, topShelfY, highlightSize, highlightSize);
  } else if (highlightNum==5) { // organic highlights
    image(highlight, cod0X, topShelfY, highlightSize, highlightSize);
    image(highlight, reje0X, topMiddelShelfY, highlightSize, highlightSize);
    image(highlight, milk0X, topShelfY, highlightSize, highlightSize);
    image(highlight, doughnut0X, bottomShelfY, highlightSize, highlightSize);
    image(highlight, musli0X, bottomShelfY, highlightSize, highlightSize);
    image(highlight, skyr0X, topShelfY, highlightSize, highlightSize);
  } else if (highlightNum==6) { //vegan highlights
    image(highlight, doughnut0X, bottomShelfY, highlightSize, highlightSize);
    image(highlight, musli0X, bottomShelfY, highlightSize, highlightSize);
    image(highlight, skyr0X, topShelfY, highlightSize, highlightSize);
  } else if (crossNum==1) {//vegetables highlights
    image(cross, doughnut0X, bottomShelfY, crossSize, crossSize);
    image(cross, skyr0X, topShelfY, crossSize, crossSize);
    image(cross, musli0X, bottomShelfY, crossSize, crossSize);
  } else if (crossNum==2) {//tree nuts highlights
    image(cross, musli0X, topMiddelShelfY, crossSize, crossSize);
  } else if (crossNum==3) {//shellfish highlights
    image(cross, reje0X, topMiddelShelfY, crossSize, crossSize);
  } else if (crossNum==4) {//eggs highlights
    image(cross, vanilla0X, bottomMiddelShelfY, crossSize, crossSize);
    image(cross, brownie0X, bottomShelfY, crossSize, crossSize);
  }
  imageMode(CORNER);//reset back to corner for background images

  if (page==2||page==3||page==4) {//so that menu buttons show up on all 3 variations of the menu screen
    /*displaying menu buttons. The for loop allows us to iterate over each element in the menuButtons array 
     as the datatype (button class) has been defined as menuButton. This name is then assigned to each element in 
     the origional array with the loop. The display and update draws the functions in the page.*/
    for (button menuButton : menuButtons) {
      menuButton.update();
      menuButton.transDisplay();
    }
    rectMode(CENTER);//for fitting with highlight images
    ///*
    infoButtons[0].testDisplay();
    infoButtons[1].testDisplay();
    infoButtons[2].testDisplay();
    infoButtons[3].testDisplay();
    infoButtons[4].testDisplay();
    infoButtons[5].testDisplay();
    infoButtons[6].testDisplay();
    infoButtons[7].testDisplay();
    infoButtons[8].testDisplay();
    infoButtons[9].testDisplay();
    infoButtons[10].testDisplay();
    infoButtons[11].testDisplay();
    infoButtons[12].testDisplay();
    infoButtons[13].testDisplay();
    infoButtons[14].testDisplay();
    infoButtons[15].testDisplay();
    //*/
    infoButtons[0].centerUpdate();
    infoButtons[1].centerUpdate();
    infoButtons[2].centerUpdate();
    infoButtons[3].centerUpdate();
    infoButtons[4].centerUpdate();
    infoButtons[5].centerUpdate();
    infoButtons[6].centerUpdate();
    infoButtons[7].centerUpdate();
    infoButtons[8].centerUpdate();
    infoButtons[9].centerUpdate();
    infoButtons[10].centerUpdate();
    infoButtons[11].centerUpdate();
    infoButtons[12].centerUpdate();
    infoButtons[13].centerUpdate();
    infoButtons[14].centerUpdate();
    infoButtons[15].centerUpdate();
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
    } else if (press==5) {
      image(milk, 0, 0);
    } else if (press==6) {
      image(milkshake, 0, 0);
    } else if (press==7) {
      image(musli, 0, 0);
    } else if (press==8) {
      image(nuts, 0, 0);
    } else if (press==9) {
      image(popcorn, 0, 0);
    } else if (press==10) {
      image(reje, 0, 0);
    } else if (press==11) {
      image(skyr, 0, 0);
    } else if (press==12) {
      image(cod, 0, 0);
    } else if (press==13) {
      image(brownie, 0, 0);
    } else if (press==14) {
      image(cornflakes, 0, 0);
    } else if (press==15) {
      image(energi, 0, 0);
    }
  }

  //timer to return to front page when X seconds have passed - dependant on assigned timerValue int in setup
  /*if (page!=0) { // != inequality
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
   }*/
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
      infoButtons[1].press();
      infoButtons[2].press();
      infoButtons[3].press();
      infoButtons[4].press();
      infoButtons[5].press();
      infoButtons[6].press();
      infoButtons[7].press();
      infoButtons[8].press();
      infoButtons[9].press();
      infoButtons[10].press();
      infoButtons[11].press();
      infoButtons[12].press();
      infoButtons[13].press();
      infoButtons[14].press();
      infoButtons[15].press();
      if (infoButtons[0].pressed==true||infoButtons[5].pressed==true) {
        press=1;
      } else if (infoButtons[1].pressed==true) {
        press=2;
      } else if (infoButtons[2].pressed==true) {
        press=3;
      } else if (infoButtons[3].pressed==true) {
        press=4;
      } else if (infoButtons[7].pressed==true) {
        press=5;
      } else if (infoButtons[4].pressed==true) {
        press=6;
      } else if (infoButtons[6].pressed==true) {
        press=7;
      } else if (infoButtons[8].pressed==true) {
        press=8;
      } else if (infoButtons[9].pressed==true) {
        press=9;
      } else if (infoButtons[10].pressed==true) {
        press=10;
      } else if (infoButtons[11].pressed==true) {
        press=11;
      } else if (infoButtons[12].pressed==true) {
        press=12;
      } else if (infoButtons[13].pressed==true) {
        press=13;
      } else if (infoButtons[14].pressed==true) {
        press=14;
      } else if (infoButtons[15].pressed==true) {
        press=15;
      }
    }
  }
}

//so that buttons do not keep the on button press color when they are not pressed
void mouseReleased() {
  for (button menuButton : menuButtons) {
    menuButton.release();
  }
  buttons[2].release();
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
    highlightNum=5;
  } else if (menuButton.index==2 && page==2) {
    highlightNum=6;
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
    highlightNum=1;
  } else if (menuButton.index==1 && page==3) {
    highlightNum=2;
  } else if (menuButton.index==2 && page==3) {
    highlightNum=3;
  } else if (menuButton.index==3 && page==3) {
    highlightNum=4;
  }
}
