//place holder for button
class button{

float x;
float y;
int bWidth;
int bHeight;

button(int tempX, int tempY, int tempSize){

x=tempX;
y=tempY;
bWidth=tempSize;
bHeight=tempSize;
}

button(int tempX, int tempY, int tempWidth, int tempHeight){

x=tempX;
y=tempY;
bWidth=tempWidth;
bHeight=tempHeight;
}

void create(){
fill(255);
rect(x,y,bWidth, bHeight);

}

}
