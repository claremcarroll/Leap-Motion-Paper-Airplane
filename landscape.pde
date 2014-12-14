class landscapeItems extends Items{
  
  float landscapeLimit = 0;
  boolean landscapeItem = false;
  
  
  landscapeItems (float x, float y, float z, float landscapeLimit) 
  {
    super(x, y, z);
    this.landscapeItem = true;
    this.landscapeLimit = landscapeLimit;
  }
  
  void move(float xOffset, float yOffset, float zOffset)
  {
    this.x += xOffset;
    this.y += yOffset;
    this.z += zOffset;
  
    if (landscapeItem)
    {
      // prevent us from moving too far up or down
      if (this.landscapeLimit == 500)
      {
        if (this.y < landscapeLimit)
          {
            this.y = 500;
          }
      }  
  
      if (this.landscapeLimit == 0)
      {
        if (this.y > landscapeLimit)
          {
            this.y = 0;
          }
      }  
    }

  }

  
  
}
