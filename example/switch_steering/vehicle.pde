class particle
{
  PVector pos;
  PVector vel;
  PVector acc;
  PVector target;
  PVector zero;
  PVector mouse;

  float d;
  float r;
  float maxspeed = 10;
  float maxforce = 1;
  float hu;

  color fill;


  particle(PVector p, float h)
  {
    d = 5;
    hu = h;
    fill = color(hu, 255, 255);
    pos = new PVector(random(-width, width), random(-height, height));
    vel = new PVector();
    acc = new PVector();
    target = p;
  }

  void update()
  {
    pos.add(vel);
    vel.add(acc);
    acc.mult(0);
  }

  void show()
  {
    d = size.value();
    fill(fill);
    stroke(fill);
    circle(pos.x, pos.y, d);
  }

  void applyForce(PVector force)
  {
    acc.add(force);
  }

  void behaviors()
  {
    PVector arrive = arrive(target);
    mouse = new PVector(mouseX, mouseY);

    PVector flee = flee(mouse);

    arrive.mult(1);
    flee.mult(5);

    applyForce(arrive);
    applyForce(flee);
  }

  PVector arrive(PVector t)
  {
    PVector desired = PVector.sub(t, pos);
    float d = desired.mag();
    float speed = maxspeed;
    if (d < 100)
    {
      speed = map(d, 0, 100, 0, maxspeed);
    }
    desired.setMag(speed);
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxforce);
    return steer;
  }

  PVector flee(PVector t)
  {
    PVector desired = PVector.sub(t, pos);
    float dis = desired.mag();
    if (dis < 100)
    {
      desired.setMag(maxspeed);
      desired.mult(-1);
      PVector steer = PVector.sub(desired, vel);
      steer.limit(maxforce);
      return steer;
    } else
    {
      zero = new PVector();
      return zero;
    }
  }


  PVector steer(PVector t)
  {
    PVector desired = PVector.sub(t, pos);
    float d = desired.mag();
    float speed = maxspeed;
    desired.setMag(speed);
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxforce);
    return steer;
  }

  void ground()
  {
    if (pos.y > height/2)
    {
      pos.y = height/2-r;
      vel.mult(0);
    }
  }
}
