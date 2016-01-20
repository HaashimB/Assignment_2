//Programming Assignment

Stickman stickman;
void setup()
{
  size(500,500);
  stickman = new Stickman('a','d');
}


void draw()
{
  background(255);
  
  stickman.update('a','d');
  stickman.render();
  
}

