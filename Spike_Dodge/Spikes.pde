class Spikes
{
  
  float xPos;
  float yPos;
  float fixedPos;
  float spikeSpeed;
  public Spikes()
  {
    xPos = random(width*0.1,width*0.9);
    yPos = random(50,150);
    fixedPos = 0;
    spikeSpeed = 4;
  }
  
  void update()
  {
    yPos+=spikeSpeed;
    fixedPos+=spikeSpeed;
    if(yPos == height)
    {
      
    }
    
    
  }
  
  void render()
  {
    line(xPos,fixedPos,xPos+25,yPos);
    line(xPos,fixedPos,xPos+50,fixedPos);
    line(xPos+25,yPos,xPos+50,fixedPos);
  }
}
