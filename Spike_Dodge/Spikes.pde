class Spikes
{

  float xPos;
  float yPos;
  float fixedPos;
  float spikeSpeed=5;
  float spikeCol;
  float cell = width/10;//evenly spaces spikes
  public Spikes()
  {
  }
  void spikeLocation()
  {
    spikeCol = random(0,200);
    xPos = cell* (int)random(10);
    yPos = random(50, 150)-100;
    fixedPos = -100;
    if (spikeSpeed<10)
    {
      spikeSpeed+=0.1;
    }
  }

  void update()
  {
    yPos+=spikeSpeed;
    fixedPos+=spikeSpeed;
    if (yPos > height+150)
    {
      spikeLocation();
    }
  }

  void render()
  {
    stroke(spikeCol);
    fill(spikeCol);
    triangle(xPos, fixedPos, xPos+25, yPos,xPos+50, fixedPos);
  }
}

