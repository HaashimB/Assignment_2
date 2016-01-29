//Programming Assignment
//Initialise Classes in main
Stickman stickman;
Spikes spikes;
Sprites sprites;
Hearts hearts;
PFont titleFont;//Variable for main font used
void setup()
{
  size(700, 500);
  stickman = new Stickman('a', 'd');
  spikes = new Spikes();
  sprites = new Sprites();
  hearts = new Hearts();
  hearts.heartInit();
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
    fill(0, 220, 0);
    rect(width*0.15-25, height*0.35-10, 20, 20);
    fill(220, 0, 0);
    rect(width*0.1-25, height*0.35-10, 20, 20);
    fill(0, 0, 220);
    rect(width*0.2-25, height*0.35-10, 20, 20);

    fill(255);
    textFont(titleFont, 34);
    textAlign(CENTER);
    text("Anti-Gravity:", width/2, height*0.1);
    textSize(40);
    text("StalagMIGHT", width/2, height*0.18);
    textSize(15);
    text("Choose Helmet Color:", width*0.15, height*0.3);
    textSize(28);
    fill(0);
    text("Play", width/2, height*0.55);
    text("Quit", width/2, height*0.7);


    if (mouseX>width/2-50&&mouseX<width/2+50&&mouseY>height*0.55-30&&mouseY<height*0.55+10)
    {
      imgheight = height*0.5;
      diffCol1 = color(r, g, b);
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
      diffCol2 = color(r, g, b);
      if (mousePressed)
      {
        exit();
      }
    } else
    {
      diffCol2=color(200);
    }
    if (mouseX>width*0.15-25&&mouseX<width*0.15-5&&mouseY>height*0.35-10&&mouseY<height*0.35+10)
    {
      if (mousePressed)
      {
        sprites.spriteChoices(1);
        helmet = hGreen;
      }
    }
    if (mouseX>width*0.2-25&&mouseX<width*0.2-5&&mouseY>height*0.35-10&&mouseY<height*0.35+10)
    {
      if (mousePressed)
      {
        sprites.spriteChoices(2);
        helmet = hBlue;
      }
    }
    if (mouseX>width*0.1-25&&mouseX<width*0.1-5&&mouseY>height*0.35-10&&mouseY<height*0.35+10)
    {
      if (mousePressed)
      {
        sprites.spriteChoices(3);
        helmet = hRed;
      }
    }
  }
  if (screen == 1)
  {
    background(100);   
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
        stickman.xSpeed = 5;
        sprites.xSpeed = 5;
        spikes.spikeLocation();
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
        stickman.xSpeed = 6;
        sprites.xSpeed = 6;
        spikes.spikeLocation();
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
        stickman.xSpeed = 8;
        sprites.xSpeed = 8;
        spikes.spikeLocation();
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
    background(0);
    textSize(15);
    textAlign(LEFT);
    text("Score = " + spikes.score, 20, 80);
    collisions();
    hearts.currentHearts();
    hearts.HP();

    stickman.update('a', 'd');
    stickman.render();

    sprites.spriteChooser();
    sprites.update('a', 'd');
    sprites.render();
    fill(0);
    spikes.render();
    spikes.update();
    if (keyPressed)
    {
      if (key =='p')
      {
        screen = 4;
      }
    }
  }
  if (screen ==3)
  {
    background(0);
    textSize(40);
    textAlign(CENTER);
    text("GAME OVER", width/2, height*0.28);
    textSize(20);
    text("Your score was: " + spikes.score, width/2, height*0.35);
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
        sprites.xPlayer = width/2;
        stickman.xPlayer = width/2;
        spikes.score = 0;
        spikes.spikeLocation();
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
        sprites.xPlayer = width/2;
        stickman.xPlayer = width/2;
        spikes.score = 0;
        screen = 0;
      }
    } else
    {
      diffCol2=color(200, 100, 255);
    }
  }
  if (screen == 4)
  {
    background(0);

    fill(diffCol1);
    rect(width/2-50, height*0.55-30, 100, 40);
    fill(diffCol2);
    rect(width/2-50, height*0.7-30, 100, 40);
    fill(200);
    textSize(40);
    textAlign(CENTER);
    text("Paused", width/2, height*0.28);
    textSize(28);
    fill(0);
    text("Play", width/2, height*0.55);
    text("Quit", width/2, height*0.7);
    if (mouseX>width/2-50&&mouseX<width/2+50&&mouseY>height*0.55-30&&mouseY<height*0.55+10)
    {
      imgheight = height*0.5;
      diffCol1 = color(r, g, b);
      if (mousePressed)
      {
        screen = 2;
      }
    } else
    {
      diffCol1=color(200);
    }
    if (mouseX>width/2-50&&mouseX<width/2+50&&mouseY>height*0.7-30&&mouseY<height*0.7+10)
    {
      imgheight = height*0.66;
      diffCol2 = color(r, g, b);
      if (mousePressed)
      {
        exit();
      }
    } else
    {
      diffCol2=color(200);
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
      hearts.lives--;
      if (hearts.lives == 0)
      {
        screen = 3;
        hearts.lives = 3;
      }
    }//end if
  }//end for
}

