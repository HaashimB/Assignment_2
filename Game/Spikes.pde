class Spikes extends GameObject
{
  int spikeNum = 5;// constant number of spikes on screen
  //properties of spikes
  float[] xPos = new float[spikeNum];
  float[] yPos = new float[spikeNum];
  float[] fixedPos = new float[spikeNum];
  float[] spikeSpeed=new float[spikeNum];
  float[] spikeCol = new float[spikeNum];
  float cell = width/10;//evenly spaces spikes
  int difficulty;//variable for difficulty 
  int score = 0;//keep track of spikes passed from top to bottom
  Spikes()
  {
  }
  void easy()//if easy difficulty is selected, calls this function from draw()
  {
    difficulty = 1;
    for (int i = 0; i < spikeNum; i++)
    {
      spikeSpeed[i] = random(2, 5);
    }
  }
  void medium()//if medium difficulty is selected, calls this function from draw()
  {
    difficulty = 2;
    for (int i = 0; i < spikeNum; i++)
    {
      spikeSpeed[i] = random(8, 12);
    }
  }
  void hard()//if hard difficulty is selected, calls this function from draw()
  {
    difficulty = 3;
    for (int i = 0; i < spikeNum; i++)
    {
      spikeSpeed[i] = random(10, 15);
    }
  }
  void spikeLocation()//chooses random location for spikes and selects random speed for initial wave of spikes
  {

    for (int i = 0; i < spikeNum; i++)
    {
      spikeCol[i] = random(130, 200);
      xPos[i]= cell * random(10);
      yPos[i] = random(50, 100)-100;
      fixedPos[i] = -100;
      if (difficulty == 1)//easy
      {
        spikeSpeed[i] = random(4, 8);
      }
      if (difficulty == 2)//medium
      {
        spikeSpeed[i] = random(8, 12);
      }
      if (difficulty == 3)//hard
      {
        spikeSpeed[i] = random(10, 15);
      }
    }
  }

  void update()//updates position of spikes depending on the difficulty 
  {
    for (int i=0; i<spikeNum; i++)
    {

      yPos[i]+=spikeSpeed[i];
      fixedPos[i]+=spikeSpeed[i];
      if (yPos[i] >= height+150)
      {
        score++;
        yPos[i] = random(50, 120)-100;
        xPos[i]= cell * random(10);
        fixedPos[i] = -100;
        if (difficulty == 1)
        {
          spikeSpeed[i] = random(4, 8);
        }
        if (difficulty == 2)
        {
          spikeSpeed[i] = random(8, 12);
        }
        if (difficulty == 3)
        {
          spikeSpeed[i] = random(10, 15);
        }
      }
    }
  }// end void update()

  void render()//this function is called every time a spike is rendered
  {

    for (int i=0; i<spikeNum; i++)
    {
      stroke(spikeCol[i]);
      fill(spikeCol[i]);
      triangle(xPos[i], fixedPos[i], xPos[i]+25, yPos[i], xPos[i]+50, fixedPos[i]);
    }
  }//end void render()
}//end class Spikes

