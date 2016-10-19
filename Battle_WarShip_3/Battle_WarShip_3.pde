import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

Ship spaceShip;
Map map1;

void setup()
{
  fullScreen();
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -100);
  box2d.setContinuousPhysics(true);
  spaceShip =new Ship();
  map1 =new Map();
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

}

void keyReleased()
{
  spaceShip.ControlsRelease();
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