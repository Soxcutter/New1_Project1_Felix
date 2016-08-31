Map[] stars =new Map[150];
Ship spaceShip;
Map map1;

void setup()
{
  fullScreen();
  for (int i=0; i<stars.length; i++)
  {
    stars[i] =new Map();
  }
  spaceShip =new Ship();
}

void draw()
{
  background(10, 0, 20); 
  for (int i=0; i<stars.length; i++)
  {
    stars[i].show();
  }
  map1.Borders();
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