//Programming Assignment

Stickman stickman;
Spikes spikes;
Sprites sprites;
PFont titleFont;
void setup()
{
  size(700, 500);
  stickman = new Stickman('a', 'd');
  spikes = new Spikes();
  sprites = new Sprites();
  sprites.imageInit();
  gameObjects.add(spikes);
  gameObjects.add(stickman);
  spikes.spikeLocation();
  face = loadImage("player.png");
  hGreen = loadImage("Helmet_Green.png");
  hBlue = loadImage("Helmet_Blue.png");
  hRed = loadImage("Helmet_Red.png");
  titleFont = loadFont("Standard0757-48.vlw");
  helmet = hGreen;
  
}
void gameInit()
{
  
}
ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();
int screen = 0;
color diffCol1;
color diffCol2;
color diffCol3;
float r = (255);
float g = (255);
float b = (150);
PImage face, hGreen, hRed, hBlue;
float imgheight = 250;
int lives = 3;
PImage helmet;
void draw()
{
  if (screen == 0)
  {
    background(100);   
    image(face, width*0.21, imgheight);
    image(helmet, width*0.21, imgheight-70);

    fill(diffCol1);
    rect(width/2-50, height*0.55-30, 100, 40);
    fill(diffCol2);
    rect(width/2-50, height*0.7-30, 100, 40);
    fill(0,220,0);
    rect(width*0.15-25, height*0.35-10, 20, 20);
    fill(220,0,0);
    rect(width*0.1-25, height*0.35-10, 20, 20);
    fill(0,0,220);
    rect(width*0.2-25, height*0.35-10, 20, 20);
    
    fill(255);
    textFont(titleFont,34);
    textAlign(CENTER);
    text("Anti-Gravity:", width/2, height*0.1);
    textSize(40);
    text("StalagMIGHT", width/2, height*0.18);
    textSize(15);
    text("Choose Helmet Color:",width*0.15,height*0.3);
    textSize(28);
    fill(0);
    text("Play", width/2, height*0.55);
    text("Quit", width/2, height*0.7);
    
    
    if (mouseX>width/2-50&&mouseX<width/2+50&&mouseY>height*0.55-30&&mouseY<height*0.55+10)
    {
      imgheight = height*0.5;
      diffCol1 = color(r,g,b);
      if (mousePressed)
      {
        screen = 1;
      }
    } else
    {
      diffCol1=color(200);
    }
    if (mouseX>width/2-50&&mouseX<width/2+50&&mouseY>height*0.7-30&&mouseY<height*0.7+10)
    {
      imgheight = height*0.66;
      diffCol2 = color(r,g,b);
      if (mousePressed)
      {
        exit();
      }
    } else
    {
      diffCol2=color(200);
    }
    if (mouseX>width*0.1-10&&mouseX<width*0.15+10&&mouseY>height*0.35-10&&mouseY<height*0.35+10)
    {
      if(mousePressed)
      {
        helmet = hGreen;
      }
    }
    if (mouseX>width*0.15-10&&mouseX<width*0.2+10&&mouseY>height*0.35-10&&mouseY<height*0.35+10)
    {
      if(mousePressed)
      {
        helmet = hBlue;
      }
    }
    if (mouseX>width*0.05-10&&mouseX<width*0.1+10&&mouseY>height*0.35-10&&mouseY<height*0.35+10)
    {
      if(mousePressed)
      {
        helmet = hRed;
      }
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
    
    sprites.spriteChooser();
    sprites.update('a','d');
    sprites.render();
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
  if (screen ==3)
  {
    background(0);
    textSize(40);
    text("GAME OVER", width/2, height*0.28);
    fill(diffCol2);
    rect(width*0.6-50, height*0.6-30, 100, 40);
    fill(diffCol1);
    rect(width*0.4-50, height*0.6-30, 100, 40);
    fill(255);
    textSize(30);
    text("Play", width*0.4, height*0.6);
    textSize(30);
    text("Back", width*0.6, height*0.6);
    if (mouseX>width*0.4-50&&mouseX<width*0.4+50&&mouseY>height*0.6-30&&mouseY<height*0.6+10)
    {
      diffCol1 = color(155, 0, 255);
      if (mousePressed)
      {
        spikes.medium();
        screen = 2;
      }
    } else
    {
      diffCol1=color(200, 100, 255);
    }
    if (mouseX>width*0.6-50&&mouseX<width*0.6+50&&mouseY>height*0.6-30&&mouseY<height*0.6+10)
    {
      diffCol2 = color(155, 0, 255);
      if (mousePressed)
      {
        spikes.hard();
        screen = 0;
      }
    } else
    {
      diffCol2=color(200, 100, 255);
    }
  }
}

void collisions()
{

  for (int i = 0; i<5; i++)
  {
    if (dist(stickman.xPlayer-30, 480, spikes.xPos[i], spikes.yPos[i]) <= spikes.cell-10)
    {
      spikes.xPos[i] = width * 2 ;//move it out of the way
      println("lives = " + lives);
      /*if (lives == 0)
      {
        screen = 3;
        lives = 3;
      } 
      lives--;*/
    }//end if
  }//end for
}

