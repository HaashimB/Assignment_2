class Highscore
{
  String playerName;
  int scoreSave;
  
  Highscore(String line)
  {
    String[] parts = line.split(",");
    playerName = parts[0];
    //scoreSave = int.parseFloat(parts[1]);
  }
}
