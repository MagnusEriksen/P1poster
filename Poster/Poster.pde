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
boolean highlight1Press;
button[] buttons = new button[10];
button[] menuButtons = new button[4];
button[] roundButtons = new button[6];
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
  page3=true; //which page we start at (useful for testing individual pages code)
  cheerios=loadImage ("cheerios.png");
  placeholderDraw=loadImage("Dåse.jpg");
  infoPage=loadImage("hyldemenu.jpg");
  highlight = loadImage("highlight.png");
  TestText = loadFont("TestText.vlw");
  
  imageMode(CORNER);
  start=millis();//timer is started
  //setup for buttons
  button0_X=width/2;
  button0_Y=height/2;
  button0_Size=100;
  button1_X=width/3;
  button1_Y=height/3;
  button1_Size=100;
  menuButtonW=245;
  menuButtonH=122;
  menuButtonX=width-menuButtonW-55;
  menuButtonY=73;
  spacing = menuButtonH+70;

  highlightSize=300;
  highlight1X=500;
  highlight1Y=450;

  size (1200, 800);
  buttons[0]= new button(button0_X, button0_Y, button0_Size, button1_Size);   
  buttons[1]= new button(button1_X, button1_Y, button1_Size, button1_Size);
  roundButtons[0] = new button(highlight1X, highlight1Y, highlightSize/1.3);



  //old menu buttons
  //buttons[2]= new button(menuButtonX, menuButtonY, menuButtonW, menuButtonH);
  //buttons[3] = new button(menuButtonX, menuButtonY+menuButtonH, menuButtonW, menuButtonH);

  //loop for menu buttons
  for (int i = 0; i < menuButtons.length; i++) {
    menuButtons[i] = new button(menuButtonX, menuButtonY+(i*spacing), menuButtonW, menuButtonH, i);
  }


}

void draw() {


  if (page1 ==true) {//Front Page
    image(cheerios, 0, 0, width, height);

    //so that highlights are removed when returning to front page
    highlight1=false;
    highlight2=false;
    highlight1Press=false;
    
  } else if (page2==true) {
    image(placeholderDraw, 0, 0, width, height);
    buttons[0].display();
    buttons[0].update();
    buttons[1].display();
    buttons[1].update();
  } else if (page3 ==true) {
    image(infoPage, 0, 0, width, height);


    //old menu buttons code
    //buttons[2].display();
    //buttons[3].display();

    /*displaying menu buttons. The for loop allows us to iterate over each element in the menuButtons array 
     as the datatype (button class) has been defined as menuButton. This name is then assigned to each element in 
     the origional array with the loop. The display and update draws the functions in the page.
     */
    for (button menuButton : menuButtons) {
      menuButton.update();
      menuButton.transDisplay();
    }

    //textFont(TestText);
    fill(255, 0, 0);
    text("text", menuButtonX+5, menuButtonY);
    text("text2", menuButtonX+5, menuButtonY+spacing);
  }
imageMode(CENTER);//set image to center for highlights
  if (highlight1==true) {

    fill(0);
    
    //roundbuttons display is only used to check location of buttons COMMENT OUT WHEN NOT NEEDED
    roundButtons[0].roundDisplay();
    roundButtons[0].roundUpdate();
    image(highlight, highlight1X, highlight1Y, highlightSize, highlightSize);
  } else if (highlight2==true) {
    image(highlight, 690, 100, 300, 300);
  }

  imageMode(CORNER);//reset back to corner for background images
  if (highlight1Press==true){
  
  fill(255);
  rect (600,300,100,300);
  
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

roundButtons[0].press();

    if (roundButtons[0].pressed==true){
    highlight1Press=true;
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
    buttons[1].release();
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
