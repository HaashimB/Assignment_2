//Programming Assignment

Stickman stickman;
Spikes spikes;
void setup()
{
  size(500,500);
  stickman = new Stickman('a','d');
  spikes = new Spikes();
}


void draw()
{
  background(255);
  
  stickman.update('a','d');
  stickman.render();
  
  spikes.render();
  spikes.update();
}

