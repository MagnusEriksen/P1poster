//Menu Buttons in an array code is inspired by Chrisir on proccessing forums
import processing.video.*;
Movie Eyecatcher;
PImage infoBackGround, infoPage, highlight, cross, nutrition;
PImage allergies, gYogurt0, gYogurt1, vanilla0, vanilla1, doughnut0;
PImage doughnut1, cMilk0, cMilk1, milk, milkshake, musli, nuts;
PImage popcorn, reje, skyr, cod, brownie, cornflakes, energi, titel;
PFont TestText;
int page, crossNum, highlightNum, press;
button[] buttons = new button[2];
button[] menuButtons = new button[4];
button[] infoButtons = new button[16];
int button1_X, button1_Y, button1_Size;
int menuButtonX, menuButtonY, menuButtonW, menuButtonH;
int spacing;//spacing between menu buttons
int start, timer;
int timerValue=40000; //milliseconds before poster returns to the front page
int topShelfY, topMiddelShelfY, bottomMiddelShelfY, bottomShelfY;
int gYogurt0X, gYogurt1X, milkX, milkshakeX, musliX, popcornX, vanillaX;
int rejeX, skyrX, codX, brownieX, energiX, cmilkX, doughnutX, cornflakesX;
int groceryH, yogurtVanillaW, smallBoxW, boxW, bigBoxW, energiW, milkW, cMilkW, milkshakeW, skyrW;
int highlightSize, crossSize;
int cross0X, cross0Y, cross1X, cross1Y, cross2X, cross2Y, cross3X, cross3Y;
int crossButtonX, crossButtonY, crossButtonSize;
int pressY;//Y-axis offset for some info images

void setup () {
  frameRate(60);//affects eyecatcher mp4 quality
  page=0; //which page we start at (useful for testing individual pages code)
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

  size (1503, 771);
  start=millis();//timer is started

  //setup for buttons
  button1_X=5;
  button1_Y=height-25;
  button1_Size=20;
  menuButtonW=308;
  menuButtonH=95;
  menuButtonX=width-menuButtonW-68;
  menuButtonY=187;
  spacing = menuButtonH+55;//distance between buttons

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
  yogurtVanillaW=110;//for greek yogurt and vanilla ice cream width
  smallBoxW=210; //for doughnut, shrimp and cod width
  boxW=230;//for nuts, popcorn and brownie width
  bigBoxW=250;//for musli and cornflakes width
  energiW=150;//for enery drink width
  milkW=150;//for skim milk width
  cMilkW=200;//for chocolate milk width
  milkshakeW=160; // for milkshake width
  skyrW=85;//for skyr width
  gYogurt0X=330;
  gYogurt1X=900;
  doughnutX=950;
  vanillaX=560;
  cmilkX=137;
  milkX=740;
  milkshakeX=710;
  musliX=145;
  popcornX=370;
  rejeX=505;
  skyrX=240;
  codX=455;
  brownieX=725;
  cornflakesX=940;
  energiX=110;
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

  //non looped buttons
  buttons[0]= new button(crossButtonX, crossButtonY, crossButtonSize, crossButtonSize);//page to menu page button
  buttons[1]= new button(button1_X, button1_Y, button1_Size, button1_Size);//back to eyecatcher button
  infoButtons[0] = new button(gYogurt0X, topMiddelShelfY, yogurtVanillaW, groceryH); //Greek yogurt button
  infoButtons[1] = new button(doughnutX, bottomShelfY, smallBoxW, groceryH); //vegan doughnut button
  infoButtons[2] = new button(vanillaX, bottomMiddelShelfY, yogurtVanillaW, groceryH); //vanilla ice cream button
  infoButtons[3] = new button(cmilkX, bottomMiddelShelfY, cMilkW, groceryH); //chocolate milk button
  infoButtons[4] = new button(milkshakeX, topMiddelShelfY, milkshakeW, groceryH); //milkshake button
  infoButtons[5] = new button(gYogurt1X, topShelfY, yogurtVanillaW, groceryH); //Greek yogurt top shelf button
  infoButtons[6] = new button(musliX, bottomShelfY, bigBoxW, groceryH); //musli button
  infoButtons[7] = new button(milkX, topShelfY, milkW, groceryH); //skim milk button
  infoButtons[8] = new button(musliX, topMiddelShelfY, boxW, groceryH);//nuts button
  infoButtons[9] = new button(popcornX, bottomMiddelShelfY, boxW, groceryH); //popcorn button
  infoButtons[10] = new button(rejeX, topMiddelShelfY, smallBoxW, groceryH);//shrimp button
  infoButtons[11] = new button(skyrX, topShelfY, skyrW, groceryH);//skyr button
  infoButtons[12] = new button(codX, topShelfY, smallBoxW, groceryH);//cod button
  infoButtons[13] = new button(brownieX, bottomShelfY, boxW, groceryH);//brownie button
  infoButtons[14] = new button(cornflakesX, topMiddelShelfY, bigBoxW, groceryH);//cornflakes button
  infoButtons[15] = new button(energiX, topShelfY, energiW, groceryH);//energy drink button

  //loop for menu buttons
  for (int i = 0; i < menuButtons.length; i++) {
    menuButtons[i] = new button(menuButtonX, menuButtonY+(i*spacing), menuButtonW, menuButtonH, i);
  }
}
void movieEvent(Movie m) {//for video
  m.read();
}

