class T6 implements Tangrams {

  PShape tngm;
  float x, y;
  float centerX, centerY;
  color c;

  T6() {
    tngm = createShape();
    tngm.beginShape();
    c = #83D1E8;
    tngm.fill(c);
    tngm.vertex(300, 100);
    tngm.vertex(400, 00);
    tngm.vertex(400, 200);
    tngm.vertex(300, 300);
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
