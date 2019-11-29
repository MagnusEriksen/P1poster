PImage cheerios;
PImage placeholderDraw;
PImage infoPage; 
PImage highlight;
boolean page1;
boolean page2;
boolean page3;
boolean highlight1;
boolean highlight2;
button[] buttons = new button[10];
int button0_X;
int button0_Y;
int button0_Size;
int button1_X;
int button1_Y;
int button1_Size;
int menuButtonX;
int menuButtonY;
int menuButtonWidth;
int menuButtonHeight;
int start; 
int timer;
int timerValue=100000; //milliseconds before poster returns to the front page
void setup () {
  page3=true; //which page we start at (useful for testing individual pages code)
  cheerios=loadImage ("cheerios.png");
  placeholderDraw=loadImage("Dåse.jpg");
  infoPage=loadImage("hylde.png");
  highlight = loadImage("highlight.png");
  start=millis();//timer is started
  //setup for buttons
  button0_X=width/2;
  button0_Y=height/2;
  button0_Size=100;
  button1_X=width/3;
  button1_Y=height/3;
  button1_Size=100;
  menuButtonWidth=100;
  menuButtonHeight=50;
  menuButtonX=width-menuButtonWidth;
  menuButtonY=0;
  size (967, 725);
  buttons[0]= new button(button0_X, button0_Y, button0_Size);   
  buttons[1]= new button(button1_X, button1_Y, button1_Size);
  buttons[2]= new button(menuButtonX, menuButtonY, menuButtonWidth, menuButtonHeight);
  buttons[3] = new button(menuButtonX, menuButtonY+menuButtonHeight, menuButtonWidth, menuButtonHeight);
}

void draw() {


  if (page1 ==true) {//Front Page
    image(cheerios, 0, 0, width, height);
  } else if (page2==true) {
    image(placeholderDraw, 0, 0, width, height);
    buttons[0].create();
    buttons[1].create();
  } else if (page3 ==true) {
    image(infoPage, 0, 0, width, height);
    buttons[2].create();
    buttons[3].create();  
 if(highlight1==true){
   image(highlight,350,300,300,300);
 }else if (highlight2==true){
 image(highlight,540,-50,300,300);
 }
}

  //timer to return to front page when X seconds have passed
  if (page1==false) {
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
    if (mouseX>button0_X && mouseX<button0_X+button0_Size && mouseY>button0_Y && mouseY<button0_Y+button0_Size) { //button 0 clickable area
      page2=false; //leave page 2
      page1=true; //go to page 1
    }
    if (mouseX>button1_X && mouseX<button1_X+button1_Size && mouseY>button1_Y && mouseY<button1_Y+button1_Size) { //button 0 clickable area
      page2=false; //leave page 2
      page3=true; //go to page 3
    }
  }else if (page3==true){
 if (mouseX>menuButtonX && mouseX<menuButtonX+menuButtonWidth && mouseY>menuButtonY && mouseY<menuButtonY+menuButtonHeight){
 highlight1=true;
 highlight2=false;
 }else if(mouseX>menuButtonX && mouseX<menuButtonX+menuButtonWidth && mouseY>menuButtonY+menuButtonHeight && mouseY<menuButtonY+menuButtonHeight+menuButtonHeight){
 highlight1=false;
 highlight2=true;
 }

  }
}
