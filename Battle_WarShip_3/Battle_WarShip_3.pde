Ship spaceShip;
Map map1;

void setup()
{
  fullScreen();
  spaceShip =new Ship();
  map1 =new Map();
}  

void draw()
{
  background(10, 0, 20); 
  map1.Borders();
  map1.starsUpdate();
  spaceShip.showShip();
  spaceShip.Shipmovement();
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