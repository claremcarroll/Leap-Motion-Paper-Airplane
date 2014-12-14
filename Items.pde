class Items
{
  float x, y, z;
  int counter = 0;
  int increment = 2;
  boolean alive = true;

  // constructor for regular items  
  Items(float x, float y, float z)
  {
    this.x = x;
    this.y = y;
    this.z = z;
  }
 
  
  
  void move(float xOffset, float yOffset, float zOffset)
  {
    this.x += xOffset;
    this.y += yOffset;
    this.z += zOffset;
  }
  
  void display()
  {
      pushMatrix();
      translate(x, y, z);
      ellipse(0,0,100,100);
      popMatrix();
  }
  
  void display(PImage image)
  {
    if(alive)
    {
      pushMatrix();
      translate(x, y, z);
      image(image, 0, 0);
      popMatrix();
    }  
 
  } 
  
  
  boolean checkHit(float hx, float hy, float hz)
  {
     if(alive && dist(x,y,z,hx, hy, hz) < 150)
     {
       alive = false;
       return true;
     }
     
     else
     return false;
  }
  

}
