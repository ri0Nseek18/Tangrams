class T3 implements Tangrams {

  PShape tngm;
  float x, y;
  float centerX, centerY;
  color c;

  T3() {
    tngm = createShape();
    tngm.beginShape();
    c = #F70C38;
    tngm.fill(c);
    tngm.vertex(0, 400);
    tngm.vertex(100, 300);
    tngm.vertex(200, 400);
    tngm.endShape(CLOSE);
    centerX=  0;
    centerY = 0;
  }

  void display() {
    shape(tngm);
  }

  float getX()
  {
    return centerX;
  }

  float getY()
  {
    return centerY;
  }
  color getColor()
  {
    return c;
  }
  
  
  String myName()
  {
    return "T1";
  }
}
