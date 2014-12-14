void startScreen()
{

  background(0, 0, 0);
  fill(255, 0, 0);
  imageMode(CENTER);
  image(start2, width/2, height/2);


  pushMatrix();
  translate(100, 400);
  imageMode(CENTER);
  textFont(myFont);
  fill(255, 255, 255);
  textSize(20);
  text("See how many coins you can collect in one minute!", 0, 0);
  popMatrix();



  ArrayList<Hand> theHands = leap.getHands();

  // we can then iterate over this array
  if (theHands.size() >= 1)
  {
    // grab a reference to this hand
    Hand currentHand = theHands.get(0);

    // we can extract all sorts of info about this hand now that we have a Hand object to work with
    int     hand_id          = currentHand.getId();
    PVector hand_position    = currentHand.getPosition();
    PVector hand_stabilized  = currentHand.getStabilizedPosition();
    PVector hand_direction   = currentHand.getDirection();
    PVector hand_dynamics    = currentHand.getDynamics();
    float   hand_roll        = currentHand.getRoll();
    float   hand_pitch       = currentHand.getPitch();
    float   hand_yaw         = currentHand.getYaw();
    float   hand_time        = currentHand.getTimeVisible();
    PVector sphere_position  = currentHand.getSpherePosition();
    float   sphere_radius    = currentHand.getSphereRadius();





    if ((hand_stabilized.x > 200) && (hand_stabilized.x < 600) && (hand_stabilized.y > 175) && (hand_stabilized.y < 325))
    {
      timer3.start();
      image(start3, width/2, height/2); 

      if (timer3.counter == 50) {
        startScreen = false;
        playGame = true;
      } 
      


      pushMatrix();
      translate(hand_stabilized.x, hand_stabilized.y);
      imageMode(CENTER);
      fill(255, 255, 255);
      noStroke();
      ellipse(0, 0, 50, 50);
      popMatrix();
    }
   
         else
      {
        timer3.reset();
        timer3.counter = 0;
        image(start2, width/2, height/2);
      } 
  }
}

