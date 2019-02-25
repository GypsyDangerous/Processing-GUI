class slider
{
  float 
    minval, 
    maxval, 
    beginval, 
    handlesize, 
    railweight, 
    len, 
    endx, 
    startx, 
    defval, 
    step, 
    changeval;
  PVector 
    pos, 
    start, 
    end, 
    handle;
  boolean 
    locked, 
    over;
  color
    lockedcol, 
    unlockedcol, 
    rail;


  //create a slider with a min value, max value, begining value, positition and increment size
  slider(float min, float max, float startval, float x, float y, float increment)
  {
    pos = new PVector(x, y);
    minval = min;
    maxval = max;
    defval = startval;
    step = increment;
    len = max/step;
    handlesize = 20;
    railweight = handlesize/3;

    endx = pos.x+(len/2);
    startx = pos.x-(len/2);
    beginval = map(startval, min, max, startx, endx);

    start = new PVector(startx, pos.y);
    end = new PVector(endx, pos.y);
    handle = new PVector(beginval, pos.y);
  }


  //create a slider with a start value, end value, begining value, position and default increment size of 1
  slider(float min, float max, float startval, float x, float y)
  {
    pos = new PVector(x, y);
    minval = min;
    maxval = max;
    defval = startval;
    step = 1;
    len = max/step;
    handlesize = 20;
    railweight = handlesize/3;

    endx = pos.x+(len/2);
    startx = pos.x-(len/2);
    beginval = map(startval, minval, maxval, startx, endx);

    start = new PVector(startx, pos.y);
    end = new PVector(endx, pos.y);
    handle = new PVector(beginval, pos.y);
  }

  //show the slider and allow the slider to be slid
  void run()
  {
    show();
    slide();
  }

  //set the maximum value of the slider
  void setmax(float val)
  {
    maxval = val;
    len = maxval/step;
    endx = pos.x+(len/2);
    startx = pos.x-(len/2);
    end.x = endx;
    start.x = startx;
  }

  //set the minimum value of the slider
  void setmin(float val)
  {
    minval = val;
    len = maxval/step;
    endx = pos.x+(len/2);
    startx = pos.x-(len/2);
    end.x = endx;
    start.x = startx;
  }

  void rail()
  {
    strokeWeight(railweight);
    stroke(rail);
    line(start.x, start.y, end.x, end.y);
  }

  void handle()
  {
    noStroke();
    fill(unlockedcol);
    if (locked || over)
      fill(lockedcol);
    circle(handle.x, handle.y, handlesize);
  }

  //show the slider as a line and the handle as a circle
  void show()
  {
    lockedcol = color(100);
    unlockedcol = color(200);
    rail = color(255);
    rail();
    handle();
  }


  void slide()
  {
    over = mouseY < pos.y+handlesize/2 && mouseY > pos.y-handlesize/2 && mouseX > start.x-handlesize/2 && mouseX < end.x+handlesize/2;// d < handlesize/2;

    if (mousePressed && over)
      locked = true;
    if (!mousePressed)
      locked = false;

    //slide the handle with the mouse
    if (locked)
    {
      handle.x = mouseX;
    }

    //make sure the handle doesn't come off the rail
    handle.x = constrain(handle.x, start.x, end.x);
  }


  //get the value of the slider, between minval and maxval based on the handles position on the slider
  float value()
  {
    return map(handle.x, start.x, end.x, minval, maxval);
  }


  //set the value of the slider to any value. any value below the min will default to the min and any value above the max will default to the max
  void setval(float val)
  {
    beginval = map(val, minval, maxval, startx, endx);
    handle.x = beginval;
  }

  //set the value to the default value
  void reset()
  {
    beginval = map(defval, minval, maxval, startx, endx);
    handle.x = beginval;
  }


  //check if the sliders value has changed
  boolean changed()
  {
    if ((value() != changeval) && !mousePressed)
    {
      changeval = value();
      return true;
    }
    return false;
  }
}
