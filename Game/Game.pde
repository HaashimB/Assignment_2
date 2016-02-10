

//Programming Assignment

import ddf.minim.*;//import use of sounds and music

//Declare Classes in main
Stickman stickman;
Spikes spikes;
Sprites sprites;
Hearts hearts;
GameMusic gameMusic;
Minim minim;

PFont titleFont;//Variable for main font used

void setup()
{
  size(700, 500);
  
  stickman = new Stickman('a', 'd');//initialise classes
  spikes = new Spikes();
  sprites = new Sprites();
  hearts = new Hearts();
  minim = new Minim(this);
  gameMusic = new GameMusic();
  
  gameMusic.musicInit();//initialise objects and variables in classes
  hearts.heartInit();
  sprites.imageInit();
  
  gameObjects.add(spikes);//add classes to gameObjects()
  gameObjects.add(stickman);
  
  spikes.spikeLocation();//set location, and speed of spikes
  
  face = loadImage("player.png");//load images used in main menu and game.
  stalagmite = loadImage("spike.png");
  hGreen = loadImage("Helmet_Green.png");
  hBlue = loadImage("Helmet_Blue.png");
  hRed = loadImage("Helmet_Red.png");
  back = loadImage("Game Background.png");
  torch1 = loadImage("torches1.png");
  torch2 = loadImage("torches2.png");
  
  titleFont = loadFont("Standard0757-48.vlw");  //load font used throughout game
  
  helmet = hGreen;//initialise helmet to green to avoid null pointer 
  
  gameMusic.chooseMusic();//start game music
  gameMusic.startMusic();
  
  highscoreLoad();//load in highscore
  
  frameRate(60);//set Framerate to 60
  
}//end setup()

//declare global variables
ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();
int screen = 0;//variable to control which menu is active
color diffCol1;//colors for buttons
color diffCol2;
color diffCol3;
float r = (255);//colors for other buttons
float g = (255);
float b = (150);
PImage face, hGreen, hRed, hBlue, stalagmite, back, torch1, torch2;//images used in main menu and in-game
float imgheight = 250;
PImage helmet;//image used in main menu
float torchSwitch = 0;//variable to control torch flicker in game
int high_score = 0;//variable to keep track of high score
PrintWriter output;//variable to write to Highscore.csv file
AudioPlayer scream;//sound that plays when player is hit

