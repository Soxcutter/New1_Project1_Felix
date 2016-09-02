class Map
{
  Stars[] stars =new Stars[150];
  Map()
  {
    for (int i=0; i<stars.length; i++)
    {
      stars[i] =new Stars();
    }
  }
  void starsUpdate()
  {
    for (int i=0; i<stars.length; i++)
    {
      stars[i].show();
    }
  }
  void Borders()
  {
    strokeWeight(5); 
    line(600, width, 600, 0); 
    stroke(100, 20, 20); 
    line(20, width, 20, 0); 
    stroke(0); 
    strokeWeight(0);
  }
}