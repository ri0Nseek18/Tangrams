class T1 implements Tangrams {

  PShape tngm;
  float x, y;
  float centerX, centerY;
  color c;

  T1() {
    tngm = createShape();
    tngm.beginShape();
    c = #910EEA;
    tngm.fill(c);
    tngm.vertex(0, 0);
    tngm.vertex(200, 200);
    tngm.vertex(0, 400);
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
