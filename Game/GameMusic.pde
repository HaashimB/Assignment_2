
class GameMusic
{
  
  AudioPlayer menu;
  AudioPlayer gameOver;
  AudioPlayer ActiveMusic;
  AudioPlayer gameStart;
  int musicChoice = 1;
  GameMusic()
  {
  }

  void musicInit()
  {
    menu = minim.loadFile("CarelessWhisper.mp3");
    gameOver = minim.loadFile("Gameover.mp3");
    gameStart = minim.loadFile("Namu.mp3");
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
    if (musicChoice == 1)
    {
      ActiveMusic = menu;
    }
    if (musicChoice == 2)
    {
      ActiveMusic = gameStart;
    }
    if (musicChoice == 3)
    {
      ActiveMusic = gameOver;
    }
  }
}

