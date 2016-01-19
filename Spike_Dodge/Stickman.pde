class Stickman
{
  char left;
  char right;
  int head = height/20;
  int xPlayer = 250;
  
  Stickman()
  {

  }
  
  Stickman(char left, char right)
  {

    this.left = left;
    this.right = right;
  }
  
  
  void update()
  {
    if(keyPressed)
    {
      if (key == left)
      {
        xPlayer --;
      }
      if (key== right)
      {
        xPlayer ++;
      }    
    } 
  }
  
  void render()
  {
    pushMatrix(); // reset the translation and rotation
    ellipse(xPlayer,430,head,head);
    
    popMatrix();
  }
}
