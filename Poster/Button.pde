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

  void display() { //normal buttons
    if (pressed==true) {
      fill(0);
    } else if (over == true) {
      fill(155,0,0,155);
    } else {
      fill(255,0,0);
    }
    rect(x, y, w, h);
  }

  void transDisplay() { //for transparent buttons
    noStroke();    
    if (pressed==true) {
      fill(0, 100);
    } else if (over == true) {
      fill(255, 100);
    } else {

      fill(255, 0);
    }

    rect(x, y, w, h);
    stroke(5);
  }

  void roundDisplay() { //circular buttons
    if (pressed==true) {
      fill(0);
    } else if (over == true) {
      fill(100);
    } else {
      fill(255,150);
    }
    circle(x, y, s);
  }
  // Updates the over field every frame
  void update() {//for corner rectangular area (default)
    if ((mouseX >= x) && (mouseX <= x + w) &&
      (mouseY >= y) && (mouseY <= y + h)) {
      over = true;
    } else {
      over = false;
    }
  }
  
  void centerUpdate(){//for center mode rectangle area
  
    if((mouseX>=x-(w/2))&&(mouseX<=x+(w/2))&&
  (mouseY >= y-(h/2)) && (mouseY <= y + (h/2))){
     over = true;
  }else {
      over = false;
    }
  }

  void roundUpdate() {//for circular area

    if (sqrt(sq(x-mouseX) + sq (y-mouseY)) < s/2) {
      over = true;
    } else {
      over = false;
    }
  }

  boolean press() { //boolean for when the mouse button is pressed and over update area
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