void draw() {

  if (page==0) {//Front Page
    image(Eyecatcher, 0, 0, width, height);
    crossNum=0; //doesn't redraw crosses if returned to eyecatcher
    highlightNum=0; //doesn't redraw highlights if returned to eyecatcher
    press=0; //doesn't redraw info images if returned to eyecatcher
    image(titel, 0, 0);
  } else if (page==1) {//intersegmental page
    image(infoBackGround, 0, 0, width, height);
  } else if (page==2) {//menu page
    image(infoPage, 0, 0, width, height);
    buttons[1].display();
    buttons[1].update();
  } else if (page==3) {//nutrition variation of menu page
    image(nutrition, 0, 0, width, height);
  } else if (page==4) {//allergy variation of menu page
    image(allergies, 0, 0, width, height);
  }

  if (page==3||page==4) {
    //buttons[0].display();
    image(cross, crossButtonX, crossButtonY, crossButtonSize, crossButtonSize);
    buttons[0].update();
  }
  imageMode(CENTER);//set image to center for highlights and crosses
  //which highlights appear when menu buttons are pressed
  if (highlightNum==1) {//low carb highlights
    image(highlight, gYogurt0X, topMiddelShelfY, highlightSize, highlightSize);
    image(highlight, milkX, topShelfY, highlightSize, highlightSize);
    image(highlight, skyrX, topShelfY, highlightSize, highlightSize);
  } else if (highlightNum==2) {//sugar free highlights
    image(highlight, cmilkX, bottomMiddelShelfY, highlightSize, highlightSize);
    image(highlight, milkX, topShelfY, highlightSize, highlightSize);
    image(highlight, codX, topShelfY, highlightSize, highlightSize);
    image(highlight, rejeX, topMiddelShelfY, highlightSize, highlightSize);
  } else if (highlightNum==3) {//high fat highlights
    image(highlight, vanillaX, bottomMiddelShelfY, highlightSize, highlightSize);
    image(highlight, brownieX, bottomShelfY, highlightSize, highlightSize);
  } else if (highlightNum==4) {//plant based highlights
    image(highlight, doughnutX, bottomShelfY, highlightSize, highlightSize);
    image(highlight, musliX, bottomShelfY, highlightSize, highlightSize);
    image(highlight, skyrX, topShelfY, highlightSize, highlightSize);
  } else if (highlightNum==5) { //organic highlights
    image(highlight, codX, topShelfY, highlightSize, highlightSize);
    image(highlight, rejeX, topMiddelShelfY, highlightSize, highlightSize);
    image(highlight, milkX, topShelfY, highlightSize, highlightSize);
    image(highlight, doughnutX, bottomShelfY, highlightSize, highlightSize);
    image(highlight, musliX, bottomShelfY, highlightSize, highlightSize);
    image(highlight, skyrX, topShelfY, highlightSize, highlightSize);
  } else if (highlightNum==6) { //vegan highlights
    image(highlight, doughnutX, bottomShelfY, highlightSize, highlightSize);
    image(highlight, musliX, bottomShelfY, highlightSize, highlightSize);
    image(highlight, skyrX, topShelfY, highlightSize, highlightSize);
  } else if (crossNum==1) {//vegetables crosses
    image(cross, doughnutX, bottomShelfY, crossSize, crossSize);
    image(cross, skyrX, topShelfY, crossSize, crossSize);
    image(cross, musliX, bottomShelfY, crossSize, crossSize);
  } else if (crossNum==2) {//tree nuts crosses
    image(cross, musliX, topMiddelShelfY, crossSize, crossSize);
  } else if (crossNum==3) {//shellfish crosses
    image(cross, rejeX, topMiddelShelfY, crossSize, crossSize);
  } else if (crossNum==4) {//eggs crosses
    image(cross, vanillaX, bottomMiddelShelfY, crossSize, crossSize);
    image(cross, brownieX, bottomShelfY, crossSize, crossSize);
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
    /*
    //visable info buttons for testing purposes
     for (button infoButton : infoButtons) {
     infoButton.testDisplay();
     }
     */
    for (button infoButton : infoButtons) {
      infoButton.centerUpdate();
    }
    //for when info buttons are pressed
    rectMode(CORNER);
    if (press==1) { //for when info buttons are pressed on any variation of the menu page
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

  if (page==0) {//click anywhere on eyecatcher to change page
    page=1;
  } else if (page==1) {//click anywhere on intersegmental to change page
    page=2;
  } else if (page==2) {//click button on main menu page to return to eyecatcher manually
    buttons[1].press();
    if (buttons[1].pressed==true) { //button 1 clickable area
      page=0;
    }
  } else if (page==3||page==4) {//click cross buttons anywhere either variation of menu screen to return to origional menu screen
    buttons[0].press();
    if (buttons[0].pressed==true) {
      page=2;
      crossNum=0; //doesn't redraw crosses when returned
      highlightNum=0; //doesn't redraw highlights when returned
      press=0; //doesn't redraw info images when returned
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
    if (press>0) {//doesn't redraw info image if info image is displayed
      press=0;
    } else if (press==0) {//only draws info image if info image isn't redrawn
      for (button infoButton : infoButtons) {
        infoButton.press();
      }
      if (infoButtons[0].pressed==true||infoButtons[5].pressed==true) {
        press=1; //greek yogurt info
      } else if (infoButtons[1].pressed==true) {
        press=2;//vegan doughnut info
      } else if (infoButtons[2].pressed==true) {
        press=3;//vanilla ice cream info
      } else if (infoButtons[3].pressed==true) {
        press=4;//chocolate milk info
      } else if (infoButtons[7].pressed==true) {
        press=5;//skim milk info
      } else if (infoButtons[4].pressed==true) {
        press=6;//milkshake info
      } else if (infoButtons[6].pressed==true) {
        press=7;//musli info
      } else if (infoButtons[8].pressed==true) {
        press=8;//muts info
      } else if (infoButtons[9].pressed==true) {
        press=9;//popcorn info
      } else if (infoButtons[10].pressed==true) {
        press=10;//shrimp info
      } else if (infoButtons[11].pressed==true) {
        press=11;//skyr info
      } else if (infoButtons[12].pressed==true) {
        press=12;//cod info
      } else if (infoButtons[13].pressed==true) {
        press=13;//brownies info
      } else if (infoButtons[14].pressed==true) {
        press=14;//cornflakes info
      } else if (infoButtons[15].pressed==true) {
        press=15;//energi drink info
      }
    }
  }
}

//so that buttons do not keep the on button press color when they are not pressed
void mouseReleased() {
  for (button menuButton : menuButtons) {
    menuButton.release();
  }
  buttons[1].release();
}

/*function for calling elements in array and giving them different functions by checking the variable index which is 
 defined as the objects place in the array. This lets us specify individual highlights to individual buttons*/
void evalButton(button menuButton) {
  //println(menuButton.index);
  if (menuButton.index==0 && page==2) {
    page=3;//go to nutrition page variation
    highlightNum=0;//doesn't redraw
    press=0;//doesn't redraw
  } else if (menuButton.index==1 && page==2) {
    highlightNum=5;//organic highlights
  } else if (menuButton.index==2 && page==2) {
    highlightNum=6;//vegan highlights
  } else if (menuButton.index==3 && page==2) {
    page=4;//go to allergy page variation
    highlightNum=0;//doesn't redraw
    press=0;//doesn't redraw
  } else if (menuButton.index==0 && page==4) {
    crossNum=1;//vegetables crosses
  } else if (menuButton.index==1 && page==4) {
    crossNum=2;//tree nuts crosses
  } else if (menuButton.index==2 && page==4) {
    crossNum=3;//shellfish crosses
  } else if (menuButton.index==3 && page==4) {
    crossNum=4;//eggs crosses
  } else if (menuButton.index==0 && page==3) {
    highlightNum=1;//low carb highlights
  } else if (menuButton.index==1 && page==3) {
    highlightNum=2;//sugar free highlights
  } else if (menuButton.index==2 && page==3) {
    highlightNum=3;//high fat highlights
  } else if (menuButton.index==3 && page==3) {
    highlightNum=4;//plant based highlights
  }
}
