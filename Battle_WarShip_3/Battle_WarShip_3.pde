import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;

Ship spaceShip;
Map map1;
Enemy badguy;

void setup()
{
  fullScreen();

  box2d = new Box2DProcessing(this);
  box2d.createWorld();  
  box2d.setGravity(0, 0);
  box2d.setContinuousPhysics(true);
  spaceShip =new Ship();
  map1 =new Map();
  badguy =new Enemy();
}  

void draw()
{
  background(10, 0, 20);
  box2d.step();
  map1.Borders();
  map1.starsUpdate();
  spaceShip.showShip();
  spaceShip.Shipmovement();
  spaceShip.update();
  spaceShip.ControlsPressed();
  spaceShip.Draw();
  spaceShip.ShipFire();
  badguy.update();
  badguy.Draw();
}

void keyReleased()
{
  spaceShip.ControlsRelease();
}

void beginContact(Contact cp)
{
  // Get both fixtures
  Fixture f1 = cp.getFixtureA();
  Fixture f2 = cp.getFixtureB();
  // Get both bodies
  Body b1 = f1.getBody();
  Body b2 = f2.getBody();

  // Get our objects that reference these bodies
  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();

  if (o1.getClass() == Box.class && o2.getClass() == Enemy.class) {
    Box p1 = (Box) o1;
    p1.KillBody();
    Entity p2 = (Enemy) o2;
    p2.KillBody();
  }
}


/*
1. Creat ship movement
 2. Creat boundaries for ship
 3. Spawn enemys
 4. Ship shots and colition with enemys
 5. Base game done! yaaaay
 6. Add more features
 7. Upload to steam
 8. Makes millions
 9. Give none to Jhon on Linus
 10. Become a baddass/Millionaire
 */