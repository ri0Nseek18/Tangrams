import processing.sound.*;
import picking.*;

Picker picker;

int id;
boolean pactive = true;
boolean colorize = true;
SoundFile sound;

T1 t1;
T2 t2;
T3 t3;
T4 t4;
T5 t5;
T6 t6;
T7 t7;

color c;

PImage puzzle1;
PImage puzzle2;
PImage puzzle3;

float dR = 5;
float dG = 3;
float dB = 8;
float r = 80;
float g = 20;
float b = 255;

boolean p1active = true;
boolean p2active = false;
boolean p3active = false;

int number = 9;
int ptrad = 10;

float[] xpos = new float[number];
float[] ypos = new float[number];
color[] colors = new color[number];
int[] rotation = new int[number];

ArrayList<Tangrams> tangrams;

/**
 * Sets up the inital canvas and loads the puzzle images
 **/
void setup() {
  background(255);
  sound = new SoundFile(this, "LinkMusic.mp3");
  sound.play();
  puzzle1 = loadImage("puzzle1.png");
  puzzle2 = loadImage("puzzle2.png");
  puzzle3 = loadImage("puzzle3.png");
  puzzle1.resize(950, 580);
  puzzle2.resize(700, 700);
  puzzle3.resize(950, 620);
  size(1400, 750, P3D);
  tangrams = new ArrayList<Tangrams>();
  t1 = new T1();
  tangrams.add(t1);
  t2 = new T2();
  tangrams.add(t2);
  t3 = new T3();
  tangrams.add(t3);
  t4 = new T4();
  tangrams.add(t4);
  t5 = new T5();
  tangrams.add(t5);
  t6 = new T6();
  tangrams.add(t6);
  t7 = new T7();
  tangrams.add(t7);
  print("Number of shapes added = ", tangrams.size());
  picker = new Picker(this);
  initScene();
}
/**
 * Redraws every piece every frame to keep track of movement, rotation, etc
 **/
void draw() {

  dR = changeRGB(r, dR);
  dG = changeRGB(g, dG);
  dB = changeRGB(b, dB);

  background(255);

  drawStarter();
  if (p1active == true)
  {
    set(500, 100, puzzle1);
  }
  if (p2active == true)
  {
    set(700, 0, puzzle2);
  }
  if (p3active == true)
  {
    set(400, 50, puzzle3);
  }
  for (int i = 0; i < number; i++)
  {
    pushMatrix();
    picker.start(i);
    translate(xpos[i], ypos[i]);
    rotate(radians(rotation[i]));
    switch(i) {
    case 0:
      drawT1();
      break;
    case 1:
      drawT2();
      break;
    case 2:
      drawT3();
      break;
    case 3:
      drawT4();
      break;
    case 4:
      drawT5();
      break;
    case 5:
      drawT6();
      break;
    case 6:
      drawT7();
      break;
    case 7:
      drawT8();
      break;
    }

    popMatrix();
  }
  picker.stop();

  fill(r+=dR, g+=dG, b+=dB);
  textSize(64);
  text("WELCOME TO TANGRAMS", 10, 50);
  textSize(32);
  text("Press 1, 2, or 3 to change puzzles", 10, 100);
  textSize(32);
  text("Press 'space' to reset, press 'p' to flip parallelogram", 10, 150);
  textSize(16);
  text("Music from Zelda 2", 900, 50);

  if (mousePressed) {
  } // make sure the picked object doesn't change while dragging
  else {
    if (mouseY > 0 && mouseY <height) { // prevent ArrayIndexOutOfBoundsException-bug in picker library
      id = picker.get(mouseX, mouseY);
    }
  }
}

/**
 * This method checks if any of the described keys are pressed, then does
 * a specific task based on the key pressed.
 **/
void keyPressed() {
  if (key == ' ') {
    initScene();
  }
  if (key == 'p')
  {
    pactive = !pactive;
  }
  if (key == '1')
  {
    p1active = true;
    p2active = false;
    p3active = false;
  }
  if (key == '2')
  {
    p1active = false;
    p2active = true;
    p3active = false;
  }
  if (key == '3')
  {
    p1active = false;
    p2active = false;
    p3active = true;
  }
}

/**
 * Checks if the mouse is dragged, and finds the distance to move a piece on left click, and
 * how much to rotate a piece on a right click
 **/
