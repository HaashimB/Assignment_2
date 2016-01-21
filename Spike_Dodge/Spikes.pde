class Spikes
{

  float[] xPos = new float[10];
  float[] yPos = new float[10];
  float[] fixedPos = new float[10];
  float spikeSpeed=5;
  float[] spikeCol = new float[200];
  float cell = width/10;//evenly spaces spikes
  int spikeNum = 10;
  public Spikes()
  {
  }
  void spikeLocation()
  {

    for (int i = 0; i < spikeNum; i++)
    {
      spikeCol[i] = random(0, 200);
      xPos[i]= cell * random(10);
      yPos[i] = random(50, 150)-100;
      fixedPos[i] = -100;
      if (spikeSpeed<10)
      {
        spikeSpeed+=0.1;
      }
    }
  }

  void update()
  {
    for (int i=0; i<spikeNum; i++)
    {
      yPos[i]+=spikeSpeed;
      fixedPos[i]+=spikeSpeed;
      if (yPos[i] > height+150)
      {
        spikeLocation();
      }
    }
  }

  void render()
  {

    for (int i=0; i<spikeNum; i++)
    {
      stroke(spikeCol[i]);
      fill(spikeCol[i]);
      triangle(xPos[i], fixedPos[i], xPos[i]+25, yPos[i], xPos[i]+50, fixedPos[i]);
    }
  }
}

