class Stickman extends GameObject
{
  char left;
  char right;
  int head = height/20;
  
  
  Stickman(char left, char right)
  {
    this.left = left;
    this.right = right;
  }
  
  void update(char left, char right)
  {
    if(keyPressed)
    {
      if (key == left)
      {
        xPlayer -= xSpeed;
      }
      if (key == right)
      {
        xPlayer += xSpeed;
      }    
    }
    
    if(xPlayer < 0)
    {
      xPlayer = width;
    }
    if(xPlayer > width)
    {
      xPlayer = 0;
    }
  }
  
  void render()
  {
    pushMatrix(); // reset the tr+n and rotation
    noStroke();
    noFill();
    ellipse(xPlayer,430,head,head);
    line(xPlayer,443,xPlayer,470);
    line(xPlayer,447,xPlayer+20,460);
    line(xPlayer,447,xPlayer-20,460);
    line(xPlayer,470,xPlayer+10,490);
    line(xPlayer,470,xPlayer-10,490);
    popMatrix();
  }
}
