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
boolean gYogurtPress, vanillaPress, doughnutPress, milkPress;
button[] buttons = new button[10];
button[] menuButtons = new button[4];
button[] roundButtons = new button[6];
int button0_X, button0_Y, button0_Size;
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


void setup () {
  frameRate(30);
  page=0; //which page we start at (useful for testing individual pages code)
  Eyecatcher=new Movie (this, "standby screen.mp4");
  Eyecatcher.loop();
  infoBackGround=loadImage("inter.png");
  infoPage=loadImage("hyldemenu.png");
  highlight = loadImage("highlight.png");
  cross = loadImage("kryds.png");
  TestText = loadFont("TestText.vlw");
  nutrition = loadImage("hyldenmenu.png");
  allergies = loadImage("hyldeamenu.png");
  gYogurt0 = loadImage("haandg.png");
  gYogurt1 = loadImage("infog.png");
  vanilla0= loadImage("haandvi.png");
  vanilla1= loadImage("hyldevi.png");
  doughnut0=loadImage("doughh.png");
  doughnut1=loadImage("doughi.png");
  cMilk0=loadImage("chocoh.png");
  cMilk1=loadImage("chocoi.png");
  imageMode(CORNER);
  size (1503, 622);
  start=millis();//timer is started

  //setup for buttons
  button0_X=width/2; 
  button0_Y=height/2;
  button0_Size=100;
  button1_X=5;
  button1_Y=height-25;
  button1_Size=20;
  menuButtonW=308;
  menuButtonH=95;
  menuButtonX=width-menuButtonW-65;
  menuButtonY=38;
  spacing = menuButtonH+55;

  //setup for highlights
  crossSize = 150;
  highlightSize=300;
  highlight0X=330;
  highlight0Y=255;
  highlight1X=950;
  highlight1Y=560;
  highlight2X=555;
  highlight2Y=400;
  highlight3X=150;
  highlight3Y=410;
  cross0X=150;
  cross0Y=250;
  cross1X=940;
  cross1Y=250;
  cross2X=505;
  cross2Y=250;
  cross3X=230;
  cross3Y=90;

  //non loop buttons
  buttons[0]= new button(button0_X, button0_Y, button0_Size, button1_Size);   
  buttons[1]= new button(button1_X, button1_Y, button1_Size, button1_Size);
  buttons[2]= new button(width-60, 40, 30, 30);
  roundButtons[0] = new button(highlight0X, highlight0Y, highlightSize/1.3);
  roundButtons[1] = new button(highlight1X, highlight1Y, highlightSize/1.3);
  roundButtons[2] = new button(highlight2X, highlight2Y, highlightSize/1.3);
  roundButtons[3] = new button(highlight3X, highlight3Y, highlightSize/1.3);

  //loop for menu buttons
  for (int i = 0; i < menuButtons.length; i++) {
    menuButtons[i] = new button(menuButtonX, menuButtonY+(i*spacing), menuButtonW, menuButtonH, i);
  }
}

void movieEvent(Movie m) {
  m.read();
}

void draw() {
println(vanillaPress);
  if (page==0) {//Front Page
    image(Eyecatcher, 0, 0, width, height);
    crossNum=0; //removes crosses
    highlightNum=0; //removes highlights
    //removes picture
    gYogurtPress=false; 
    vanillaPress=false;
    doughnutPress=false;
    milkPress=false;
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
    image(cross, width-60, 40, 30, 30);
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
  }

  imageMode(CENTER);//set image to center for highlights
  //which highlights appear when menu buttons are pressed
  if (highlightNum==1) {
    fill(0);
    //roundbuttons display is only used to check location of buttons COMMENT OUT WHEN NOT NEEDED
    //roundButtons[0].roundDisplay();
    roundButtons[0].roundUpdate();
    doughnutPress=false;
    image(highlight, highlight0X, highlight0Y, highlightSize, highlightSize);
  } else if (highlightNum==2) {
    image(highlight, highlight1X, highlight1Y, highlightSize, highlightSize);
    //roundButtons[1].roundDisplay();
    roundButtons[1].roundUpdate();
  } else if (highlightNum==3) {
    //roundButtons[2].roundDisplay();
    roundButtons[2].roundUpdate();
    image(highlight, highlight2X, highlight2Y, highlightSize, highlightSize);
  } else if (highlightNum==4) {
    //roundButtons[3].roundDisplay();
    roundButtons[3].roundUpdate();
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

  //for when highlight buttons are pressed
  if (gYogurtPress==true) {

    image (gYogurt0, 0, 0);
    image (gYogurt1, 0, 0);
  } else if (vanillaPress==true) {
    image (vanilla0, 0, 0);
    image (vanilla1, 0, 0);
  } else if (doughnutPress==true) {
    image(doughnut0, 0, 0);
    image(doughnut1, 0, 0);
  } else if (milkPress==true) {
    image(cMilk0, 0, 0);
    image(cMilk1, 0, 0);
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
  gYogurtPress=false;
  vanillaPress=false;
  milkPress=false;
  doughnutPress=false;
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
    roundButtons[0].press();
    if (roundButtons[0].pressed==true) {
      gYogurtPress=true;
    }
    roundButtons[1].press();
    if (roundButtons[1].pressed==true) {
      doughnutPress=true;
    }
  } else if (page==3) {
    roundButtons[1].press();
    if (roundButtons[1].pressed==true) {
      doughnutPress=true;
    }
    roundButtons[2].press();
    if (roundButtons[2].pressed==true) {
      vanillaPress=true;
    }
    roundButtons[3].press();
    if (roundButtons[3].pressed==true) {
      milkPress=true;
    }
  }
  if (page==3||page==4) {
    buttons[2].press();
    if (buttons[2].pressed==true) {
      page=2;
      highlightNum=0;
      vanillaPress=false;
      doughnutPress=false;
      milkPress=false;
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
  roundButtons[2].release();
}


/*function for calling elements in array and giving them different functions by checking the variable index which is 
 defined as the objects place in the array. This lets us specify individual highlights to individual buttons*/
void evalButton(button menuButton) {
  //println(menuButton.index);
  if (menuButton.index==0 && page==2) {
    page=3;
    highlightNum=0;
    gYogurtPress=false;
    doughnutPress=false;
  } else if (menuButton.index==1 && page==2) {
    highlightNum=1;
    doughnutPress=false;
  } else if (menuButton.index==2 && page==2) {
    highlightNum=2;
    gYogurtPress=false;
  } else if (menuButton.index==3 && page==2) {
    page=4;
    highlightNum=0;
    gYogurtPress=false;
    doughnutPress=false;
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
    vanillaPress=false;
    doughnutPress=false;
    milkPress=false;
  } else if (menuButton.index==1 && page==3) {
    highlightNum=4;
    vanillaPress=false;
    doughnutPress=false;
  } else if (menuButton.index==2 && page==3) {
    highlightNum=3;
    doughnutPress=false;
    milkPress=false;
  } else if (menuButton.index==3 && page==3) {
    highlightNum=2;
    vanillaPress=false;
    doughnutPress=false;
    milkPress=false;
  }
}
