void endScreen()
{
  
  background(0,0,0);
  fill(255,0,0);
  imageMode(CENTER);

  image(replay, width/2, height/2);
  
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
  
 
    
    if((hand_stabilized.x > (400-170)) && (hand_stabilized.x < (400+170)) && (hand_stabilized.y > (250-79)) && (hand_stabilized.y < (250+79)))
    {  
      boolean reset = false;
      timer2.start();
      image(replay2, width/2, height/2); 
//
//      if (timer2.counter >= 50) {
//        startScreen = false;
//        gameOver = false;
//        playGame = true;
//      }
   
    pushMatrix();
    translate(hand_stabilized.x, hand_stabilized.y);
    imageMode(CENTER);
    fill(255,255,255);
    noStroke();
    ellipse(0,0,50,50);
    popMatrix();

  }
  
  else {
      timer.reset();
      timer.counter = 0;
    }
  
}

}

  
  
  

