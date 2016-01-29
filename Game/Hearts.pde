class Hearts extends GameObject
{
  int lives = 3;
  PImage heart;
  PImage heartBroken;
  PImage activeHeart;
  PImage activeHeart1;
  PImage activeHeart2;
  Hearts()
  {
  }
  void heartInit()
  {
    heart = loadImage("Heart.png");
    heartBroken = loadImage("BrokenHeart.png");
  }
  void currentHearts()
  {
    if(lives == 3)
    {
      activeHeart = heart;
      activeHeart1 = heart;
      activeHeart2 = heart;
    }
    if(lives == 2)
    {
      activeHeart = heartBroken;
      activeHeart1 = heart;
      activeHeart2 = heart;
    }
    if(lives == 1)
    {
      activeHeart = heartBroken;
      activeHeart1 = heartBroken;
      activeHeart2 = heart;
    }
  }
  void HP()
  {
    image(activeHeart,70,10);
    image(activeHeart1,40,10);
    image(activeHeart2,10,10);
  }
  
}
