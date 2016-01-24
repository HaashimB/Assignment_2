class Spikes
{
  int spikeNum = 5;
  float[] xPos = new float[spikeNum];
  float[] yPos = new float[spikeNum];
  float[] fixedPos = new float[spikeNum];
  float[] spikeSpeed=new float[spikeNum];
  float[] spikeCol = new float[spikeNum];
  boolean[] spikeFall = new boolean[spikeNum];
  int counter = 0;
  float cell = width/10;//evenly spaces spikes

  public Spikes()
  {
  }
  void spikeLocation()
  {

    for (int i = 0; i < spikeNum; i++)
    {
      spikeSpeed[i] = random(5, 10);
      spikeCol[i] = random(100, 200);
      xPos[i]= cell * random(10);
      yPos[i] = random(50, 150)-100;
      fixedPos[i] = -100;
      if (spikeSpeed[i]<7)
      {
        spikeSpeed[i]+=0.05;
      }
      counter = 0;
    }
  }

  void update()
  {
    for (int i=0; i<spikeNum; i++)
    {

      yPos[i]+=spikeSpeed[i];
      fixedPos[i]+=spikeSpeed[i];
      if (yPos[i] >= height+150)
      {
        yPos[i] = random(50, 150)-100;
        xPos[i]= cell * random(10);
        fixedPos[i] = -100;
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

