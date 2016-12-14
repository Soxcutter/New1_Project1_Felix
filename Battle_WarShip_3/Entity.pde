class Entity
{
  private float _x;
  private float _y;
  private PImage _img;
  private String _type;
  private boolean _isActive;
  private Body _body;
  
  Entity()
  {
    _x = 0;
    _y = 0;
    _img  = null;
    _type = "Unknown Entity"; 
    _isActive = false;
  }
  
  Entity(float x, float y, PImage img, String type, boolean isActive)
  {
    _x = x;
    _y = y;
    _img  = img;
    _type = type;
    _isActive = isActive;
  }
  
  private void CreateBody(BodyType bType)
  {
    //This is the scalar size of the box that we're going to create
    // we can grab these from an image OR use typical width & height of rectangle
    int imgH = _img.height;
    int imgW = _img.width;
    
    
    //Here we create the shape by FIRST converting the scalar size of our image
    // to box2d's WORLD size. We divide by 2 because our x,y coordinate are located
    // in the center of the image. After we have the dimensions in box2d coordinates
    // we define the shape's size by using setAsBox()
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(imgW/2);
    float box2dH = box2d.scalarPixelsToWorld(imgH/2);
    sd.setAsBox(box2dW, box2dH);
    

    //Fixtures are used to describe the size, shape, and material properties of an object in the 
    // physics scene. One body can have multiple fixtures attached to it, and the center of mass 
    // of the body will be affected by the arrangement of its fixtures.
    // More info: http://www.iforce2d.net/b2dtut/fixtures  (Code is in C++ but should be readable)
    
    //Define a fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    // Parameters that affect physics check more info link for more detail
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = .3;

    //BodyDefs are a body definition holds all the data needed to construct a rigid body. 
    // You can safely re-use body definitions. Shapes are added to a body after construction.

    //Define the body and make it from the shape
    BodyDef bd = new BodyDef();
    bd.type = bType;
    
    //This is where we set the initial position of the _body (entity)
    bd.position.set(box2d.coordPixelsToWorld(_x, _y));

    _body = box2d.createBody(bd);
    _body.createFixture(fd);
  }
  
  public void Draw()
  {
    //First we get the position of where the body is. This function will return a PVector data type. 
    // You can think of this as 1 data type that holds the x and y coordinates of our body (entity)
    // inside of it.
    PVector pos = box2d.getBodyPixelCoordPVector(_body);
    // Get its angle of rotation from the body. This will let us know if we need to draw it rotated or not
    float a = _body.getAngle();

    imageMode(CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    image(_img, 0, 0);     //We draw it at 0,0 because we've already TRANSLATED to the correct
    popMatrix();                 // x,y using the translate function and x,y returned from box2d
  }
  
  private void KillBody()
  {
    box2d.destroyBody(_body);
    //This object can now be safely deleted from an ArrayList
  }



  boolean GetActive() { return _isActive; }
  void    SetActive(boolean state) { _isActive = state; }
  
  Vec2    GetPosition()    { return box2d.getBodyPixelCoord(_body); }
  Vec2    GetWorldCenter() { return _body.getWorldCenter(); } 
  void    SetPosition(float x, float y) { }
  
  String  GetType() { return _type; }
  
}