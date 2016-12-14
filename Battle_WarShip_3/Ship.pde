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
  boolean _shipFire;
  PVector _moveSpeed;
  PVector pos;
  ArrayList<Box> boxes;

  Ship()
  {
    super(width/5, height/2, null, "Player", true);
    imgNormal =loadImage("Ship_NormalV3.PNG");  
    imgUp =loadImage("Ship_upV3.PNG");    
    imgDown =loadImage("Ship_downV3.PNG");
    super._img=imgNormal;
    super.CreateBody(BodyType.DYNAMIC);
    _moveSpeed = new PVector(110, 110);
    boxes = new ArrayList<Box>();
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
    if (key==' ')
    {
      _shipFire=false;
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
      if (key==' ')
      {
        _shipFire=true;
      }
    }
  }

  void ShipFire()
  {
    if (_shipFire)
    {        
      Box p = new Box(20, height/2);
      boxes.add(p);
    }
    for (Box b : boxes)
    {
      Vec2 wind = new Vec2(2000000000, 0);
      b.applyForce(wind);
    }
    for (Box b : boxes)
    {
      b.display();
    }
    for (int i = boxes.size()-1; i >= 0; i--)
    {
      Box b = boxes.get(i);
      if (b.done())
      {
        boxes.remove(i);
      }
    }
  }

  void applyForce()
  {
  }

  void Shipmovement()
  {
    Vec2 currentVelocity = super._body.getLinearVelocity();
    //Acceleration
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

    //Decceleration
    if (_right == false)
    {
      if (_left ==false)
      {
        currentVelocity.x= currentVelocity.x/1.067;
      }
    }
    if (_up == false)
    {
      if (_down ==false)
      {
        currentVelocity.y= currentVelocity.y/1.067;
      }
    }

    super._body.setLinearVelocity(currentVelocity);
  }
}