void draw()
{
  if (screen == 0)//main menu
  {
    background(0); 

    image(face, width*0.22, imgheight);//face in main menu
    image(helmet, width*0.22, imgheight-70);//helmet in main menu
    image(stalagmite, width*0.55, -40);//enemy spike
    stroke(diffCol1); 
    fill(diffCol1);
    rect(width/2-50, height*0.55-30, 100, 40);//rect for play button
    stroke(diffCol2);
    fill(diffCol2);
    rect(width/2-50, height*0.7-30, 100, 40);//rect of quit button
    stroke(0); 
    
    //rects for choosing color
    fill(0, 220, 0);
    rect(width*0.15-25, height*0.35-10, 20, 20);
    fill(220, 0, 0);
    rect(width*0.1-25, height*0.35-10, 20, 20);
    fill(0, 0, 220);
    rect(width*0.2-25, height*0.35-10, 20, 20);

    //text for title and color choice in main menu
    fill(255);
    textFont(titleFont, 34);
    textAlign(CENTER);
    text("Anti-Gravity:", width/2, height*0.1);
    textSize(40);
    text("StalagMIGHT", width/2, height*0.18);
    textSize(15);
    text("Choose Color:", width*0.13, height*0.3);
    fill(0);
    textSize(20);
    text("Dodge\nor\nDIE!\n", width*0.64, 130);
    
    //text for play and quit buttons
    textSize(28);
    text("Play", width/2, height*0.55);
    text("Quit", width/2, height*0.7);

    //if statements to control buttons in main
    if (mouseX>width/2-50&&mouseX<width/2+50&&mouseY>height*0.55-30&&mouseY<height*0.55+10)
    {
      imgheight = height*0.5;
      diffCol1 = color(r, g, b);
      if (mousePressed)
      {
        screen = 1;
      }//end if
    }//end if
    else
    {
      diffCol1=color(200);
    }//end else
    if (mouseX>width/2-50&&mouseX<width/2+50&&mouseY>height*0.7-30&&mouseY<height*0.7+10)
    {
      imgheight = height*0.66;
      diffCol2 = color(r, g, b);
      if (mousePressed)
      {
        exit();
      }//end if
    }//end if 
    else
    {
      diffCol2=color(200);
    }//end else
    //if statements to control buttons for color choice in main screen
    if (mouseX>width*0.15-25&&mouseX<width*0.15-5&&mouseY>height*0.35-10&&mouseY<height*0.35+10)
    {
      if (mousePressed)
      {
        sprites.spriteChoices(1);
        helmet = hGreen;
      }//end if
    }//end if
    if (mouseX>width*0.2-25&&mouseX<width*0.2-5&&mouseY>height*0.35-10&&mouseY<height*0.35+10)
    {
      if (mousePressed)
      {
        sprites.spriteChoices(2);
        helmet = hBlue;
      }//end if
    }//end if
    if (mouseX>width*0.1-25&&mouseX<width*0.1-5&&mouseY>height*0.35-10&&mouseY<height*0.35+10)
    {
      if (mousePressed)
      {
        sprites.spriteChoices(3);
        helmet = hRed;
      }//end if
    }//end if
    
  }//end if for screen 0
  
  if (screen == 1)//difficulty screen
  {
    background(0); 
  
    //rects for difficulty settings  
    fill(diffCol1);
    rect(width*0.3-50, height*0.4-30, 100, 40);
    fill(diffCol2);
    rect(width*0.5-50, height*0.4-30, 100, 40);
    fill(diffCol3);
    rect(width*0.7-50, height*0.4-30, 100, 40);
    fill(255);
    
    //text used in difficulty screen
    textSize(25);
    textAlign(CENTER);
    text("Choose Difficulty:", width/2, height*0.3);
    textSize(20);
    text("Easy", width*0.3, height*0.4);
    text("Normal", width*0.5, height*0.4);
    text("Hard", width*0.7, height*0.4);
    
    //instructions on how to play
    text("'a' and 'd' to move left and right", width*0.5, 250);
    text("'p' to Pause", width*0.5, 280);
    
    //if statements to control buttons in difficulty screen
    if (mouseX>width*0.3-50&&mouseX<width*0.3+50&&mouseY>height*0.4-30&&mouseY<height*0.4+10)
    {
      diffCol1 = color(155, 0, 255);
      if (mousePressed)
      {
        gameMusic.stopMusic();
        gameMusic.musicChoice = 2;
        gameMusic.chooseMusic();
        gameMusic.startMusic();
        stickman.xSpeed = 5;
        sprites.xSpeed = 5;
        spikes.spikeLocation();
        spikes.easy();
        screen = 2;
      }//end if
    }//end if
    else
    {
      diffCol1 = color(200, 100, 255);
    }//end else
    if (mouseX>width*0.5-50&&mouseX<width*0.5+50&&mouseY>height*0.4-30&&mouseY<height*0.4+10)
    {
      diffCol2 = color(155, 0, 255);
      if (mousePressed)
      {
        gameMusic.stopMusic();
        gameMusic.musicChoice = 2;
        gameMusic.chooseMusic();
        gameMusic.startMusic();
        stickman.xSpeed = 6;
        sprites.xSpeed = 6;
        spikes.spikeLocation();
        spikes.medium();
        screen = 2;
      }//end if
    }//end if
    else
    {
      diffCol2=color(200, 100, 255);
    }//end else
    if (mouseX>width*0.7-50&&mouseX<width*0.7+50&&mouseY>height*0.4-30&&mouseY<height*0.4+10)
    {
      diffCol3 = color(155, 0, 255);
      if (mousePressed)
      {
        gameMusic.stopMusic();
        gameMusic.musicChoice = 2;
        gameMusic.chooseMusic();
        gameMusic.startMusic();
        stickman.xSpeed = 8;
        sprites.xSpeed = 8;
        spikes.spikeLocation();
        spikes.hard();
        screen = 2;
      }//end if
    }//end if
    else
    {
      diffCol3=color(200, 100, 255);
    }//end else

  }//end if statement for screen 1

  if (screen == 2)//game screen
  {
    background(0);
    textSize(15);
    textAlign(LEFT);
    image(back, 0, 0);//in-game baackground
    
    //code to control torch flickering in-game
    torchSwitch++;
    if (torchSwitch>=20)
    {
      image(torch1, 0, 0);
      if (torchSwitch>=40)
      {
        torchSwitch = 0;
      }
    } else
    {
      image(torch2, 0, 0);
    }
    text("Score = " + spikes.score, 20, 80);

    collisions();
    hearts.currentHearts();
    hearts.HP();

    stickman.update('a', 'd');
    stickman.render();

    sprites.spriteChooser();
    sprites.update('a', 'd');
    sprites.render();
    fill(0);
    spikes.render();
    spikes.update();
    if (keyPressed)
    {
      if (key =='p')
      {
        screen = 4;
      }
    }
  }
  if (screen ==3)//Game Over screen
  {
    background(0);
    textSize(40);
    textAlign(CENTER);
    text("GAME OVER", width/2, height*0.28);
    textSize(20);
    text("Highscore:" + high_score + "    " + "Your score was: " + spikes.score, width/2, height*0.35);
    fill(diffCol2);
    rect(width*0.6-50, height*0.6-30, 100, 40);
    fill(diffCol1);
    rect(width*0.4-50, height*0.6-30, 100, 40);
    fill(255);
    textSize(30);
    text("Play", width*0.4, height*0.6);
    textSize(30);
    text("Back", width*0.6, height*0.6);
    if (mouseX>width*0.4-50&&mouseX<width*0.4+50&&mouseY>height*0.6-30&&mouseY<height*0.6+10)
    {
      diffCol1 = color(155, 0, 255);
      if (mousePressed)
      {
        gameMusic.stopMusic();
        gameMusic.musicChoice = 2;
        gameMusic.chooseMusic();
        gameMusic.startMusic();
        sprites.xPlayer = width/2;
        stickman.xPlayer = width/2;
        spikes.score = 0;
        spikes.spikeLocation();
        screen = 2;
      }
    } else
    {
      diffCol1=color(200, 100, 255);
    }
    if (mouseX>width*0.6-50&&mouseX<width*0.6+50&&mouseY>height*0.6-30&&mouseY<height*0.6+10)
    {
      diffCol2 = color(155, 0, 255);
      if (mousePressed)
      {
        gameMusic.stopMusic();
        gameMusic.musicChoice = 1;
        gameMusic.chooseMusic();
        gameMusic.startMusic();
        sprites.xPlayer = width/2;
        stickman.xPlayer = width/2;
        spikes.score = 0;
        screen = 0;
      }
    } else
    {
      diffCol2=color(200, 100, 255);
    }
  }
  if (screen == 4)//pause menu
  {
    background(0);
    fill(diffCol1);
    rect(width/2-50, height*0.55-30, 100, 40);
    fill(diffCol2);
    rect(width/2-50, height*0.7-30, 100, 40);
    fill(200);
    textSize(40);
    textAlign(CENTER);
    text("Paused", width/2, height*0.28);
    textSize(28);
    fill(0);
    text("Play", width/2, height*0.55);
    text("Quit", width/2, height*0.7);
    if (mouseX>width/2-50&&mouseX<width/2+50&&mouseY>height*0.55-30&&mouseY<height*0.55+10)
    {
      imgheight = height*0.5;
      diffCol1 = color(r, g, b);
      if (mousePressed)
      {
        screen = 2;
      }
    } else
    {
      diffCol1=color(200);
    }
    if (mouseX>width/2-50&&mouseX<width/2+50&&mouseY>height*0.7-30&&mouseY<height*0.7+10)
    {
      imgheight = height*0.66;
      diffCol2 = color(r, g, b);
      if (mousePressed)
      {
        exit();
      }
    } else
    {
      diffCol2=color(200);
    }
  }
}

void collisions()
{

  for (int i = 0; i<5; i++)
  {
    if (dist(stickman.xPlayer-30, 480, spikes.xPos[i], spikes.yPos[i]) <= spikes.cell-10)
    {
      spikes.xPos[i] = width * 2 ;//move it out of the way
      hearts.lives--;//heart is lost if hit
      fill(255, 0, 0);
      rect(0, 0, width, height);
      if (hearts.lives == 0)
      {
        gameMusic.stopMusic();//play game ver music if heart are all gone
        gameMusic.musicChoice = 3;
        gameMusic.chooseMusic();
        gameMusic.startMusic();
        screen = 3;
        hearts.lives = 3;
        if (spikes.score>high_score)
        {
          output = createWriter("Highscore.csv");
          output.println(spikes.score);
          output.flush();
          output.close();
          highscoreLoad();
        }
      }
    }//end if
  }//end for
}


void highscoreLoad()
{

  String filename = "Highscore.csv";

  String[] lines = loadStrings(filename); // files must be in the data folder

  high_score = parseInt(lines[0]);
}// end load_in_high_score