void mouseDragged() {
  if (id != -1) {
    // movement
    if (mouseButton == LEFT) {
      float xDif = xpos[id] - mouseX;
      float yDif = ypos[id] - mouseY;
      float xMov = mouseX - pmouseX;
      float yMov = mouseY - pmouseY;
      xpos[id] = mouseX + xDif + xMov;
      ypos[id] = mouseY + yDif + yMov;
    }
    // rotation
    if (mouseButton == RIGHT) {
      int xMov = mouseX - pmouseX;
      rotation[id] = rotation[id] + xMov;
    }
  }
}

/**
 * Forcibly sets rotation to 45 degree angles when a piece is released
 **/
void mouseReleased() {
  if (id != -1) {
    // force 45 degree angles
    rotation[id] = round(rotation[id]/45.0)*45;
    // make sure nothing goes off screen
    xpos[id] = constrain(xpos[id], 0, width);
    ypos[id] = constrain(ypos[id], 0, height);
  }
}

/**
 * Initializes piece locations in the xpos and ypos arrays
 **/
void initScene()
{
  for (int i = 0; i < number; i++)
  {
    rotation[i]=0;
    switch(i) {
    case 0:
      xpos[0] = 100;
      ypos[0] = 400;
      break;
    case 1:
      xpos[1] = 220;
      ypos[1] = 280;
      break;
    case 2:
      xpos[2] = 120;
      ypos[2] = 560;
      break;
    case 3:
      xpos[3] = 280;
      ypos[3] = 400;
      break;
    case 4:
      xpos[4] = 220;
      ypos[4] = 500;
      break;
    case 5:
      xpos[5] = 370;
      ypos[5] = 350;
      break;
    case 6:
      xpos[6] = 360;
      ypos[6] = 540;
      break;
    case 7:
      xpos[7] = 370;
      ypos[7] = 350;
    default:
    }
  }
}

/**
 * Draws the green square behind the pieces, as well as the lines that divide the pieces
 **/
void drawStarter()
{
  fill(230, 13, 249);
  rectMode(CORNER);
  rect(20, 200, 400, 400);
  line(20, 200, 320, 500);
  line(420, 200, 20, 600);
  line(320, 300, 320, 500);
  line(420, 400, 220, 600);
  line(120, 500, 220, 600);
}

/**
 * Draws the large triangle
 **/
void drawT1() {
  if (!colorize)
    c = #000000;
  else
    c = #910EEA;
  fill(c);
  circle(0, 0, ptrad);
  triangle(-80, -200, 120, 0, -80, 200);
}

/**
 * Draws the second large triangle
 **/
void drawT2() {
  c = #F7FA60;
  fill(c);
  circle(0, 0, ptrad);
  triangle(0, 120, -200, -80, 200, -80);
}

/**
 * Draws the small triangle
 **/
void drawT3() {
  c = #F70C38;
  fill(c);
  circle(0, 0, ptrad);
  triangle(-100, 40, 100, 40, 0, -60);
}

/**
 * Draws the second small triangle
 **/
void drawT4() {
  c = #450CE8;
  fill(c);
  circle(0, 0, ptrad);
  triangle(-60, 0, 40, -100, 40, 100);
}

/**
 * Draws the square
 **/
void drawT5() {
  c = #F62BFA;
  fill(c);
  circle(0, 0, ptrad);
  quad(-100, 0, 0, 100, 100, 0, 0, -100);
}

/**
 * Draws the parellolgram
 **/
void drawT6() {
  if (pactive)
  {
    if (!colorize)
      c = #000000;
    else
      c = #83D1E8;
    fill(c);
    circle(0, 0, ptrad);
    quad(-50, -50, 50, -150, 50, 50, -50, 150);
    xpos[7] = xpos[5];
    ypos[7] = ypos[5];
  }
}

/**
 * Draws the medium triangle
 **/
void drawT7() {
  c = #FF8521;
  fill(c);
  circle(0, 0, ptrad);
  triangle(-140, 60, 60, 60, 60, -140);
}

/**
 * Draws the parellolgram again, but flipped
 **/
void drawT8() {
  if (!pactive) {
    if (!colorize)
      c = #000000;
    else
      c = #83D1E8;
    fill(c);
    circle(0, 0, ptrad);
    quad(-50, 50, 50, 150, 50, -50, -50, -150);
    xpos[5] = ypos[7];
    ypos[5] = xpos[7];
  }
}

/*
* Method that controls the color changing of the text
*/

public float changeRGB(float val, float val2) {
  if (val < 0 || val > 255)
    return val2 * -1;
  else
    return val2;
}
