class button {

  float x;
  float y;
  int w;
  int h;
  float s;

  boolean over = false; // True when the mouse is over
  boolean pressed = false; // True when the mouse is over and pressed

  int index;

  button(int tempX, int tempY, int tempW, int tempH) {

    x=tempX;
    y=tempY;
    w=tempW;
    h=tempH;
  }

  button(int tempX, int tempY, int tempW, int tempH, int tempI) {

    x=tempX;
    y=tempY;
    w=tempW;
    h=tempH;
    index=tempI;

  }
  
  button(float tempX, float tempY, float tempS){
  
    x=tempX;
    y=tempY;
    s=tempS;
  }

  void display() {
     if (pressed==true){
    fill(0);
    }
    
    else if(over == true){
    fill(100);
    }
    else{
    fill(255);
    }
    rect(x, y, w, h);
}

  void roundDisplay() {
     if (pressed==true){
    fill(0);
    }
    
    else if(over == true){
    fill(100);
    }
    else{
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
  void update() {
    if ((mouseX >= x) && (mouseX <= x + w) &&
      (mouseY >= y) && (mouseY <= y + h)) {
      over = true;
    } else {
      over = false;
    }
  }
  
void roundUpdate(){

  if (sqrt(sq(x-mouseX) + sq (y-mouseY)) < s/2) {
    over = true;
  } else {
    over = false;
  }
  
}

  boolean press() {
    if (over == true) {
      pressed = true;
      return true;
    } else {
      pressed = false;
      return false;
    }
  }

  void release() {
    // Set to false when the mouse is released
    pressed = false;
  }
}
