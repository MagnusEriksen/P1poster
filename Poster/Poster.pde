PImage cheerios;
PImage placeholderDraw;
PImage placeholderInfo;
boolean page1;
boolean page2;
boolean page3;
button[] buttons = new button[10];
int button0_X;
int button0_Y;
int button0_Size;
int button1_X;
int button1_Y;
int button1_Size;
int start; 
int timer;
int timerValue=10000; //milliseconds before poster returns to the front page
void setup () {

  cheerios=loadImage ("cheerios.png");
  placeholderDraw=loadImage("Dåse.jpg");
  placeholderInfo=loadImage("food highlight.png");
  start=millis();//timer is started
  //setup for buttons
  button0_X=width/2;
  button0_Y=height/2;
  button0_Size=100;
  button1_X=width/3;
  button1_Y=height/3;
  button1_Size=100;

  size (967, 725);
  page1=true;
  buttons[0]= new button(button0_X, button0_Y, button0_Size);   
  buttons[1]= new button(button1_X, button1_Y, button1_Size);
}

void draw() {


  if (page1 ==true) {//Front Page
    image(cheerios, 0, 0, width, height);
  } else if (page2==true) {
    image(placeholderDraw, 0, 0, width, height);
    buttons[0].create();
    buttons[1].create();
  } else if (page3 ==true) {
    image(placeholderInfo, 0, 0, width, height);
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
  }
}
