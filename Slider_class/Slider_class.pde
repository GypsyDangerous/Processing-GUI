slider test;
void setup()
{
  size(640, 480);
  test = new slider(0, TWO_PI, 0, width/2, height-20, radians(1));
  colorMode(HSB);
}
void draw()
{
  background(51);
  stroke(255);
  test.run();
  println(test.value());
  fill(degrees(test.value())%255, 255, 255);
  arc(width/2, height/2, 100, 100, 0, test.value());
}
