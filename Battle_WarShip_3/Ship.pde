/*
Use .max to make max velocety
and .add to add to current velocety.
If I add without max ship will eventually go light speed.
*/

class Ship extends Entity
{
  PImage imgNormal;
  PImage imgDown;
  PImage imgUp;
  boolean up;
  boolean down;
  boolean left;
  boolean right;
  PVector pos;

  Ship()
  {
    super(width/5, height/2, null, "Player", true);
    imgNormal =loadImage("Ship_NormalV3.PNG");  
    imgUp =loadImage("Ship_upV3.PNG");    
    imgDown =loadImage("Ship_downV3.PNG");
    super._img=imgNormal;
    super.CreateBody(BodyType.DYNAMIC);
  }
  void update()
  {
    pos = box2d.getBodyPixelCoordPVector(super._body);
    float a = super._body.getAngle();
  }
  void showShip()
  {
    if (down && !up)
    {
      super._img= imgDown;
    }
    if (up && !down)
    {
      super._img= imgUp;
    }
    if (!up && !down)
    {
      super._img= imgNormal;
    }    
    if (up && down)
    {
      super._img= imgNormal;
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

  void ControlsPressed()
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
  }


  void Shipmovement()
  {
    if (down)
    {
      pos.y= pos.y+20;
    }
    if (up)
    {
      pos.y= pos.y-20;
    }
    if (right)
    {
      pos.x=pos.x+20;
    }
    if (left)
    {
      pos.x=pos.x-20;
    }
  }
}