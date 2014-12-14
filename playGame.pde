void playGame()
{
  background(85, 197, 204);
  int yourTime = 10;
  timeLeft = yourTime - (timer4.counter/30);

  cityShape.display(cityImage);
  spaceShape.display(spaceImage);
  
  clouds.display(cloudImage);
  
  textSize(20);
  fill(255,0,0);
  text("SCORE: " + score, 20, 30);
  //text("TIME: " + (timeLeft), 705, 30);
  
  // DISPLAY FLYING ITEMS   
  for (int i = 0; i < goodItems.size (); i++)
  {
    PImage image1 = good;
    collectableItems good = goodItems.get(i);

    good.display(image1, true);
  }

  for (int i = 0; i < badItems.size (); i++)
  {
    PImage image2 = bad;
    collectableItems bad = badItems.get(i);

    bad.display(image2, false);
  }
  
  // the basic process for working with the leap is to ask it to send us an ArrayList of "Hand" objects
  // that it is seeing in this frame
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

    float yMove = map(hand_stabilized.y, 0, 450, 10, -10);
    float xMove = map(hand_stabilized.x, 0, 800, 10, -10);

    float yMove2 = map(hand_stabilized.y, 0, 450, .5, -.5);
    float xMove2 = map(hand_stabilized.x, 0, 800, .5, -.5);

    float yMove3 = map(hand_stabilized.y, 0, 450, -10, 10);
    float xMove3 = map(hand_stabilized.x, 0, 800, -10, 10);
      
     clouds.move(xMove2, 0, 0);
     cityShape.move(0,yMove2,0);
     spaceShape.move(0,yMove2,0);
     
    // MOVE GOOD ITEMS
    for (int i = 0; i < goodItems.size (); i++)
    {
      PImage image1 = good;
      Items good = goodItems.get(i);

      good.move(0, 0, 10);

      good.move(xMove, 0, 0);

      // items moving left, see if we have to wrap around
      if (xMove < 0)
      {
        if (good.x < -2000)
        {
          good.x = 2000;
        }
      }
      if (xMove > 0)
      {
        if (good.x > 2000)
        {
          good.x = -2000;
        }
      }


      good.move(0, yMove, 0);
      if (yMove < 0)
      {
        if (good.y < -2000)
        {
          good.y = 2000;
        }
      }
      if (yMove > 0)
      {
        if (good.y > 2000)
        {
          good.y = -2000;
        }
      }

      if (good.checkHit(hand_stabilized.x, hand_stabilized.y, 0))
      {
        score++;
      }
    }

    //MOVE BAD ITEMS 
    for (int i = 0; i < badItems.size (); i++)
    {
      PImage image2 = bad;
      Items bad = badItems.get(i);

      bad.move(0, 0, 10);

      bad.move(xMove, 0, 0);

      if (xMove < 0)
      {
        if (bad.x < -2000)
        {
          bad.x = 2000;
        }
      }
      if (xMove > 0)
      {
        if (bad.x > 2000)
        {
          bad.x = -2000;
        }
      }

      bad.move(0, yMove, 0);
      if (yMove < 0)
      {
        if (bad.y < -2000)
        {
          bad.y = 2000;
        }
      }
      if (yMove > 0)
      {
        if (bad.y > 2000)
        {
          bad.y = -2000;
        }
      }


      if (bad.checkHit(hand_stabilized.x, hand_stabilized.y, 0))
      {
        score--;
      }
    }



    pushMatrix();
    translate(hand_stabilized.x, hand_stabilized.y);
    rotateX(radians(180));
    rotate(radians(hand_pitch*(-1)));
    imageMode(CENTER);
    shape(plane);
    popMatrix();
    
    tempX = hand_stabilized.x;
    tempY = hand_stabilized.y;
    
  } else
  {
    
    if (tempX > width-200)
    {
        tempX-=10; 
    }   
    
    else if(tempX < 200)
    {
        tempX+=10;
    }
    
    if (tempY != 450)
    {
        if (tempY > 450)
        {
          tempY=450; 
        }
        
        if (tempY < 450)
        {
          tempY+=10;
        }
      
    }
    
    
    pushMatrix();
    translate(tempX, tempY);
    rotateX(radians(180));
    imageMode(CENTER);
    shape(plane);
    popMatrix();
  }
}
