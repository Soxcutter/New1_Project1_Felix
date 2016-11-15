class Box {

  Body body;
  float w;
  float h;

  void setup()
  {
    spaceShip =new Ship();
  }

  Box(float x, float y)
  {
    w = 10;
    h = w;
    x = spaceShip.pos.x+spaceShip.pos.x/2;
    y = spaceShip.pos.y;
    makeBody(new Vec2(x, y), w, h);
  }

  void killBody()
  {
    box2d.destroyBody(body);
  }

  boolean done()
  {
    Vec2 pos = box2d.getBodyPixelCoord(body);  
    if (pos.y > width+10) {
      killBody();
      return true;
    }
    return false;
  }

  void applyForce(Vec2 force)
  {
    Vec2 pos = body.getWorldCenter();
    body.applyForce(force, pos);
  }

  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();

    rectMode(CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    fill(175);
    stroke(0);
    rect(0, 0, w, h);
    popMatrix();
  }

  void makeBody(Vec2 center, float w_, float h_)
  {
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w_/2);
    float box2dH = box2d.scalarPixelsToWorld(h_/2);
    sd.setAsBox(box2dW, box2dH);

    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.2;

    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));
    bd.angle = random(TWO_PI);

    body = box2d.createBody(bd);
    body.createFixture(fd);
  }
}