class Map
{
  float x;
  float y;
  float z;
  float alpha;
  float alphaD =1;

  Map()
  {
    x =random(0, width);
    y =random(0, height);
    z =random(1, 10);
    alpha=random(0, 255);
  }

  void show()
  {
    fill(#F7FF24, alpha);
    ellipse(x, y, z, z);
    alpha+=2*alphaD;
    if (alpha>255)
    {
      alphaD*=-1;
    }
    if (alpha<0)
    {
      alphaD*=-1;
      x =random(0, width);
      y =random(0, height);
      z =random(1, 10);
      alphaD=random(1, 2);
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