class T2 implements Tangrams {

  PShape tngm;
  float x, y;
  float centerX, centerY;
  color c;

  T2() {
    tngm = createShape();
    tngm.beginShape();
    c = #F7FA60;
    tngm.fill(c);
    //tngm.vertex(0, 0);
    //tngm.vertex(400, 0);
    //tngm.vertex(200, 200);
    tngm.vertex(0, 0);
    tngm.vertex(175, 175);
    tngm.vertex(350,0);//0,0,175,175,350,0
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
