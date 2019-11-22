//place holder for button
class button{

float x;
float y;
int size;

button(float tempX, float tempY, int tempSize){

x=tempX;
y=tempY;
size=tempSize;

}
  
void create(){
fill(255);
rect(x,y,size,size);

}

}
