//Menu Buttons in an array is inspired by Chrisir on proccessing forums

PImage cheerios;
PImage placeholderDraw;
PImage infoPage; 
PImage highlight;
PImage nutrition;
PImage allergies;
PImage gYogurt0;
PImage gYogurt2;
PImage vanilla0;
PImage vanilla1;
PFont TestText;
boolean page1, page2, page3, pageNutrition, pageAllergies;
boolean highlight0, highlight1, highlight2, highlight3;
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
int highlight0X, highlight0Y, highlight1X, highlight1Y;


void setup () {
  page3=true; //which page we start at (useful for testing individual pages code)
  cheerios=loadImage ("cheerios.png");
  placeholderDraw=loadImage("Dåse.jpg");
  infoPage=loadImage("hyldemenu.png");
  highlight = loadImage("highlight.png");
  TestText = loadFont("TestText.vlw");
  nutrition = loadImage("hyldenmenu.png");
  allergies = loadImage("hyldeamenu.png");
  gYogurt0 = loadImage("haandg.png");
  gYogurt2 = loadImage("infog.png");
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
  highlightSize=300;
  highlight0X=330;
  highlight0Y=255;
  highlight1X=720;
  highlight1Y=560;

  //non loop buttons
  buttons[0]= new button(button0_X, button0_Y, button0_Size, button1_Size);   
  buttons[1]= new button(button1_X, button1_Y, button1_Size, button1_Size);
  buttons[2]= new button(width-60, 40, 30, 30);
  roundButtons[0] = new button(highlight0X, highlight0Y, highlightSize/1.3);
  roundButtons[1] = new button(highlight1X, highlight1Y, highlightSize/1.3);

  //loop for menu buttons
  for (int i = 0; i < menuButtons.length; i++) {
    menuButtons[i] = new button(menuButtonX, menuButtonY+(i*spacing), menuButtonW, menuButtonH, i);
  }
}

void draw() {

  if (page1 ==true) {//Front Page
    image(cheerios, 0, 0, width, height);



    page2 = false;
    page3 = false;
    pageNutrition = false;
    pageAllergies = false;
  } else if (page2==true) {//page 2
    image(placeholderDraw, 0, 0, width, height);
    buttons[0].display();
    buttons[0].update();
    buttons[1].display();
    buttons[1].update();
  } else if (page3 ==true) {//page 3
    image(infoPage, 0, 0, width, height);
  } else if (pageNutrition==true) {
    image(nutrition, 0, 0, width, height);
    fill(255, 0, 0);
    buttons[2].display();
    buttons[2].update();
  } else if (pageAllergies==true) {
    image(allergies, 0, 0, width, height);
    fill(255, 0, 0);
    buttons[2].display();
    buttons[2].update();
  }

  if (page3 ==true||pageNutrition==true||pageAllergies==true) {
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
  if (highlight0==true) {
    fill(0);
    //roundbuttons display is only used to check location of buttons COMMENT OUT WHEN NOT NEEDED
    //roundButtons[0].roundDisplay();
    roundButtons[0].roundUpdate();
    vanillaPress=false;
    image(highlight, highlight0X, highlight0Y, highlightSize, highlightSize);
  } else if (highlight1==true) {
    image(highlight, highlight1X, highlight1Y, highlightSize, highlightSize);
    gYogurtPress=false;
  }
  imageMode(CORNER);//reset back to corner for background images

  //for when highlight buttons are pressed
  if (gYogurtPress==true) {

    fill(255);
    image (gYogurt0, 0, 0);
    image (gYogurt2, 0,0);
  }


  //timer to return to front page when X seconds have passed
  if (page1==false) {
    fill(255);
    textFont(TestText);
    timer=millis()-start;  
    int countdown = (timerValue - timer)/1000; //for visual countdown shown in whole seconds
    if (countdown<5) {
      text(countdown, width/2, 50);//placeholder text so we can see timer
    }
    if (timer>timerValue) {
      page1=true;
      start=millis();
    }
  }
  //for removing highlights and menus when not on correct page
    if (page3==false){
    highlight0=false;
    highlight1=false;
    highlight2=false;
    highlight3=false;
    gYogurtPress=false;
    vanillaPress=false;
  }
  if (pageNutrition==false){
  
  }
  if(pageAllergies==true){
  
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
    if (buttons[1].pressed==true) { //button 1 clickable area
      page2=false; //leave page 2
      page3=true; //go to page 3
    }
  }else if(page3==true&&pageNutrition==false&&pageAllergies==false){
  
        roundButtons[0].press();
      if (roundButtons[0].pressed==true) {
        gYogurtPress=true;
      }
      if (roundButtons[1].pressed==true) {
        vanillaPress=true;
      }
  }
  else if (pageNutrition==true) {
    buttons[2].press();
    if (buttons[2].pressed==true) {
      pageNutrition=false;
      page3=true;
    }
  } else if (pageAllergies==true) {
    buttons[2].press();
    if (buttons[2].pressed==true) {
      pageAllergies=false;
      page3=true;
    }
  }
  if (page3==true||pageNutrition==true||pageAllergies==true) {
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

}


/*function for calling elements in array and giving them different functions by checking the variable index which is 
 defined as the objects place in the array. This lets us specify individual highlights to individual buttons*/
void evalButton(button menuButton) {
  //println(menuButton.index);

  if (menuButton.index==0 && page3==true) {
    page3 = false;
    pageNutrition = true;

  } else if (menuButton.index==1 && page3==true) {
    highlight0=true;
    highlight1=false;
  } else if (menuButton.index==2 && page3==true) {
    highlight1=true;
    highlight0=false;
  } else if (menuButton.index==3 && page3==true) {
    page3 = false;
    pageAllergies = true;

  }
}
