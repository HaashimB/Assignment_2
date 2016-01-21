class Spikes
{

  float xPos;
  float yPos;
  float fixedPos;
  float spikeSpeed=5;
  float spikeCol;
  public Spikes()
  {
  }
  void spikeLocation()
  {
    spikeCol = random(0,200);
    xPos = random(width*0.1, width*0.9);
    yPos = random(50, 150)-100;
    fixedPos = -100;
    if (spikeSpeed<10)
    {
      spikeSpeed+=0.01;
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

