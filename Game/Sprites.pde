class Sprites extends GameObject
{
  PImage GreenRun1;
  PImage GreenStand;
  PImage RedRun1;
  PImage RedStand;
  PImage BlueRun1;
  PImage BlueStand;
  PImage stillImage;
  PImage activeImage;
  int spriteChoice = 1;
  Sprites()
  {
  }

  void imageInit()
  {
    GreenStand = loadImage("StandStillGreen.png");
    GreenRun1 = loadImage("Run1Green.png");
    RedStand = loadImage("StandStillRed.png");
    RedRun1 = loadImage("Run1Red.png");
    BlueStand = loadImage("StandStillBlue.png");
    BlueRun1 = loadImage("Run1Blue.png");
  }
  void update(char left, char right)
  {
    if (keyPressed)
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
    } else
    {
      pushMatrix();
      scale(1.0, 1.0);
      image(stillImage, xPlayer-70, 410);
      popMatrix();
    }

    if (xPlayer < 0)
    {
      xPlayer = width;
    }
    if (xPlayer > width)
    {
      xPlayer = 0;
    }
  }

  void render()
  {
    //image(activeImage,xPlayer-70,410);
  }

  void spriteChoices(int a)
  {
    spriteChoice = a;
  }
  void spriteChooser()
  {
    if (spriteChoice == 1)
    {
      activeImage = GreenRun1;
      stillImage = GreenStand;
    }
    if (spriteChoice == 2)
    {
      activeImage = BlueRun1;
      stillImage = BlueStand;
    }
    if (spriteChoice == 3)
    {
      activeImage = RedRun1;
      stillImage = RedStand;
    }
    activeImage.resize(140, 110);
    stillImage.resize(140, 110);
  }
}

