/**
 * ControlP5 Controlframe
 *
 * this example shows you how to create separate window to 
 * display and use controllers with  processing 3
 *
 * by Andreas Schlegel, 2016
 * www.sojamo.de/libraries/controlp5
 *
 */
import netP5.*;
import oscP5.*;

 

import toxi.color.*;
import toxi.color.theory.*;
import toxi.util.datatypes.*;

import de.looksgood.ani.*;

// DECLARE A SPOUT OBJECT
Spout spout;
OscP5 oscP5;
import controlP5.*;

ControlFrame cf;

float speed;
float pos;
float c0, c1, c2, c3;color c = color(0, 160, 100);
boolean auto;




int layer1=0;


void settings() {
  size(400, 400, P3D);
}

void setup() {
  cf = new ControlFrame(this, 400, 800, "Controls");
  surface.setLocation(420, 10);
  noStroke();
}

void draw() {
 
  
  
  
  
}