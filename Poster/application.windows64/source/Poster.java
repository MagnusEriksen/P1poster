import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Poster extends PApplet {

//Menu Buttons in an array is inspired by Chrisir on proccessing forums

PImage cheerios;
PImage placeholderDraw;
PImage infoPage; 
PImage highlight;
PFont TestText;
boolean page1, page2, page3;
boolean highlight1, highlight2;
boolean highlight1Press;
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
int highlight1X, highlight1Y;


public void setup () {
  page1=true; //which page we start at (useful for testing individual pages code)
  cheerios=loadImage ("cheerios.png");
  placeholderDraw=loadImage("Dåse.jpg");
  infoPage=loadImage("hyldemenu.png");
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

  //setup for highlights
  highlightSize=300;
  highlight1X=500;
  highlight1Y=450;

  //non loop buttons
  buttons[0]= new button(button0_X, button0_Y, button0_Size, button1_Size);   
  buttons[1]= new button(button1_X, button1_Y, button1_Size, button1_Size);
  roundButtons[0] = new button(highlight1X, highlight1Y, highlightSize/1.3f);

  //old menu buttons
  //buttons[2]= new button(menuButtonX, menuButtonY, menuButtonW, menuButtonH);
  //buttons[3] = new button(menuButtonX, menuButtonY+menuButtonH, menuButtonW, menuButtonH);

  //loop for menu buttons
  for (int i = 0; i < menuButtons.length; i++) {
    menuButtons[i] = new button(menuButtonX, menuButtonY+(i*spacing), menuButtonW, menuButtonH, i);
  }
}

public void draw() {


  if (page1 ==true) {//Front Page
    image(cheerios, 0, 0, width, height);

    //so that highlights are removed when returning to front page
    highlight1=false;
    highlight2=false;
    highlight1Press=false;
  
} else if (page2==true) {//page 2
    image(placeholderDraw, 0, 0, width, height);
    buttons[0].display();
    buttons[0].update();
    buttons[1].display();
    buttons[1].update();
  
} else if (page3 ==true) {//page 3
    image(infoPage, 0, 0, width, height);


    //old menu buttons code
    //buttons[2].display();
    //buttons[3].display();

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
  if (highlight1==true) {

    fill(0);

    //roundbuttons display is only used to check location of buttons COMMENT OUT WHEN NOT NEEDED
    roundButtons[0].roundDisplay();
    roundButtons[0].roundUpdate();
    image(highlight, highlight1X, highlight1Y, highlightSize, highlightSize);
  } else if (highlight2==true) {
    image(highlight, 690, 100, 300, 300);
    highlight1Press=false;  
}

  imageMode(CORNER);//reset back to corner for background images
  
  //for when highlight buttons are pressed
  if (highlight1Press==true) {

    fill(255);
    rect (600, 300, 100, 300);
  }


  //timer to return to front page when X seconds have passed
  if (page1==false) {
    fill(255);
    textFont(TestText);
    timer=millis()-start;  
    int countdown = (timerValue - timer)/1000; //for visual countdown shown in whole seconds
    if(countdown<5){
    text(countdown, width/2, 50);//placeholder text so we can see timer
    }
    if (timer>timerValue) {
      page1=true;
      page2=false;
      page3=false;
      start=millis();
    }
  }
}

public void mousePressed() {

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

    /*Like the previouse code assigning menuButton to the array, this add the press functionality and combines it with
     an if statement which uses a custom function to identify which button is pressed*/
    for (button menuButton : menuButtons) {
      menuButton.press();
      if (menuButton.pressed==true) {
        evalButton(menuButton);
      }

      roundButtons[0].press();
      if (roundButtons[0].pressed==true) {
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
}

//so that buttons do not keep the on button press color when they are not pressed
public void mouseReleased() {
  for (button menuButton : menuButtons) {
    menuButton.release();
    buttons[0].release();
    buttons[1].release();
  }
}


/*function for calling elements in array and giving them different functions by checking the variable index which is 
 defined as the objects place in the array. This lets us specify individual highlights to individual buttons*/
public void evalButton(button menuButton) {
  //println(menuButton.index);

  if (menuButton.index==0) {
    highlight1=true;
    highlight2=false;
  } else if (menuButton.index==1) {
    highlight2=true;
    highlight1=false;
  }
}
class button {

  float x;
  float y;
  int w;
  int h;
  float s;

  boolean over = false; // True when the mouse is over
  boolean pressed = false; // True when the mouse is over and pressed

  int index; //variable for storing array buttons index value

  button(int tempX, int tempY, int tempW, int tempH) { //non array button constructer

    x=tempX;
    y=tempY;
    w=tempW;
    h=tempH;
  }

  button(int tempX, int tempY, int tempW, int tempH, int tempI) { //array button constructer - int tempI should be array size

    x=tempX;
    y=tempY;
    w=tempW;
    h=tempH;
    index=tempI;
  }

  button(float tempX, float tempY, float tempS) { //circular button constructer

    x=tempX;
    y=tempY;
    s=tempS;
  }

  public void display() { //normal buttons
    if (pressed==true) {
      fill(0);
    } else if (over == true) {
      fill(100);
    } else {
      fill(255);
    }
    rect(x, y, w, h);
  }

  public void transDisplay() { //for transparent buttons
    noStroke();    
    if (pressed==true) {
      fill(0, 100);
    } else if (over == true) {
      fill(100, 100);
    } else {

      fill(255, 0);
    }

    rect(x, y, w, h);
    stroke(5);
  }

  public void roundDisplay() { //circular buttons
    if (pressed==true) {
      fill(0);
    } else if (over == true) {
      fill(100);
    } else {
      fill(255);
    }
    circle(x, y, s);
  }

  /* old code for mouse location detection
   void click(int mx, int my) {
   // Check to see if a point is inside the rectangle
   if (mx > x && mx < x + w && my > y && my < y + h) {
   on = true;
   }
   }*/

  // Updates the over field every frame
  public void update() {//for rectangular area
    if ((mouseX >= x) && (mouseX <= x + w) &&
      (mouseY >= y) && (mouseY <= y + h)) {
      over = true;
    } else {
      over = false;
    }
  }

  public void roundUpdate() {//for circular area

    if (sqrt(sq(x-mouseX) + sq (y-mouseY)) < s/2) {
      over = true;
    } else {
      over = false;
    }
  }

  public boolean press() { //boolean for when the mouse button is pressed and over update area
    if (over == true) {
      pressed = true;
      return true;
    } else {
      pressed = false;
      return false;
    }
  }

  public void release() {
    // Set to false when the mouse is released
    pressed = false;
  }
}
  public void settings() {  size (1503, 622); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--hide-stop", "Poster" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
