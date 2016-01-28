class Sprites extends GameObject
{
  PImage GreenRun1;
  PImage GreenStand;
  PImage stillImage;
  PImage activeImage;
  Sprites()
  {
  }
  
  void imageInit()
  {
    GreenStand = loadImage("StandStillGeen.png");
    GreenRun1 = loadImage("Run1Green.png");
  }
  void update(char left,char right)
  {
    if(keyPressed)
    {
      if (key == left)
      {
        xPlayer -= xSpeed;
        pushMatrix();
        scale(-1.0, 1.0);
        image(activeImage, -xPlayer-70, 410);
        popMatrix();
      }
      if (key == right)
      {
        xPlayer += xSpeed;
        pushMatrix();
        scale(1.0, 1.0);
        image(activeImage, xPlayer-70, 410);
        popMatrix();
      }    
      
    }
    else
      {
        pushMatrix();
        scale(1.0, 1.0);
        image(stillImage,xPlayer-70, 410);
        popMatrix();
      }
    
    if(xPlayer < 0)
    {
      xPlayer = width;
    }
    if(xPlayer > width)
    {
      xPlayer = 0;
    }
  }
  
  void render()
  {
    //image(activeImage,xPlayer-70,410);
  }
  void spriteChooser()
  {
    
    activeImage = GreenRun1;
    activeImage.resize(140,110);
    stillImage = GreenStand; 
    stillImage.resize(140,110);
  }
}
