class T5 implements Tangrams {

  PShape tngm;
  float x, y;
  float centerX, centerY;
  color c;

  T5() {
    tngm = createShape();
    tngm.beginShape();
    c = #F62BFA;
    tngm.fill(c);
    tngm.vertex(200, 200);
    tngm.vertex(300, 300);
    tngm.vertex(200, 400);
    tngm.vertex(100, 300);
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
