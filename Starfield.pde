Particle[] parts = new Particle[100];
Particle[] parts2 = new Particle[100];
Mover[] dots;
Lighter a;
float x, y;
float easing = 0.1;
boolean started = false;
color c = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
void setup()
{
  size(700,700);
  stroke(5);
  smooth();
  background(10);
  frameRate(60);
  dots = new Mover[150];
  parts = new Particle[100];
  for (int i = 0; i < parts.length; i++)
  {
     parts[i] = new Particle();
     parts[i].setX(mouseX);
     parts[i].setX(mouseY);
     parts[0] = new oddParticle();
  }
  for(int i = 0; i < dots.length;i++)
  {
    dots[i] = new Mover();
  }
}

void mousePressed()
{
  for (int i = 0; i < parts.length; i++)
  {
     //parts2[i] = new Particle(color(c),mouseX,mouseY);  
     parts2[i] = new Particle();
     parts2[0] = new oddParticle();
  }
  
  background(10);
  if (!started) { 
  started = true;
  loop();
  redraw();
  }
  else {
   started = false;
   background(10);
   redraw();
  }
}

void draw()
{
  
  background(10);
  float targetX = mouseX;
  float newX = targetX - x;
  x += newX * easing;
  
  float targetY = mouseY;
  float newY = targetY - y;
  y += newY * easing;
  
  a = new Lighter(x,y);
  
  for(int i = 0; i < dots.length;i++)
  {
    dots[i].show();
    dots[i].move();
  }
  
  
 if (!started) {
    a.walk();
    a.show2();
  } else {
    a.walk();
    a.show3();
    for (int i = 0; i < parts2.length; i++)
    {
     parts2[i].show(); 
     parts2[i].move();
    }
  }
  
  
}

class Particle
{ 
  double myX,myY,mySpeed,myAngle;
  int myColor;

  Particle()
  {
    myX = mouseX;
    myY = mouseY;
    myAngle = Math.random()*2*Math.PI;
    mySpeed = Math.random()*5;
    myColor = color(c);
  }
  
  public void setX(double x){ myX = x; }
  public void setY(double y){ myY = y; }
  public void setAngle(double angle){ myAngle = angle; }
  public void setSpeed(double speed){ mySpeed = speed; }
  public void setColor(int x, int y, int z){ myColor = color(x,y,z); }
  
  public double getX(){ return myX; }
  public double getY(){ return myY; }
  public double getAngle(){ return myAngle; }
  public double getSpeed(){ return mySpeed; }
  
  void move()
  {
    myX+=Math.cos(myAngle)*mySpeed;
    myY+=Math.sin(myAngle)*mySpeed;
  }
  
  void show()
  {
    noStroke();
    fill(myColor);
    ellipse((float)myX,(float)myY,10,10);
  }
  
}

class oddParticle extends Particle
{ 
  void move()
  {
    myX+=Math.cos(myAngle)*(6);
    myY+=Math.sin(myAngle)*(6);
  }
  
  void show()
  {
    noStroke();
    fill(84, 49, 0);
    triangle((float)myX,(float)myY,(float)myX-10,(float)myY+15,(float)myX+10,(float)myY+15);
    fill(235);
    rect((float)myX-6,(float)myY+15,12,20);
    fill(255,0,0);
      rect((float)myX-6,(float)myY+16,6,3);
    rect((float)myX,(float)myY+14,6,3);
    rect((float)myX-6,(float)myY+24,6,3);
    rect((float)myX,(float)myY+22,6,3);
    rect((float)myX-6,(float)myY+32,6,3);
    rect((float)myX,(float)myY+30,6,3);
    fill(100);
    rect((float)myX-1,(float)myY+35,2,4);
    rect((float)myX-1,(float)myY+39,4,2);
  }
}

class Lighter
{
  float myX, myY;
  Lighter(float x, float y)
 {
    myX = x;
    myY = y;
  }
  void show2()
 {       
     noStroke();
     fill(236,183,112);
     triangle(myX,myY,myX-2,myY+5,myX+2,myY+5);
     ellipse(myX,myY+5,4,4);
     strokeWeight(1);
     stroke(96,46,32);
     fill(205);
     ellipse(myX+3,myY+9,5,3);
     rect(myX-2,myY+9,5,3);
     fill(217,74,78);
     rect(myX+2,myY+10,4,2);
     fill(110,120,194);
     rect(myX-2,myY+12,8,20);
}
  void show3()
 {       
     noStroke();
     fill(236,183,112);
     strokeWeight(1);
     stroke(96,46,32);
     fill(205);
     ellipse(myX+3,myY+9,5,3);
     rect(myX-2,myY+9,5,3);
     fill(217,74,78);
     rect(myX+2,myY+10,4,2);
     fill(110,120,194);
     rect(myX-2,myY+12,8,20);
  }
  void walk()
  {
    myX = myX + (int)(Math.random()*3)-1;
    myY = myY + (int)(Math.random()*3)-1;
  }
}

class Mover {
  float x, y;
 Mover() {
  x = (int)(Math.random()*750);
  y = (int)(Math.random()*750);
 }
 void move(){
  x = (int)(Math.random()*750);
  y = (int)(Math.random()*750);
 }
 void show(){
  strokeWeight(0);
  fill((int)(Math.random()*256));
  ellipse(x,y,1,1);
 }
  void hide(){
  strokeWeight(1);
  fill(10);
  ellipse(x,y,9999,9999);
 }
}
