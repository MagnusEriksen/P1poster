//Menu Buttons in an array is inspired by Chrisir on proccessing forums

PImage cheerios;
PImage placeholderDraw;
PImage infoPage; 
PImage highlight;
PFont TestText;
boolean page1;
boolean page2;
boolean page3;
boolean highlight1;
boolean highlight2;
button[] buttons = new button[10];
button[] menuButtons = new button[6];
int button0_X;
int button0_Y;
int button0_Size;
int button1_X;
int button1_Y;
int button1_Size;
int menuButtonX;
int menuButtonY;
int menuButtonW;
int menuButtonH;
int spacing;//spacing between menu buttons
int start; 
int timer;
int timerValue=10000; //milliseconds before poster returns to the front page
int highlightSize;
int highlight1X;
int highlight1Y;


void setup () {
  page1=true; //which page we start at (useful for testing individual pages code)
  cheerios=loadImage ("cheerios.png");
  placeholderDraw=loadImage("Dåse.jpg");
  infoPage=loadImage("hylde.png");
  highlight = loadImage("highlight.png");
  TestText = loadFont("TestText.vlw");
  start=millis();//timer is started
  //setup for buttons
  button0_X=width/2;
  button0_Y=height/2;
  button0_Size=100;
  button1_X=width/3;
  button1_Y=height/3;
  button1_Size=100;
  menuButtonW=100;
  menuButtonH=50;
  menuButtonX=width-menuButtonW;
  menuButtonY=45;
  spacing = 100;

  highlightSize=300;
  highlight1X=350;
  highlight1Y=300;

  size (967, 725);
  buttons[0]= new button(button0_X, button0_Y, button0_Size);   
  buttons[1]= new button(button1_X, button1_Y, button1_Size);



  //old menu buttons
  //buttons[2]= new button(menuButtonX, menuButtonY, menuButtonW, menuButtonH);
  //buttons[3] = new button(menuButtonX, menuButtonY+menuButtonH, menuButtonW, menuButtonH);

  //loop for menu buttons
  for (int i = 0; i < menuButtons.length; i++) {
    menuButtons[i] = new button(menuButtonX, i*spacing, menuButtonW, menuButtonH, i);
  }
}

void draw() {


  if (page1 ==true) {//Front Page
    image(cheerios, 0, 0, width, height);

    //so that highlights are removed when returning to front page
    highlight1=false;
    highlight2=false;
  } else if (page2==true) {
    image(placeholderDraw, 0, 0, width, height);
    buttons[0].create();
    buttons[0].update();
    buttons[1].create();
    buttons[1].update();
  } else if (page3 ==true) {
    image(infoPage, 0, 0, width, height);


    //old menu buttons code
    //buttons[2].create();
    //buttons[3].create();

    /*displaying menu buttons. The for loop allows us to iterate over each element in the menuButtons array 
     as the datatype (button class) has been defined as menuButton. This name is then assigned to each element in 
     the origional array with the loop. The create and update draws the functions in the page.
     */
    for (button menuButton : menuButtons) {
      menuButton.update();
      menuButton.create();
    }

    //textFont(TestText);
    fill(255, 0, 0);
    text("text", menuButtonX+5, menuButtonY);
    text("text2", menuButtonX+5, menuButtonY+spacing);
  }

  if (highlight1==true) {
    ellipseMode(CORNER);

    //test circle for visually seeing clickable area on highlight COMMENT OUT WHEN NOT NEEDED
    fill(0);
    circle(highlight1X*1.1, highlight1Y*1.1, highlightSize/1.3);

    image(highlight, highlight1X, highlight1Y, highlightSize, highlightSize);
  } else if (highlight2==true) {
    image(highlight, 540, -50, 300, 300);
  }

  //timer to return to front page when X seconds have passed
  if (page1==false) {
    fill(255);
    textFont(TestText);
    timer=millis()-start;  
    int countdown = (timerValue - timer)/1000; //for visual countdown shown in whole seconds
    text(countdown, width/2, height/2);//placeholder text so we can see timer
    if (timer>timerValue) {
      page1=true;
      page2=false;
      page3=false;
      start=millis();
    }
  }
}

void mousePressed() {

  start=millis();//reset timer when mouse if clicked

  if (page1==true) {
    page1=false;
    page2=true;
  } else if (page2==true) { 
    buttons[0].press();
    buttons[1].press();
    if (buttons[0].pressed==true) { //button 0 clickable area
      page2=false; //leave page 2
      page1=true; //go to page 1
    }
    if (buttons[1].pressed==true) { //button 0 clickable area
      page2=false; //leave page 2
      page3=true; //go to page 3
    }
  } else if (page3==true) {
  }
  /*Like the previouse code assigning menuButton to the array, this add the press functionality and combines it with
   an if statement which uses a custom function to identify which button is pressed*/
  for (button menuButton : menuButtons) {
    menuButton.press();
    if (menuButton.pressed==true) {
      evalButton(menuButton);
    }



    /* old code for menu buttons clickability, works but requires individual code for each button/ keeping code untill I get the array methode to work  
     if (mouseX>menuButtonX && mouseX<menuButtonX+menuButtonW && mouseY>menuButtonY && mouseY<menuButtonY+menuButtonH){
     highlight1=true;
     highlight2=false;
     }else if(mouseX>menuButtonX && mouseX<menuButtonX+menuButtonW && mouseY>menuButtonY+menuButtonH && mouseY<menuButtonY+menuButtonH+menuButtonH){
     highlight1=false;
     highlight2=true;
     }*/
  }
}

void mouseReleased() {
  for (button menuButton : menuButtons) {
    menuButton.release();
    buttons[0].release();
  }
}


/*function for calling elements in array and giving them different functions by checking the variable index which is 
 defined as the objects place in the array. This lets us specify individual highlights to individual buttons*/
void evalButton(button menuButton) {
  //println(menuButton.index);

  if (menuButton.index==0) {
    highlight1=true;
    highlight2=false;
  } else if (menuButton.index==1) {
    highlight2=true;
    highlight1=false;
  }
}
