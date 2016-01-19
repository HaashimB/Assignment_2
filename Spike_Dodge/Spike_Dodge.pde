//Programming Assignment

void setup()
{
  size(500,500);
  
}



void draw()
{
  background(0);
  Stickman stickman = new Stickman('A','D');
  stickman.render();
  stickman.update();
}

