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
  boolean _up;
  boolean _down;
  boolean _left;
  boolean _right;
  PVector _moveSpeed;
  PVector pos;

  Ship()
  {
    super(width/5, height/2, null, "Player", true);
    imgNormal =loadImage("Ship_NormalV3.PNG");  
    imgUp =loadImage("Ship_upV3.PNG");    
    imgDown =loadImage("Ship_downV3.PNG");
    super._img=imgNormal;
    super.CreateBody(BodyType.DYNAMIC);
    _moveSpeed = new PVector(50, 0);
  }
  void update()
  {
    pos = box2d.getBodyPixelCoordPVector(super._body);
    float a = super._body.getAngle();
  }
  void showShip()
  {
    if (_down && !_up)
    {
      super._img= imgDown;
    }
    if (_up && !_down)
    {
      super._img= imgUp;
    }
    if (!_up && !_down)
    {
      super._img= imgNormal;
    }    
    if (_up && _down)
    {
      super._img= imgNormal;
    }
  }
  void ControlsRelease()
  {
    if (key=='w')
    {
      _up=false;
    }
    if (key=='s')
    {
      _down=false;
    }
    if (key=='d')
    {
      _right=false;
    }
    if (key=='a')
    {
      _left=false;
    }
  }

  void ControlsPressed()
  {
    if (keyPressed)
    {
      if (key=='s')
      {
        _down=true;
      }
      if (key=='w')
      {
        _up=true;
      }
      if (key=='d')
      {
        _right=true;
      }
      if (key=='a')
      {
        _left=true;
      }
    }
  }


  void Shipmovement()
  {
    Vec2 currentVelocity = super._body.getLinearVelocity();

    if (_right)
    {
      currentVelocity.x = 1 * _moveSpeed.x;
    }
    if (_left)
    {
      currentVelocity.x = -1 * _moveSpeed.x;
    }
    if (_up)
    {
      currentVelocity.y = 1 * _moveSpeed.y;
    }
    if (_down)
    {
      currentVelocity.y = -1 * _moveSpeed.y;
    }

    super._body.setLinearVelocity(currentVelocity);
  }
}