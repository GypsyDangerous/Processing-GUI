class slider
{
  float 
    startval, 
    endval, 
    beginval, 
    d, 
    r,
    sliderweight, 
    len;
  PVector 
    pos, 
    start, 
    end, 
    bobpos;

  slider(float sv, float ev, float bv, float x, float y, float l)
  {
    pos = new PVector(x, y);
    startval = sv;
    endval = ev;
    len = ev/l;
    d = 20;
    r = d/2;
    sliderweight = d/3;

    float endx = pos.x+(len/2);
    float startx = pos.x-(len/2);
    beginval = map(bv, sv, ev, startx, endx);

    start = new PVector(startx, pos.y);
    end = new PVector(endx, pos.y);
    bobpos = new PVector(beginval, pos.y);
  }
  
  slider(float sv, float ev, float bv, float x, float y)
  {
    pos = new PVector(x, y);
    startval = sv;
    endval = ev;
    len = ev/1;
    d = 20;
    r = d/2;
    sliderweight = d/3;

    float endx = pos.x+(len/2);
    float startx = pos.x-(len/2);
    beginval = map(bv, sv, ev, startx, endx);

    start = new PVector(startx, pos.y);
    end = new PVector(endx, pos.y);
    bobpos = new PVector(beginval, pos.y);
  }
  
  void run()
  {
   show();
   slide();
  }

  void show()
  {
    strokeWeight(sliderweight);
    stroke(250);
    line(start.x, start.y, end.x, end.y);
    strokeWeight(1);
    fill(204);
    circle(bobpos.x, bobpos.y, d);
  }

  void slide()
  {
    if (mousePressed && dist(mouseX, mouseY, bobpos.x, bobpos.y) < d)
    {
      bobpos.x = mouseX;
      bobpos.x = constrain(bobpos.x, start.x, end.x);
    }
    if ((mouseY < pos.y+sliderweight/2 && mouseY > pos.y-sliderweight/2 && mouseX > start.x && mouseX < end.x) && !(dist(mouseX, mouseY, bobpos.x, bobpos.y)< d) && mousePressed)
    {
      bobpos.x = mouseX;
      bobpos.x = constrain(bobpos.x, start.x, end.x);
    }
  }

  float value()
  {
    return map(bobpos.x, start.x, end.x, startval, endval);
  }
}
