class Sprites extends GameObject
{
  //declare variable to hold images
  PImage GreenRun1;
  PImage GreenStand;
  PImage RedRun1;
  PImage RedStand;
  PImage BlueRun1;
  PImage BlueStand;
  PImage stillImage;
  PImage activeImage;//current image chosen
  int spriteChoice = 1;//variable to choose image which is shown
  Sprites()
  {
  }

  void imageInit()//function to initialise all the images
  {
    GreenStand = loadImage("StandStillGreen.png");
    GreenRun1 = loadImage("Run1Green.png");
    RedStand = loadImage("StandStillRed.png");
    RedRun1 = loadImage("Run1Red.png");
    BlueStand = loadImage("StandStillBlue.png");
    BlueRun1 = loadImage("Run1Blue.png");
  }//end void imageInit()
  
  void update(char left, char right)//renders and updates sprite
  {
    if (keyPressed)
    {
      if (key == left)//shows sprite running to the left when 'a' pressed
      {
        xPlayer -= xSpeed;
        pushMatrix();
        scale(-1.0, 1.0);
        image(activeImage, -xPlayer-70, 410);
        popMatrix();
      }//end if
      if (key == right)//shows sprite running to the right when 'd' pressed
      {
        xPlayer += xSpeed;
        pushMatrix();
        scale(1.0, 1.0);
        image(activeImage, xPlayer-70, 410);
        popMatrix();
      }//end if
    }//end if
    else//shows sprite stillImage, image of sprite standing still
    {
      pushMatrix();
      scale(1.0, 1.0);
      image(stillImage, xPlayer-70, 410);
      popMatrix();
    }//end else

    if (xPlayer < 0)
    {
      xPlayer = width;
    }//end if
    if (xPlayer > width)
    {
      xPlayer = 0;
    }//end if
  }//end void update()

  void spriteChoices(int a)//interger value chooses which color image to show
  {
    spriteChoice = a;
  }//end void spriteChoices()
  
  void spriteChooser()//chooses color of sprite used based on variable spriteChoice
  {
    if (spriteChoice == 1)//chooses green sprite
    {
      activeImage = GreenRun1;
      stillImage = GreenStand;
    }
    if (spriteChoice == 2)//chooses blue sprite
    {
      activeImage = BlueRun1;
      stillImage = BlueStand;
    }
    if (spriteChoice == 3)//chooses red sprite
    {
      activeImage = RedRun1;
      stillImage = RedStand;
    }
    //resizes images to correct position
    activeImage.resize(140, 110);
    stillImage.resize(140, 110);
  }//end void spriteChooser()
}//end class Sprites

