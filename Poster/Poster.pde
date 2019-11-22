PImage cheerios;
PImage placeholderDraw;
boolean page1;
boolean page2;
void setup (){

  cheerios=loadImage ("cheerios.png");
  placeholderDraw=loadImage("Dåse.jpg");
  size (967,725);
  page1=true;
  
  
}


void draw(){

if (page1 ==true){//Front Page
image(cheerios,0,0,width,height);
}
else if (page2==true){
  image(placeholderDraw,0,0,width,height);
}
  
}

//Test for ændring

void mousePressed(){
if (page1==true){
  page1=false;
  page2=true;
}

}
