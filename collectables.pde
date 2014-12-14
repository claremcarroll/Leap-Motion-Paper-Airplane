class collectableItems extends Items{

  
  collectableItems (float x, float y, float z) {
    super(x, y, z);
  }
  
  void display(PImage image, boolean rotate)
  {
    counter++;
    rotateVar = rotate;
    if(alive)
    {
      pushMatrix();
      translate(x, y, z);
      scale(.5);
      if (rotate == true)
      {
        rotateZ(radians(counter+=increment));
      }
      
      image(image, 0, 0);
      popMatrix();
    }
  }
  
    boolean checkHit(float hx, float hy, float hz)
  {
     if(alive && dist(x,y,z,hx, hy, hz) < 150)
     {
       println("hit");
       alive = false;
       return true;
     }
     
     else
     return false;
  }
  
  
  
  
}
