class GameMusic
{
  Minim minim;
  AudioPlayer menu;
  AudioPlayer gameOver;
  AudioPlayer ActiveMusic;
  int musicChoice = 1;
  GameMusic()
  {
  }
  
  void musicInit()
  {
    minim = new Minim(this);
    menu = minim.loadFile("CarelessWhisper.mp3");
    gameOver = minim.loadFile("Gameover.mp3");
    
  }
  void startMusic()
  {
    ActiveMusic.play();
  }
  
  void stopMusic()
  {
    ActiveMusic.pause();
    ActiveMusic.rewind();
  }
  
  void chooseMusic()
  {
    if(musicChoice == 1)
    {
      ActiveMusic = menu;
    }
    if(musicChoice == 2)
    {
      
    }
    if(musicChoice == 3)
    {
      ActiveMusic = gameOver;
    }
  }
  
  
  
  
}
