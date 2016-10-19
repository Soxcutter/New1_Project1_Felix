class Ship extends Entity
{
  PImage imgNormal;
  PImage imgDown;
  PImage imgUp;
  boolean up;
  boolean down;
  boolean left;
  boolean right;
  Ship()
  {
    imgNormal =loadImage("Ship_NormalV3.PNG");    
    imgUp =loadImage("Ship_upV3.PNG");    
    imgDown =loadImage("Ship_downV3.PNG");
    super.CreateBody(BodyType.DYNAMIC);
  }
  void update()
  {
    PVector pos = box2d.getBodyPixelCoordPVector(_body);
    float a = _body.getAngle();
  }
  void showShip()
  {
    if (down==true && up==false)
    {
      image(imgDown, pos.x, posY, 220, 150);
    }
    if (up==true && down==false)
    {
      image(imgUp, posX, posY, 220, 150);
    }
    if (up ==false && down ==false)
    {
      image(imgNormal, posX, posY, 220, 150);
    }    
    if (up ==true && down ==true)
    {
      image(imgNormal, posX, posY, 220, 150);
    }
  }
  void ControlsRelease()
  {
    if (key=='w')
    {
      up=false;
    }
    if (key=='s')
    {
      down=false;
    }
    if (key=='d')
    {
      right=false;
    }
    if (key=='a')
    {
      left=false;
    }
  }
  void Shipmovement()
  {    
    if (keyPressed)
    {
      if (key=='s')
      {
        down=true;
      }
      if (key=='w')
      {
        up=true;
      }
      if (key=='d')
      {
        right=true;
      }
      if (key=='a')
      {
        left=true;
      }
    }
    if (down)
    {
      posY= posY+speedShip;
    }
    if (up)
    {
      posY= posY-speedShip;
    }
    if (right)
    {
      posX=posX+speedShip;
    }
    if (left)
    {
      posX=posX-speedShip;
    }
  }
}