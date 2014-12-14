import de.voidplus.leapmotion.*;
//import com.leapmotion.leap.ScreenTapGesture;

// our Leap Motion object
LeapMotion leap;

// Items graphic
PShape plane;
PImage bad;
PImage good;
PImage cloudImage;
PImage cityImage;
PImage spaceImage;

PImage start2;
PImage start3;
PImage replay;
PImage replay2;

float tempX;
float tempY;

boolean playGame = false;
boolean startScreen = true;
boolean replayGame = false;
boolean gameOver = false;
boolean inGame = false;

boolean moveRIGHT = false;
boolean moveLEFT = false;
boolean moveUP = false;
boolean moveDOWN = false;
boolean readyToGo = false;

int score = 0;
int timeLeft = 60;
boolean rotateVar;

ArrayList<collectableItems> goodItems = new ArrayList<collectableItems>();
ArrayList<collectableItems> badItems = new ArrayList<collectableItems>();

PFont myFont;


Items clouds;
Items cityShape;
Items spaceShape;

Timer timer;
Timer timer2;
Timer timer3;
Timer timer4;



void setup() 
{
  myFont = createFont("Neou-Bold.otf", 100);
  size(800, 500, P3D);
  hint(DISABLE_DEPTH_TEST);
  timer = new Timer(0);
  timer2 = new Timer(0);
  timer3 = new Timer(0);
  timer4 = new Timer(0);

  // constructor our snsor
  leap = new LeapMotion(this);

  // load in Items
  plane = loadShape("plane.obj");
  good = loadImage("coin1.png"); 
  bad = loadImage("bad.png"); 
  cloudImage = loadImage("clouds.png"); 
  cityImage = loadImage("cityImage.png");
  spaceImage = loadImage("spaceImage.png");
  start2 = loadImage("start2.png");
  start3 = loadImage("start3.png");
  replay = loadImage("replay.png");
  replay2 = loadImage("replay2.png");


  for (int i = 0; i < 1000; i++)
  {
    collectableItems good = new collectableItems(random(-2000, 2000), random(-2000, 2000), random(-100000, -1000));
    goodItems.add( good );
  }

  for (int i = 0; i < 300; i++)
  {
    collectableItems bad = new collectableItems(random(-2000, 2000), random(-2000, 2000), random(-40000, -1000));
    badItems.add( bad );
  }

  clouds = new Items(-100, 100, -20);

  cityShape = new landscapeItems(width/2, 700, 10, 500);
  spaceShape = new landscapeItems(width/2, -100, 10, 0);
}

void draw() 
{

  println(timer2.counter);
  
  if (startScreen == true && playGame == false)
  {
    startScreen();
  }

  else if (playGame == true)
  {
    timer4.start();
    playGame(); 
    startScreen = false;
    gameOver = false;
  }

}



