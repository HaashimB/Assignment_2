class Spikes extends GameObject
{
  int spikeNum = 5;
  float[] xPos = new float[spikeNum];
  float[] yPos = new float[spikeNum];
  float[] fixedPos = new float[spikeNum];
  float[] spikeSpeed=new float[spikeNum];
  float[] spikeCol = new float[spikeNum];
  float cell = width/10;//evenly spaces spikes
  int difficulty;
  int []score = new int[2];
  Spikes()
  {
  }
  void easy()
  {
    difficulty = 1;
    for (int i = 0; i < spikeNum; i++)
    {
      spikeSpeed[i] = random(2, 5);
    }
  }
  void medium()
  {
    difficulty = 2;
    for (int i = 0; i < spikeNum; i++)
    {
      spikeSpeed[i] = random(6, 11);
    }
  }
  void hard()
  {
    difficulty = 3;
    for (int i = 0; i < spikeNum; i++)
    {
      spikeSpeed[i] = random(8, 13);
    }
  }
  void spikeLocation()
  {

    for (int i = 0; i < spikeNum; i++)
    {
      spikeCol[i] = random(100, 200);
      xPos[i]= cell * random(10);
      yPos[i] = random(50, 150)-100;
      fixedPos[i] = -100;

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
        score[1]++;
        score[0]++;
        yPos[i] = random(50, 150)-100;
        xPos[i]= cell * random(10);
        fixedPos[i] = -100;
        if(difficulty == 1)
        {
          spikeSpeed[i] = random(2, 5);
        }
        if(difficulty == 2)
        {
          spikeSpeed[i] = random(3, 7);
        }
        if(difficulty == 3)
        {
          spikeSpeed[i] = random(6, 10);
        }
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

