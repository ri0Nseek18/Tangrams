class T8 implements Tangrams {

  PShape tngm;
  float x, y;
  float centerX, centerY;
  color c;

  T8() {
    tngm = createShape();
    tngm.beginShape();
    c = #F883D9;
    tngm.fill(c);
    tngm.vertex(300, 200);
    tngm.vertex(200, 300);
    tngm.vertex(100, 400);
    tngm.vertex(200, 300);
    tngm.endShape(CLOSE);
    centerX = 0;
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
