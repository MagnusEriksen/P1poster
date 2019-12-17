class button {
  float x;
  float y;
  int w;
  int h;
  float s;
  boolean over = false; // True when the mouse is over
  boolean pressed = false; // True when the mouse is over and pressed
  int index; //variable for storing array buttons index value

  button(int tempX, int tempY, int tempW, int tempH) { //rectangular button constructer
    x=tempX;
    y=tempY;
    w=tempW;
    h=tempH;
  }
  button(int tempX, int tempY, int tempW, int tempH, int tempI) { //button rectangular constructer for looped array buttons - int tempI should be array size
    x=tempX;
    y=tempY;
    w=tempW;
    h=tempH;
    index=tempI;
  }
  void display() { //normal buttons
    if (pressed==true) {
      fill(0);//black when pressed
    } else if (over == true) {
      fill(155, 0, 0);//darker red when mouse is over
    } else {
      fill(255, 0, 0);//bright red normally
    }
    rect(x, y, w, h);
  }
  void testDisplay() { //for testing location of invisible buttons
    if (over == true) {
      fill(255, 100);//more transparent when mouse if over if better visiblity is needed
    } else {
      fill(255, 200);//transparent white so background is visible behind buttons
    }
    rect(x, y, w, h);
  }
  void transDisplay() { //for transparent buttons
    noStroke();//removes stroke for  invisible buttons
    if (pressed==true) {
      fill(0, 100);//buttons become transparent black when pressed
    } else if (over == true) {
      fill(255, 100);//buttons become a transparent white when mouse is over
    } else {
      fill(255, 0);//so that the buttons are invisible when neither pressed or mouse is over
    }
    rect(x, y, w, h);
    stroke(5);
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
  void centerUpdate() {//for center mode rectangle area
    if ((mouseX>=x-(w/2))&&(mouseX<=x+(w/2))&&
      (mouseY >= y-(h/2)) && (mouseY <= y + (h/2))) {
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

  /*
  //old code for circular buttons that are ultimately not used in current build
   button(float tempX, float tempY, float tempS) { //circular button constructer
   x=tempX;
   y=tempY;
   s=tempS;
   }
   void roundDisplay() { //circular buttons
   if (pressed==true) {
   fill(0);
   } else if (over == true) {
   fill(100);
   } else {
   fill(255, 150);
   }
   circle(x, y, s);
   }
   void roundUpdate() {//for circular area
   if (sqrt(sq(x-mouseX) + sq(y-mouseY)) < s/2) {
   over = true;
   } else {
   over = false;
   }
   }
   */
}
