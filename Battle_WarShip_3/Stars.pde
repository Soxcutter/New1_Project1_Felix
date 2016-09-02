class Stars
{
  float x;
  float y;
  float z;
  float alpha;
  float alphaD =1;

  Stars()
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
}