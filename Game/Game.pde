//Programming Assignment

Stickman stickman;
Spikes spikes;
void setup()
{
  size(500, 500);
  stickman = new Stickman('a', 'd');
  spikes = new Spikes();
  spikes.spikeLocation();
}
int screen = 0;
color playCol;
color diffCol1;
color diffCol2;
color diffCol3;
void draw()
{
  if (screen == 0)
  {
    background(0);   
    fill(playCol);
    rect(width/2-50, height*0.3-30, 100, 40);
    fill(255);
    textSize(38);
    textAlign(CENTER);
    text("Anti-Gravity: StalagMIGHT", width/2, height*0.1);
    textSize(30);
    text("Play", width/2, height*0.3);
    if (mouseX>width/2-50&&mouseX<width/2+50&&mouseY>height*0.3-30&&mouseY<height*0.3+10)
    {
      playCol = color(155, 0, 255);
      if (mousePressed)
      {
        screen = 1;
      }
    } else
    {
      playCol=color(200, 100, 255);
    }
  }
  if (screen == 1)
  {
    background(0);   
    fill(diffCol1);
    rect(width*0.2-50, height*0.5-30, 100, 40);
    fill(diffCol2);
    rect(width*0.5-50, height*0.5-30, 100, 40);
    fill(diffCol3);
    rect(width*0.8-50, height*0.5-30, 100, 40);
    fill(255);
    textSize(25);
    textAlign(CENTER);
    text("Choose Difficulty:", width/2, height*0.3);
    textSize(20);
    text("Easy", width*0.2, height*0.5);
    text("Normal", width*0.5, height*0.5);
    text("Hard", width*0.8, height*0.5);
    if (mouseX>width*0.2-50&&mouseX<width*0.2+50&&mouseY>height*0.5-30&&mouseY<height*0.5+10)
    {
      diffCol1 = color(155, 0, 255);
      if (mousePressed)
      {
        spikes.easy();
        screen = 2;
      }
    }
    else
    {
      diffCol1 = color(200, 100, 255);
    }
    if (mouseX>width*0.5-50&&mouseX<width*0.5+50&&mouseY>height*0.5-30&&mouseY<height*0.5+10)
    {
      diffCol2 = color(155, 0, 255);
      if (mousePressed)
      {
        spikes.medium();
        screen = 2;
      }
    } 
    else
    {
        diffCol2=color(200, 100, 255);
    }
    if (mouseX>width*0.8-50&&mouseX<width*0.8+50&&mouseY>height*0.5-30&&mouseY<height*0.5+10)
    {
      diffCol3 = color(155, 0, 255);
      if (mousePressed)
      {
        spikes.hard();
        screen = 2;
      }
    } 
    else
    {
        diffCol3=color(200, 100, 255);
    }
  }

  if (screen == 2)
  {
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
  }
}


void collisions()
{
}

