class Ship
{
  float posX;
  float posY;
  float speedShip;
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

    posX=60;
    posY=50;
    speedShip =5;
  }
  void showShip()
  {
    if (down==true && up==false)
    {
      image(imgDown, posX, posY, 220, 150);
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
    if (down==true)
    {
      posY= posY+speedShip;
    }
    if (up==true)
    {
      posY= posY-speedShip;
    }
    if (right==true)
    {
      posX=posX+speedShip;
    }
    if (left==true)
    {
      posX=posX-speedShip;
    }
    if (posY>height-130)
    {
      posY=posY-speedShip;
    }
    if (posY<-15)
    {
      posY=posY+speedShip;
    }
    if (posX>220)
    {
      posX=posX-speedShip;
    }
    if (posX<-40)
    {
      posX=posX+speedShip;
    }
  }
}