//Menu Buttons in an array is inspired by Chrisir on proccessing forums

PImage cheerios;
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
PFont TestText;
int page;
int crossNum;
int highlightNum;
boolean gYogurtPress, vanillaPress;
button[] buttons = new button[10];
button[] menuButtons = new button[4];
button[] roundButtons = new button[6];
int button0_X, button0_Y, button0_Size;
int button1_X, button1_Y, button1_Size;
int menuButtonX, menuButtonY, menuButtonW, menuButtonH;
int spacing;//spacing between menu buttons
int start; 
int timer;
int timerValue=10000; //milliseconds before poster returns to the front page
int highlightSize;
int crossSize;
int highlight0X, highlight0Y, highlight1X, highlight1Y, highlight2X, highlight2Y;


void setup () {
  page=2; //which page we start at (useful for testing individual pages code)
  cheerios=loadImage ("cheerios.png");
  infoBackGround=loadImage("hylde.png");
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
  imageMode(CORNER);
  size (1503, 622);
  start=millis();//timer is started

  //setup for buttons
  button0_X=width/2; 
  button0_Y=height/2;
  button0_Size=100;
  button1_X=width/3;
  button1_Y=height/3;
  button1_Size=100;
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
  highlight1X=720;
  highlight1Y=560;
  highlight2X=555;
  highlight2Y=400;

  //non loop buttons
  buttons[0]= new button(button0_X, button0_Y, button0_Size, button1_Size);   
  buttons[1]= new button(button1_X, button1_Y, button1_Size, button1_Size);
  buttons[2]= new button(width-60, 40, 30, 30);
  roundButtons[0] = new button(highlight0X, highlight0Y, highlightSize/1.3);
  roundButtons[1] = new button(highlight1X, highlight1Y, highlightSize/1.3);
  roundButtons[2] = new button(highlight2X, highlight2Y, highlightSize/1.3);

  //loop for menu buttons
  for (int i = 0; i < menuButtons.length; i++) {
    menuButtons[i] = new button(menuButtonX, menuButtonY+(i*spacing), menuButtonW, menuButtonH, i);
  }
}

void draw() {
  
  if (page==0) {//Front Page
    image(cheerios, 0, 0, width, height);
    crossNum=0;
    highlightNum=0;
    gYogurtPress=false;
    vanillaPress=false;
   
  } else if (page==1) {//page 2
    image(infoBackGround, 0, 0, width, height);
    /*buttons[0].display();
    buttons[0].update();
    buttons[1].display();
    buttons[1].update();*/
  } else if (page==2) {//page 3
    image(infoPage, 0, 0, width, height);
  } else if (page==3) {
    image(nutrition, 0, 0, width, height);
  } else if (page==4) {
    image(allergies, 0, 0, width, height);
  }

  if (page==3||page==4) {
    fill(255, 0, 0);
    buttons[2].display();
    buttons[2].update();
  }

  if (page==2||page==3||page==4) {
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
    image(highlight, highlight0X, highlight0Y, highlightSize, highlightSize);
  } else if (highlightNum==2) {
    image(highlight, highlight1X, highlight1Y, highlightSize, highlightSize);
    gYogurtPress=false;
  } else if (highlightNum==3) {
    //roundButtons[2].roundDisplay();
    roundButtons[2].roundUpdate();
    image(highlight, highlight2X, highlight2Y, highlightSize, highlightSize);
  }else if (crossNum==1){
  image(cross, highlight1X, highlight1Y, crossSize, crossSize);
  image(cross, 150, 250, crossSize, crossSize);
  }else if (crossNum==2){
  image(cross, 940, 250, crossSize, crossSize);
  }else if (crossNum==3){
  image(cross, 505, 250, crossSize, crossSize);
  }else if (crossNum==4){
  image(cross, highlight2X, highlight2Y, crossSize, crossSize);
  image(cross, 230, 90, crossSize, crossSize);
  }
  imageMode(CORNER);//reset back to corner for background images

  //for when highlight buttons are pressed
  if (gYogurtPress==true) {


    image (gYogurt0, 0, 0);
    image (gYogurt1, 0, 0);
  }
  if (vanillaPress==true) {
    image (vanilla0, 0, 0);
    image (vanilla1, 0, 0);
  }


  //timer to return to front page when X seconds have passed
  if (page!=0) { // != inequality
    fill(255);
    textFont(TestText);
    timer=millis()-start;  
    int countdown = (timerValue - timer)/1000; //for visual countdown shown in whole seconds
    if (countdown<5) {
      text(countdown, width/2, 50);//placeholder text so we can see timer
    }
    if (timer>timerValue) {
      page=0;
      start=millis();
    }
  }
}

void mousePressed() {

  start=millis();//reset timer when mouse if clicked

  if (page==0) {
    page=1;
  } else if (page==1) { 
    /*buttons[0].press();
    buttons[1].press();
    if (buttons[0].pressed==true) { //button 0 clickable area
      page=0;
    }
    if (buttons[1].pressed==true) { //button 1 clickable area
      page=2;
    }*/
    page=2;
  } else if (page==2) {

    roundButtons[0].press();
    if (roundButtons[0].pressed==true) {
      gYogurtPress=true;
    }
  } else if (page==3||page==4) {
    buttons[2].press();
    if (buttons[2].pressed==true) {
      page=2;
      highlightNum=0;
      vanillaPress=false;
      crossNum=0;
    }
        roundButtons[2].press();
    if (roundButtons[2].pressed==true) {
      vanillaPress=true;
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
  } else if (menuButton.index==1 && page==2) {
    highlightNum=1;
  } else if (menuButton.index==2 && page==2) {
    highlightNum=2;
    gYogurtPress=false;
  } else if (menuButton.index==3 && page==2) {
    page=4;
    highlightNum=0;
    gYogurtPress=false;
  } else if (menuButton.index==0 && page==4) {
    crossNum=1;
  }else if (menuButton.index==1 && page==4) {
    crossNum=2;
  }else if (menuButton.index==2 && page==4) {
    crossNum=3;
  }else if (menuButton.index==3 && page==4) {
    crossNum=4;
  } else if (menuButton.index==2 && page==3) {
    highlightNum=3;
  }
}
