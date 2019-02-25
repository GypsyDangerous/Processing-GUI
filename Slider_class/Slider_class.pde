slider test;
void setup()
{
  size(640, 480);
  test = new slider(0, 360, 0, width/2, height-20, 1);
  colorMode(HSB);
}

void draw()
{
  background(51);
  test.run();
  stroke(255);
  float hu = map((test.value()), (test.minval), (test.maxval), 0, 255);
  fill(hu, 255, 255);
  arc(width/2, height/2, 100, 100, 0, radians(test.value()));
  if(test.changed())
  {
   println(test.value());
  }
}
