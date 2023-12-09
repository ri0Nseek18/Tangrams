class T7 implements Tangrams {

  PShape tngm;
  float x, y;
  float centerX, centerY;
  color c;

  T7() {
    tngm = createShape();
    tngm.beginShape();
    c = #FF8521;
    tngm.fill(c);
    tngm.vertex(400, 200);
    tngm.vertex(400, 400);
    tngm.vertex(200, 400);
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
