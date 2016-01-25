//Programming Assignment

Stickman stickman;
Spikes spikes;
void setup()
{
  size(700, 500);
  stickman = new Stickman('a', 'd');
  spikes = new Spikes();
  gameObjects.add(spikes);
  gameObjects.add(stickman);
  spikes.spikeLocation();
  face = loadImage("player.png");
  hGreen = loadImage("Helmet_Green.png");
  hBlue = loadImage("Helmet_Blue.png");
  hRed = loadImage("Helmet_Red.png");
}
ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();
int screen = 0;
color playCol;
color quitCol;
color diffCol1;
color diffCol2;
color diffCol3;
PImage face, hGreen, hRed, hBlue;
float imgheight = 240;
void draw()
{
  if (screen == 0)
  {
    background(0);   
    image(face, width*0.15, imgheight);
    image(hGreen, width*0.15, imgheight-70);

    fill(playCol);
    rect(width/2-50, height*0.55-30, 100, 40);
    fill(quitCol);
    rect(width/2-50, height*0.7-30, 100, 40);
    fill(255);
    textSize(34);
    textAlign(CENTER);
    text("Anti-Gravity:", width/2, height*0.2);
    textSize(40);
    text("StalagMIGHT", width/2, height*0.28);

    textSize(30);
    text("Play", width/2, height*0.55);
    text("Quit", width/2, height*0.7);
    if (mouseX>width/2-50&&mouseX<width/2+50&&mouseY>height*0.55-30&&mouseY<height*0.55+10)
    {
      imgheight = height*0.48;
      playCol = color(155, 0, 255);
      if (mousePressed)
      {
        screen = 1;
      }
    } else
    {
      playCol=color(200, 100, 255);
    }
    if (mouseX>width/2-50&&mouseX<width/2+50&&mouseY>height*0.7-30&&mouseY<height*0.7+10)
    {
      imgheight = height*0.7;
      quitCol = color(155, 0, 255);
      if (mousePressed)
      {
        exit();
      }
    } else
    {
      quitCol=color(200, 100, 255);
    }
  }
  if (screen == 1)
  {
    background(0);   
    fill(diffCol1);
    rect(width*0.3-50, height*0.4-30, 100, 40);
    fill(diffCol2);
    rect(width*0.5-50, height*0.4-30, 100, 40);
    fill(diffCol3);
    rect(width*0.7-50, height*0.4-30, 100, 40);
    fill(255);
    textSize(25);
    textAlign(CENTER);
    text("Choose Difficulty:", width/2, height*0.3);
    textSize(20);
    text("Easy", width*0.3, height*0.4);
    text("Normal", width*0.5, height*0.4);
    text("Hard", width*0.7, height*0.4);
    if (mouseX>width*0.3-50&&mouseX<width*0.3+50&&mouseY>height*0.4-30&&mouseY<height*0.4+10)
    {
      diffCol1 = color(155, 0, 255);
      if (mousePressed)
      {
        spikes.easy();
        screen = 2;
      }
    } else
    {
      diffCol1 = color(200, 100, 255);
    }
    if (mouseX>width*0.5-50&&mouseX<width*0.5+50&&mouseY>height*0.4-30&&mouseY<height*0.4+10)
    {
      diffCol2 = color(155, 0, 255);
      if (mousePressed)
      {
        spikes.medium();
        screen = 2;
      }
    } else
    {
      diffCol2=color(200, 100, 255);
    }
    if (mouseX>width*0.7-50&&mouseX<width*0.7+50&&mouseY>height*0.4-30&&mouseY<height*0.4+10)
    {
      diffCol3 = color(155, 0, 255);
      if (mousePressed)
      {
        spikes.hard();
        screen = 2;
      }
    } else
    {
      diffCol3=color(200, 100, 255);
    }
  }

  if (screen == 2)
  {

    for (int i = gameObjects.size () - 1; i >= 0; i --)
    {
      GameObject go = gameObjects.get(i);
      go.update();
      go.render();
    }
    background(255);

    stickman.update('a', 'd');
    stickman.render();
    fill(0);
    spikes.render();
    spikes.update();
    if (keyPressed)
    {
      if (key =='m')
      {
        screen = 0;
      }
    }
    collisions();
  }
}

void collisions()
{
  for (int i = 0; i<5; i++)
  {
    if (dist(stickman.xPlayer, 480, spikes.xPos[i], spikes.yPos[i]) <= spikes.cell)
    {
      //lives = lives - 1;
      spikes.xPos[i] = width * 2 ;//move it out of the way
      println("You Dead boi");
      screen = 1;
    }//end if
  }//end for
  /*for (int i = gameObjects.size () - 1; i >= 0; i --)
   {
   GameObject go = gameObjects.get(i);
   if (go instanceof Stickman)
   {
   for (int j = gameObjects.size () - 1; j >= 0; j --)
   {
   GameObject other = gameObjects.get(j);
   if (other instanceof Spikes) // Check the type of a object
   {
   // Bounding circle collisions
   for (int x = 0; x<5; x++)
   {
   if (spikes.yPos[x].dist(spikes.yPos[x]) < spikes.yPos[x] + stickman.xPlayer)
   {
   println("You Dead boi");
   }
   }
   }
   }
   }
   }*/
}

