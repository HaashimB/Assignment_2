class Spikes
{

  float xPos;
  float yPos;
  float fixedPos;
  float spikeSpeed;
  
  public Spikes()
  {
  }
  void spikeLocation()
  {
    xPos = random(width*0.1, width*0.9);
    yPos = random(50, 150);
    fixedPos = 0;
    spikeSpeed = 4;
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
    line(xPos, fixedPos, xPos+25, yPos);
    line(xPos, fixedPos, xPos+50, fixedPos);
    line(xPos+25, yPos, xPos+50, fixedPos);
  }
}

