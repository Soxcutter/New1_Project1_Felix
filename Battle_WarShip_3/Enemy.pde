class Enemy extends Entity
{
  Enemy()
  {
    super(width-50, random(0, height), null, "Enemy", true);
    super._img=loadImage("Enemy.png");
    super.CreateBody(BodyType.DYNAMIC);
  }

  void update()
  {
    applyForce(new Vec2(-1000,0));
  }
  void applyForce(Vec2 force)
  {
    Vec2 pos = super._body.getWorldCenter();
    super._body.applyForce(force, pos);
  }
}