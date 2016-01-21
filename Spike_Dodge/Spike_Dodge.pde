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
    if (mouseX>width/2-50&&mouseX<width/2+50&&mouseY>height*0.3-30&&mouseY<height*0.3+30)
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
    background(255);

    stickman.update('a', 'd');
    stickman.render();
    fill(0);
    spikes.render();
    spikes.update();
    if(keyPressed)
    {
      if(key =='m')
      {
        screen = 0;
      }
    }
  }
}

