//Programming Assignment

Stickman stickman;
Spikes spikes;
void setup()
{
  size(500,500);
  stickman = new Stickman('a','d');
  spikes = new Spikes();

  spikes.spikeLocation();
}
int screen = 1;

void draw()
{
  if (screen == 0)
  {
    background(0);
    fill(255);
    textSize(48);
    textAlign(CENTER);
    text("Main Menu", width/2, height*0.1);
    textSize(30);
    text("Play",width/2,height*0.3);
    text("Quit",width/2,height*0.4);
    
  }
  
  if (screen == 1)
  {
  background(255);
  
  stickman.update('a','d');
  stickman.render();
  fill(0);
  spikes.render();
  spikes.update();
  }
}
