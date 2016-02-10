
class GameMusic
{
  //declare audioplayer variables
  AudioPlayer menu;//music for main menu screen
  AudioPlayer gameOver;//music for game over screen
  AudioPlayer ActiveMusic;//current music chosen to play
  AudioPlayer gameStart;//music for in-game screen
  
  int musicChoice = 1;//variable to choose music playing
  
  GameMusic()
  {
  }

  void musicInit()//initialises all the music
  {
    menu = minim.loadFile("CarelessWhisper.mp3");
    gameOver = minim.loadFile("Gameover.mp3");
    gameStart = minim.loadFile("Namu.mp3");
  }//end void musicInit()
  
  void startMusic()//function to start current music
  {
    ActiveMusic.play();
  }//end void startMusic()

  void stopMusic()//function to stop current music and rewind to start
  {
    ActiveMusic.pause();
    ActiveMusic.rewind();
  }//end void stopMusic()

  void chooseMusic()//function to choose which music is playing based on variable musicChoice
  {
    //Contents of ActiveMusic change based on what integer value is in musicChoice
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
  }//end void chooseMusic()
  
}//end class GaemMusic

