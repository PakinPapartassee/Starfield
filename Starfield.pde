class Particle
{
  double myX,myY,mySpeed,myAngle;
  float mySize;
  Particle()
  {
    myX = 300;
    myY = 300;
    myAngle = Math.random()*6*Math.PI;
    mySpeed = Math.random()*5;
    mySize = 10;
  }
  void move()
  {
    myX = myX + Math.cos(myAngle)*mySpeed;
    myY = myY + Math.sin(myAngle)*mySpeed;
  }
  void show()
  {
    noStroke();
    fill(myColor);
    ellipse((float)myX,(float)myY,mySize,mySize);
  }
}

class OddballParticle extends Particle
{
  OddballParticle()
  {
    myX = 300;
    myY = 600;
    myAngle = -Math.PI;
    mySpeed = 6;
    mySize = 25;
  }
  void move()
  {
    myY = myY - mySpeed;
  }
  void show()
  {
    noStroke();
    fill(myColor);
    stroke(255);
    ellipse((float)myX,(float)myY,mySize,mySize);
    fill(250,0,0);
  }
}

Particle[] fireworks;
int myColor;
void setup()
{
  size(600,600);
  fireworks = new Particle[400];
  for(int i = 0; i < fireworks.length; i++)
  {
    fireworks[i] = new Particle();
  }
  fireworks[0] = new OddballParticle();
  myColor = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
  
}
void draw()
{
  background(0);
  fireworks[0].show();
  fireworks[0].move();
  if(fireworks[0].myY <= 280)
  {
    fireworks[0].mySize = 0;
    for(int i = 0; i < fireworks.length; i++)
    {
      fireworks[i].show();
      fireworks[i].move();
      if(dist((float)fireworks[i].myX,(float)fireworks[i].myY,300,300) > 250)
      {
        fireworks[i].mySize -= 0.5;
        if(fireworks[i].mySize <= 0)
        {
          fireworks[i].mySize = 0;
        }
      }
    }
  }
}
void mousePressed()
{
  myColor = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
  for(int i = 0; i < fireworks.length; i++)
  {
    fireworks[i] = new Particle();
  }
  fireworks[0] = new OddballParticle();
}
