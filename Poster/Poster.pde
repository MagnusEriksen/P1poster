PImage cheerios;
PImage placeholderDraw;
boolean page1;
boolean page2;
button[] buttons = new button[10];
int button0_X;
int button0_Y;
int button0_Size;
float start, timer;

void setup (){

  cheerios=loadImage ("cheerios.png");
  placeholderDraw=loadImage("Dåse.jpg");
  start=second();
  //setup for buttons
  button0_X=width/2;
  button0_Y=height/2;
  button0_Size=100;

  size (967,725);
  page1=true;
  buttons[0]= new button(button0_X,button0_Y,button0_Size);   

}

void draw(){

  
if (page1 ==true){//Front Page
image(cheerios,0,0,width,height);
}
else if (page2==true){
  image(placeholderDraw,0,0,width,height);
  buttons[0].create();
}

//timer to return to front page when X seconds have passed
if(page1==false){
timer=second()-start;  
text(timer, width/2, height/2);//placeholder text so we can see timer
if(timer==10){
page1=true;
page2=false;
start=second();
}
}
}


void mousePressed(){

  start=second();//reset timer when mouse if clicked
  
  if (page1==true){
  page1=false;
  page2=true;
}
else if (page2==true){
  if (mouseX>button0_X && mouseX<button0_X+button0_Size && mouseY>button0_Y && mouseY<button0_Y+button0_Size) { //button 0 clickable area
      page2=false; //leave page 2
      page1=true; //go to page 1
  
}

}
}
