button test;
void setup()
{
  size(640, 480);
  test = new button(width/2, height/2, 100, 90, "test");
}
void draw()
{
  background(51);
  if(test.hold())
  {
   background(0); 
   test.show();
  }
}
