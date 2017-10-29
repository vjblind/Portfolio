import netP5.*; //<>//
import oscP5.*;





import com.thomasdiewald.pixelflow.java.*;
import com.thomasdiewald.pixelflow.java.accelerationstructures.*;
import com.thomasdiewald.pixelflow.java.antialiasing.FXAA.*;
import com.thomasdiewald.pixelflow.java.antialiasing.GBAA.*;
import com.thomasdiewald.pixelflow.java.antialiasing.SMAA.*;
import com.thomasdiewald.pixelflow.java.dwgl.*;
import com.thomasdiewald.pixelflow.java.fluid.*;
import com.thomasdiewald.pixelflow.java.geometry.*;
import com.thomasdiewald.pixelflow.java.imageprocessing.*;
import com.thomasdiewald.pixelflow.java.imageprocessing.filter.*;
import com.thomasdiewald.pixelflow.java.render.skylight.*;
import com.thomasdiewald.pixelflow.java.rigid_origami.*;
import com.thomasdiewald.pixelflow.java.sampling.*;
import com.thomasdiewald.pixelflow.java.softbodydynamics.*;
import com.thomasdiewald.pixelflow.java.softbodydynamics.constraint.*;
import com.thomasdiewald.pixelflow.java.softbodydynamics.particle.*;
import com.thomasdiewald.pixelflow.java.softbodydynamics.softbody.*;
import com.thomasdiewald.pixelflow.java.utils.*;




 DwPixelFlow context;

  DwFilter filter;
  


import controlP5.*;
import java.util.*;


import hype.*;
import hype.extended.behavior.*;
import hype.extended.colorist.*;
import hype.extended.layout.*;
import hype.interfaces.*;
import hype.extended.behavior.HSwarm;
import hype.extended.behavior.HTimer;
import hype.extended.colorist.HColorPool;

import java.util.HashMap;
import java.util.Map;
import javax.sound.midi.Receiver;
import javax.sound.midi.MidiMessage;


import toxi.color.*;
import toxi.color.theory.*;
import toxi.util.datatypes.*;

import de.looksgood.ani.*;

// DECLARE A SPOUT OBJECT
Spout spout;
OscP5 oscP5;
/* a NetAddress contains the ip address and port number of a remote location in the network. */
NetAddress myBroadcastLocation; 



ControlP5 cp5;
Slider2D sl, sl1;

Ani diameterAni;  




//layer4//
int steps = 15;
float xOff, yOff;
PVector[] points;
PGraphics rest;

float xx,yy, x , y ,phi ,t,T,i;int x1,y1,x2,y2=0;


// The shader that will contain the blending code
PShader myShader;
// Let's give a name to each blend mode
static final int BL_DARKEN        =  0;
static final int BL_MULTIPLY      =  1;

static final int BL_COLORBURN     =  2;
static final int BL_LINEARBURN    =  3;
static final int BL_DARKERCOLOR   =  4;

static final int BL_LIGHTEN       =  5;
static final int BL_SCREEN        =  6;
static final int BL_COLORDODGE    =  7;
static final int BL_LINEARDODGE   =  8;
static final int BL_LIGHTERCOLOR  =  9;

static final int BL_OVERLAY       = 10;
static final int BL_SOFTLIGHT     = 11;
static final int BL_HARDLIGHT     = 12;
static final int BL_VIVIDLIGHT    = 13;
static final int BL_LINEARLIGHT   = 14;
static final int BL_PINLIGHT      = 15;
static final int BL_HARDMIX       = 16;

static final int BL_DIFFERENCE    = 17;
static final int BL_EXCLUSION     = 18;
static final int BL_SUBSTRACT     = 19;
static final int BL_DIVIDE        = 20;

static final int BL_HUE           = 21;
static final int BL_COLOR         = 22;
static final int BL_SATURATION    = 23;
static final int BL_LUMINOSITY    = 24;
//Square square[]=new Square[100];
float px=0, py=0, s = 0, h=80;//sensor
int grid=11;
int gridx=11;int gridy=11;int setx=50;int sety=11;
int startx=0,starty=0;
int endx=0,endy=0;
int nx = gridx;
int ny = gridy;


int setnx = 50;
int setny = 11;
float[][] setact = new float [setnx][setny];
float rand = 0;

int easing=0;
int ii=0, layer1=0, layer2=14,layer3=0,layer4=0,layershape,title=1,Brightness=255,diagonal=0,rotaniz=0, rotani=0, hozisontalr=0,verticalr=0,speedmat=1,alphashape=255;
float[] ppx=new float[100], ppy=new float[100];//sensor
 
HColorPool    colorsx;
float framcountc,speed=1,sizeshape=1,kick=0;

boolean  framcountb=true,bw=false;
float[][] s0 = new float [gridx][gridy];
float[][] s1 = new float [gridx][gridy];
float[][] ss = new float [gridx][gridy];
boolean[][] act = new boolean [gridx][gridy];
boolean reverser=false,stroke1=false,fill1=true,shape2=true,glitch1=false;

int cl1 = color(0), cl2 = color(0);

Flock flock;
String strategycolor="COMPLEMENTARY";
String range="BRIGHT";
TColor col = ColorRange.DARK.getColor();
ColorTheoryStrategy strategy = ColorTheoryRegistry.getStrategyForName("COMPOUND");


ColorList colocrs ;
TColor cocl = ColorRange.DARK.getColor();
TColor currentColor;   
TColor c=null; 
TColor selectedColor = null;

Chart myChart;

int xPos = 0;
int yPos = 0;

  
  PGraphics2D pg_render;
  PGraphics2D pg_luminance;
  PGraphics2D pg_bloom;
  
  

PFont fontawesome,pff;
PGraphics[] Title= new  PGraphics[5];
  PImage imgsketch;

///////////////////////////////////////////////////////////////////////////////////////////////
//PShape//
///////////////////////////////////////////////////////////////////////////////////////////////

PShape bot;
PShape[] drawing=new PShape [20] ;


PShape[] l1shape=new PShape [20] ;


PShape cross;

void settings() {
  size(1280, 720, P3D);
  
}
void setup() {

  strokeCap(ROUND);
 for (int x=0; x<5; x++) Title[x]= createGraphics(width, height);
  smooth(8);
  
  // Initialize the Loom with a tempo of 120 BPM.
   // Load the shader file from the "data" folder
  myShader = loadShader( "shader.glsl" );
  
  // Pass the dimensions of the viewport to the shader
  myShader.set( "sketchSize", float(width), float(height) );
  
  //  pat.every(12, pat3.repeat(4));
    
     
     flock = new Flock();
  // Add an initial set of boids into the system
  for (int i = 0; i < 200; i++) {
    Boid b = new Boid(width/2,height/2);
    flock.addBoid(b);
  }
    
  fontawesome =loadFont("Italic-Bricks-200.vlw");
  pff= createFont("data/fontawesome-webfont.ttf",20);
  cf = new ControlFrame(this, 400, 800, "Controls");
  surface.setLocation(420, 10);
  noStroke();
  
    DwPixelFlow context;

  DwFilter filter;

  
  
    pg_render = (PGraphics2D) createGraphics(width, height, P2D);
    pg_render.smooth(8);
    
    pg_luminance = (PGraphics2D) createGraphics(width, height, P2D);
    pg_luminance.smooth(8);
    
    pg_bloom = (PGraphics2D) createGraphics(width, height, P2D);
    pg_bloom.smooth(8);


  // This is the crucial piece: every 4 bars, shift the 12-beat pattern left by 1.
  //pattern2.every(4, new Transforms.Shift(-1, 12));


 

//  hint(DISABLE_OPTIMIZED_STROKE);
  
  textureMode(NORMAL);
  cp5 = new ControlP5(this);

/* create a new instance of oscP5. 
   * 12000 is the port number you are listening for incoming osc messages.
   */
 
  oscP5 = new OscP5(this,12345);

  /* create a new NetAddress. a NetAddress is used when sending osc messages
   * with the oscP5.send method.
   */
  
  /* the address of the osc broadcast server */
  myBroadcastLocation = new NetAddress("127.0.0.1",32000);
  // create a new button with name 'buttonA'


 // create a toggle and change the default look to a (on/off) switch look
 
     
     
     
     rest = createGraphics(width, height);
  // create an array to store the points
  points = new PVector[steps];
  for (int i =0; i< points.length; i++) {
    points[i] = new PVector();
  }  

 
     
  // CREATE A NEW SPOUT OBJECT HERE
  spout = new Spout();

  // INITIALIZE A SPOUT SENDER HERE
  spout.initSender("Spout Processing", width, height);




  colorsx = new HColorPool(#FFFFFF, #F7F7F7, #ECECEC, #333333, #0095a8, #00616f, #FF3300, #FF6600);


  for (int x=0; x<grid; x++)
    for (int y=0; y<grid; y++) {
      s0[x][y]=grid;
      s1[x][y]=grid;
      ss[x][y]=grid;
      act[x][y]=false;
    } 

  // you have to call always Ani.init() first!
  Ani.init(this);






  ColorTheoryStrategy strategy = ColorTheoryRegistry.COMPLEMENTARY;


  colocrs = ColorList.createUsingStrategy(strategy, cocl);

  TColor col = ColorRange.DARK.getColor();



  ColorList colList = ColorList.createUsingStrategy(strategy, col);


  for (Iterator i = colList.iterator(); i.hasNext(); ) {
    c = (TColor) i.next();
    // colocrs.add(c);
    selectedColor = c;
  }
  
  
  
  
  
    bot = loadShape("bot1.svg");
    
    
 for(int u=0 ;u<4;u+=1)
 {
drawing[u]  = loadShape("drawing"+u+".svg");} 



 for(int u=0 ;u<3;u+=1)
 {
l1shape[u]  = loadShape("l1shap"+u+".svg");} 
    
 
 
 
 
 
 
///////////////////////////////////////////////////////////////////////////////////////////////
//3d//
/////////////////////////////////////////////////////////////////////////////////////////////// 
 
cross = loadShape("cross.obj");
 
    
}














///////////////////////////////////////////////////////////////////////////////////////////////
//matrix//
///////////////////////////////////////////////////////////////////////////////////////////////

void draw() {
  

 // pg_render.beginDraw();
    ///{
  
 
 
   // unshift: add data from left to right (first in)
  //myChart.unshift("incoming", (sin(frameCount*0.1)*20));
  
  
  kick=  sin(frameCount*0.1)*speed ;
  // push: add data from right to left (last in)
  myChart.push("incoming", (kick));
 

  background(0);
  fill(0, 05);
  //rect(400, 300, 800, 600);
  rectMode(CENTER) ;
  noFill();
 // stroke(250, 50);
 /* for (int x=0; x<10; x++)
    for (int y=0; y<10; y++)
      rect(40+x*80, 40+y*80, 80, 80);

  fill(250, 80);
  for (int x=0; x<10; x++)
    for (int y=0; y<10; y++) {

      fill(20, 240, 100);
      stroke(20, 240, 100);
      if  (dist(x*80, y*80, 350+px, 250+py)<100) { 
        s=10;
      } else s=0;

      //rect(40+x*80,y*80,80-s,80-s);
    }
*/

  //ArrayList<ColorTheoryStrategy> strategies = ColorTheoryRegistry.getRegisteredStrategies();

  ////////////////////layer1////////////////////////////////////////////////
  // fill(cl1);    
  ///////////////////////////////////////////////////////////////////////////////////////////////
  //matrix//
  ///////////////////////////////////////////////////////////////////////////////////////////////
 strokeWeight(3);
  switch(layer1) {
      case 0:

    
    
    break;
    
    
    
      case 1 :
fill(cl2,alphashape);
rect(width*0.5,abs(framcountc*10)%height,width,100+bpm) ;
    break;  
    case 2 :
fill(cl2,alphashape);
rect(width*0.5,height-(framcountc*10)%height,width,100+bpm) ;
    break;   
case 3 :
fill(cl2,alphashape);
rect((framcountc*10)%width  ,height*0.5,100,height) ;

    break;  
    case 4 :
fill(cl2,alphashape);
rect(width-(framcountc*10)%width  ,height*0.5,100,height) ;

    break;   
       
   case 5 :
fill(cl2,alphashape);
ellipse(width*0.5,height*
0.5,height-(framcountc*10)%height,height-(framcountc*10)%height) ;
    break;  
 
    
    
       case 6 :
fill(cl2,alphashape);
ellipse(width*0.5,height*
0.5,(framcountc*10)%height,(framcountc*10)%height) ;
    break;  
 

   
      case 7 :
fill(cl2,alphashape);
ellipse(width*0.5,height*
0.5,height-(framcountc*10)%height,height-(framcountc*10)%height) ;

fill(0);
ellipse(width*0.5,height*
0.5,+bpm+(height-(framcountc*10)%height)*0.5,+bpm+(height-(framcountc*10)%height)*0.5) ;
    break;  
 
    
    
       case 8 :
fill(cl2,alphashape);
ellipse(width*0.5,height*
0.5,(framcountc*10)%height,(framcountc*10)%height) ;


fill(0);
ellipse(width*0.5,height*
0.5,+bpm+(framcountc*10)%height*0.5,+bpm+(framcountc*10)%height*0.5);
    break;  
   
   
   
      case 9 :
fill(cl2,alphashape);
rect(width*0.5,height*
0.5,height-(framcountc*10)%height,height-(framcountc*10)%height) ;

fill(0);
rect(width*0.5,height*
0.5,+bpm+(height-(framcountc*10)%height)*0.5,+bpm+(height-(framcountc*10)%height)*0.5) ;
    break;  
 
    
    
       case 10 :
fill(cl2,alphashape);
rect(width*0.5,height*
0.5,(framcountc*10)%height,(framcountc*10)%height) ;


fill(0);
rect(width*0.5,height*
0.5,+bpm+(framcountc*10)%height*0.5,+bpm+(framcountc*10)%height*0.5);
    break;    
   
   
       case 11 :
fill(cl2,alphashape);
ellipse(width*0.5,height*
0.5,height-(framcountc*10)%height,height-(framcountc*10)%height) ;

fill(0);
rect(width*0.5,height*
0.5,+bpm+(height-(framcountc*10)%height)*0.5,+bpm+(height-(framcountc*10)%height)*0.5) ;
    break;  
 
    
    
       case 12 :
fill(cl2,alphashape);
ellipse(width*0.5,height*
0.5,(framcountc*10)%height,(framcountc*10)%height) ;


fill(0);
rect(width*0.5,height*
0.5,+bpm+(framcountc*10)%height*0.5,+bpm+(framcountc*10)%height*0.5);
    break;     
   
   
   
   
   
   
        case 13 :
        
fill(cl2,alphashape);
ellipse(width*0.5,height*
0.5,(framcountc*10)%height,(framcountc*10)%height) ;

pushMatrix();
fill(0);
     translate((width*0.5),(height*0.5)); 
   rotate(radians(rotani));
  translate(-(width*0.5),-(height*0.5)); 
    translate((width*0.5),(height*0.5)); 
   
rect( 0,0,+bpm+(framcountc*10)%height*0.5,+bpm+(framcountc*10)%height*0.5);
popMatrix();
    
    break;    
    
    
    
    
           case 14 :
           
           
fill(cl2,alphashape);
pushMatrix();
    translate((width*0.5),(height*0.5)); 
   rotate(radians(rotani));
  translate(-(width*0.5),-(height*0.5)); 
    translate((width*0.5),(height*0.5)); 
   
rect( 0,0,+bpm+(framcountc*10)%height ,+bpm+(framcountc*10)%height );


fill(0);
rect(0,0,+bpm+(framcountc*10)%height*0.5,+bpm+(framcountc*10)%height*0.5);

popMatrix();
    
    break;  

  
          case 15 :
           
           
fill(cl2,alphashape);
pushMatrix();
    translate((width*0.5),(height*0.5)); 
   rotate(radians(rotani));
  translate(-(width*0.5),-(height*0.5)); 
    translate((width*0.5),(height*0.5)); 


       
        float radius15 = +bpm+(framcountc*10)%height ;
        float angle15 = TWO_PI /3;

    beginShape();
        for (float a = PI/8; a < TWO_PI; a += angle15) {
          float vx = 0 + cos(a) * radius15;
          float vy = 0 + sin(a) * radius15;
          vertex(vx, vy);
        }
        endShape(CLOSE);
fill(0);
          radius15 = +bpm+(framcountc*10)%height*0.5;
   beginShape();
        for (float a = PI/8; a < TWO_PI; a += angle15) {
          float vx = 0 + cos(a) * radius15;
          float vy = 0 + sin(a) * radius15;
          vertex(vx, vy);
        }
        endShape(CLOSE);
popMatrix();
    
    break;  
   

   
     case 16 :
           
           
fill(cl2,alphashape);
pushMatrix();
    translate((width*0.5),(height*0.5)); 
   rotate(radians(rotani));
  translate(-(width*0.5),-(height*0.5)); 
    translate((width*0.5),(height*0.5)); 


       println(rotani);
          radius15 = +bpm+(framcountc*10)%height ;
          angle15 = TWO_PI /3;

    beginShape();
        for (float a = PI/3; a < TWO_PI; a += angle15) {
          float vx = 0 + cos(a) * radius15;
          float vy = 0 + sin(a) * radius15;
          vertex(vx, vy);
        }
        endShape(CLOSE);
fill(0);
          radius15 = +bpm+(framcountc*10)%height*0.5;
   beginShape();
        for (float a = PI/3; a < TWO_PI; a += angle15) {
          float vx = 0 + cos(a) * radius15;
          float vy = 0 + sin(a) * radius15;
          vertex(vx, vy);
        }
        endShape(CLOSE);
popMatrix();
    
    break;  
   
   
   
   
case 17 :
           
           
fill(cl2,alphashape);
pushMatrix();
    translate((width*0.5),(height*0.5)); 
   rotate(radians(rotani));
  translate(-(width*0.5),-(height*0.5)); 
    translate((width*0.5),(height*0.5)); 


       println(rotani);
          radius15 = +bpm+(framcountc*10)%height ;
          angle15 = TWO_PI /8;

    beginShape();
        for (float a = PI/8; a < TWO_PI; a += angle15) {
          float vx = 0 + cos(a) * radius15;
          float vy = 0 + sin(a) * radius15;
          vertex(vx, vy);
        }
        endShape(CLOSE);
fill(0);
          radius15 = +bpm+(framcountc*10)%height*0.5;
   beginShape();
        for (float a = PI/8; a < TWO_PI; a += angle15) {
          float vx = 0 + cos(a) * radius15;
          float vy = 0 + sin(a) * radius15;
          vertex(vx, vy);
        }
        endShape(CLOSE);
popMatrix();
    
    break;  
      
  
   
    case 19 :
        
fill(cl2,alphashape);
 

 
 shapeMode(CENTER);
 pushMatrix();
 translate((width*0.5),(height*0.5)); 
   rotate(radians(rotani));
  translate(-(width*0.5),-(height*0.5)); 
    translate((width*0.5),(height*0.5)); 
      shape(l1shape[2],0,0,+bpm+(framcountc*10)%height*0.5,+bpm+(framcountc*10)%height*0.5  );   
     l1shape[2].disableStyle();  // Ignore the colors in the SVG
popMatrix();
  
  
    
    break;       
   
 
    
    
    case 20 :
fill(cl2,alphashape);
rect((framcountc*10)%width,(height*0.5)+100*sin(framcountc*0.1)*0.5,100+bpm,100+bpm) ;
    break;   
    
    
    case 21 :
fill(cl2,alphashape);
rect(width-(framcountc*10)%width,(height*0.5)+100*sin(framcountc*0.1)*0.5,100+bpm,100+bpm) ;
    break;   
        
  case 22 :
fill(cl2,alphashape);
rect(width-(framcountc*10)%width,(height*0.5)+100*sin(framcountc*0.1)*0.5,100+bpm,100+bpm) ;
rect( (framcountc*10)%width,(height*0.5)+100*sin(framcountc*0.1)*0.5,100+bpm,100+bpm) ;
    break;
    
 ///////////////////////////////////////////////////////////////////////////////////////////////
 //3d
 //////////////////////////////////////////////////////////////////////////////////////////////////
  case 23:hint(DISABLE_DEPTH_TEST);
  pushMatrix();
 translate((width*0.5),(height*0.5)); 
   rotate(radians(rotani));rotateY(radians(rotani));
  translate(-(width*0.5),-(height*0.5)); 
    translate((width*0.5),(height*0.5));
    
    
     shape(cross, -100, 0,+bpm+(framcountc*10)%height*0.5,+bpm+(framcountc*10)%height*0.5);
     l1shape[2].disableStyle();  // Ignore the colors in the SVG
popMatrix();
  
   
 
    break;    
    
      case 30:
    framcountc=1;
    for (int x=0; x<gridx; x++)
      for (int y=0; y<gridy; y++) { 
        selectedColor = colocrs.get((x*y)%colocrs.size());
        fill(selectedColor.toARGB(),alphashape); 
       
stroke(selectedColor.toARGB(),alphashape); 
        selectedColor = colocrs.get(x%colocrs.size());
        //     s1=((4+x)*constrain (framcountc*0.7%50, 0, 80) );
        s1[x][y] += ( s0[x][y]-s1[x][y])*0.1*speed;
        //s1[x][y]  =h;
        s=s1[x][y];
        if ( act[x][y])ss[x][y]=(h+s)*0.3; 

     Obshap(layershape,40+x*80, 40+y*80, ss[x][y], ss[x][y]  );
      }
    break;

    case 31:

    for (int x=0; x<gridx; x++)
      for (int y=0; y<gridy; y++) {
        
        
                s1[x][y] += ( s0[x][y]-s1[x][y])*0.1*speed;
        //s1[x][y]  =h;
        s=s1[x][y];
        if ( act[x][y])ss[x][y]=(h+s)*0.3; 
        
        
           fill(selectedColor.toARGB(),alphashape); 
        selectedColor = colocrs.get(x*y%colocrs.size());
        
       
   stroke(selectedColor.toARGB(),alphashape); 
        selectedColor = colocrs.get(x%colocrs.size());
         Obshap(layershape, 800+-x*80, 800+-y*80, ((4+x)*constrain (framcountc*0.7%50, 0,  ss[x][y]*2) )
          , ((4+x)*constrain (framcountc*0.7%50, 0,  ss[x][y]*2)) );
      }
    break;

  case 32:

    for (int x=0; x<gridx; x++)
      for (int y=0; y<gridy; y++) {
        
                 s1[x][y] += ( s0[x][y]-s1[x][y])*0.1*speed;
        //s1[x][y]  =h;
        s=s1[x][y];
        if ( act[x][y])ss[x][y]=(h+s)*0.3; 
        
           fill(selectedColor.toARGB(),alphashape); 
        selectedColor = colocrs.get(x*y%colocrs.size());
   stroke(selectedColor.toARGB(),alphashape); 
        selectedColor = colocrs.get(x%colocrs.size());
        Obshap(layershape,40+x*80, 40+y*80, ((4+x)*constrain (framcountc*0.7%50, 0, ss[x][y]*2) )
          , ((4+x)*constrain (framcountc*0.7%50, 0, ss[x][y]*2)) );
      }
    break;


  case 33:
    framcountc=1;
    for (int x=0; x<gridx; x++)
      for (int y=0; y<gridy; y++) { 
        selectedColor = colocrs.get((x*y)%colocrs.size());
        fill(selectedColor.toARGB(),alphashape); 
       
stroke(selectedColor.toARGB(),alphashape); 
        selectedColor = colocrs.get(x%colocrs.size());
        //     s1=((4+x)*constrain (framcountc*0.7%50, 0, 80) );
        s1[x][y] += ( s0[x][y]-s1[x][y])*0.1*speed;
        //s1[x][y]  =h;
        s=s1[x][y];
        if ( act[x][y])ss[x][y]=(h+s)*0.3; 



        ///ellipse(x*80,y*80,h,h); 


     Obshap(layershape,40+x*80, 40+y*80, ss[x][y], ss[x][y]  );
      }
    break;  


  case 34:
    framcountc=1;
    for (int x=0; x<gridx; x++)
      for (int y=0; y<gridy; y++) {
       
        selectedColor = colocrs.get((x*y)%colocrs.size());
          fill(selectedColor.toARGB(),alphashape);
stroke(selectedColor.toARGB(),alphashape); 
        selectedColor = colocrs.get(x%colocrs.size());
        //     s1=((4+x)*constrain (framcountc*0.7%50, 0, 80) );
        s1[x][y] += ( s0[x][y]-s1[x][y])*0.1*speed;
        //s1[x][y]  =h;
        s=s1[x][y];
        if ( act[x][y])ss[x][y]=(h*2+s)*2; 



        float centx = 40+x*80;
        float centy = 40+y*80;
        float radius = ss[x][y];
        float angle = TWO_PI / 6;
 Obshap(layershape,40+x*80,40+y*80, ss[x][y], ss[x][y]);
 
      }
    break;  







  case 35:
  
   
   for (int x=0; x<gridx; x++)
      for (int y=0; y<gridy; y++){
         selectedColor = colocrs.get((y*x)%colocrs.size());
        fill(selectedColor.toARGB(),alphashape); 
        
        stroke(selectedColor.toARGB(),alphashape); 
        selectedColor = colocrs.get(x%colocrs.size());
        
       Obshap(layershape,40+x*80, 40+y*80, 
       
          dist(40+x*80, 40+y*80, ppx[1], ppy[1])%200+ppx[1]/50, 
          (dist(40+x*80, 40+y*80, ppx[1], ppy[1])%200+ppx[1]/50));
          
 
        fill(selectedColor.toARGB(),alphashape); 
        selectedColor = colocrs.get((y*x)%colocrs.size());
        stroke(selectedColor.toARGB(),alphashape); 
        selectedColor = colocrs.get(x%colocrs.size());
        fill(0);
          Obshap(layershape,40+x*80, 40+y*80, 
          dist(40+x*80, 40+y*80, ppx[1]/2, ppy[1]/2)%100+ppx[1]/10, 
          (dist(40+x*80, 40+y*80, ppx[1]/2, ppy[1]/2)%100+ppx[1]/10));
   
      }
      




    fill(cl2);
  /* for(int x=0;x<10;x+=1)
     for(int y=0;y<10;y+=1){
     
     rect(40+x*80,40+y*80,
     (dist(40+x*80,40+y*80,ppx[1],ppy[1])%200-mouseX*ppx[1]/200),
     (dist(40+x*80,40+y*80,ppx[1],ppy[1])%200-mouseX*ppx[1]/200));
     } */
    for (int x=0; x<5; x+=2)
      for (int y=0; y<5; y+=2) {
        noStroke();  
        pushMatrix();
        translate(80+x*80*2, 80+y*80*1.5);
        rotate(frameCount/100);
        rect(0, 0, 
          (dist(40+x*80, 40+y*80, ppx[1], ppy[1])%100*px/450), 
          (dist(40+x*80, 40+y*80, ppx[1], ppy[1])%100*px/150)); 
        popMatrix();


        pushMatrix();
        translate(80+x*80*2, 80+y*80*1.5);
        rotate(frameCount/100);
        rect(0, 0, 
          (dist(40+x*80, 40+y*80, ppx[1], ppy[1])%100*px/150), 
          (dist(40+x*80, 40+y*80, ppx[1], ppy[1])%100*px/450)); 
        popMatrix();

        pushMatrix();
        translate(x*80*2, dist(40+x*80, 40+y*80, ppx[1], ppy[1])%100*px/450+y*80*2);
        //rotate(frameCount/50);
        triangle(+80, -100, -80+80, 0, 80+80, 0);
        popMatrix();
      }

    ;
    break;
 
    

    
    
   case 113:

    for (int x=startx; x<gridx; x++)
      for (int y=0; y<gridy; y++) {
        s1[x][y] += ( s0[x][y]-s1[x][y])*0.1;
        float s=s1[x][y];
          selectedColor = colocrs.get((x*y)%colocrs.size());
     //   fill(selectedColor.toARGB(),alphashape); 
     fill(250);
         selectedColor = colocrs.get(x%colocrs.size());
           stroke(selectedColor.toARGB(),alphashape); 
     
        if ( !act[x][y])Obshap(layershape, x*80,y*80, s+(50*cos(0.010*framcountc*(2*PI)))+(y*sin(0.00010*framcountc*(2*PI))), s+
          (50*cos(0.010*framcountc*(2*PI)))+(y*sin(0.00010*framcountc*(2*PI))));
      }
    break;
 
     case 777:
  
   
   for (int x=startx; x<gridx; x++)
      for (int y=starty; y<gridy; y++){
         
        fill(selectedColor.toARGB(),alphashape); 
        selectedColor = colocrs.get((y*x)%colocrs.size());
       stroke(selectedColor.toARGB(),alphashape); 
        selectedColor = colocrs.get(x%colocrs.size());
       Obshap(layershape,40+x*80, 40+y*80, 
          dist(40+x*80, 40+y*80, ppx[1], ppy[1])%200-framcountc*ppx[1]/50, 
          (dist(40+x*80, 40+y*80, ppx[1], ppy[1])%200-framcountc*ppx[1]/50));
          
          
          
      }
      
      
   for (int x=startx; x<gridx; x++)
      for (int y=0; y<gridy; y++){
         
        fill(selectedColor.toARGB(),alphashape); 
        selectedColor = colocrs.get((y*x)%colocrs.size());
         stroke(selectedColor.toARGB(),alphashape); 
        selectedColor = colocrs.get(x%colocrs.size());
       Obshap(layershape,40+x*80, 40+y*80, 
          dist(40+x*80, 40+y*80, ppx[1], ppy[1])%100-framcountc*ppx[1]/10, 
          (dist(40+x*80, 40+y*80, ppx[1], ppy[1])%100-framcountc*ppx[1]/10));
      }
    
       break;
    
    
  case 53:

    for (int x=startx; x<5; x+=2)
      for (int y=0; y<5; y+=2) {
        noStroke();  
        pushMatrix();
        translate(x*80*2, dist(40+x*80, 40+y*80, ppx[1], ppy[1])%100*px/450+y*80*2);
        //rotate(frameCount/50);
        triangle(+80, -100, -80+80, 0, 80+80, 0);
        popMatrix();
      }



    ;
    break;

  case 63:

    for (int x=startx; x<10; x++)
      for (int y=0; y<10; y++)
        ellipse(40+x*80, 40+y*80, 
          dist(40+x*80, 40+y*80, ppx[1], ppy[1])%200-mouseX*ppx[1]/100, 
          (dist(40+x*80, 40+y*80, ppx[1], ppy[1])%200-mouseX*ppx[1]/100));

    fill(250);
    for (int x=0; x<10; x++)
      for (int y=0; y<10; y++)
        ellipse(40+x*80, 40+y*80, 
          (dist(40+x*80, 40+y*80, ppx[1], ppy[1])%200-mouseX*ppx[1]/80), 
          (dist(40+x*80, 40+y*80, ppx[1], ppy[1])%200-mouseX*ppx[1]/80));
    fill(0);

    break;
  case 700: 
  
  
  
       float centx = 800*0.5;
        float centy = 600*0.5;
        float radius = 50;
        float angle = TWO_PI / 10;
        
        
    for (int x=0; x<10; x++)
        for (float a = PI/10; a < TWO_PI; a += angle) {
      fill(selectedColor.toARGB(),alphashape); 
        selectedColor = colocrs.get(x%colocrs.size());
   stroke(selectedColor.toARGB(),alphashape); 
        selectedColor = colocrs.get(x%colocrs.size());       
  
      s1[x%10][x%10] += ( s0[x%10][x%10]-s1[x%10][x%10])*0.1*speed;
        //s1[x][y]  =h;
        s=s1[x%10][x%10];
        if ( act[x%10][x%10])ss[x%10][x%10]=(h+s)*2;        
                   
         // float vx = centx + cos(a+x) * radius*x;
         // float vy = centy + sin(a+x) * radius*x;
          
          float vx = centx + cos(a+x+sin(degrees (sl.getArrayValue()[0]))) * radius*x;
          float vy = centy + sin(a+x+cos(degrees (sl.getArrayValue()[1])) )* radius*x;
          
           
          
          
          
          
   Obshap(layershape,vx, vy, ss[x%10][x%10],ss[x%10][x%10]);  
        }
  
    
    break;
  case 8000: 
    ;
    break;
  case 900: 
    ;
    break;
  case 1000: 
    ;
    break;
  }
  
  
  
  
  /////////////////layer2 animation//////////////////////////////////////////////
  switch(layer2) {
  case 1: 
    px=100*sin(0.07*framcountc+(20*PI))+400;
    py=100*cos(0.07*framcountc+(20*PI))+300;


    ppx[0]=(50*cos(0.0070*framcountc*(2*PI)))+px;
    ppy[0]=(50*cos(0.010*framcountc*(2*PI)))+py;

    ppx[1]=(0.1*px+10*sin(0.08*framcountc+(2*PI)))+ppx[0];
    ppy[1]=(10*cos(0.08*framcountc+(2*PI)))+ppy[0];
   
    ppx[2]=(50*sin(0.0010*ppx[2]*(2*PI)))+px;
    ppy[2]=(50*cos(0.0010*ppy[2]*(2*PI)))+py;
     ;
    break;
  case 2: 
    ;
    break;
  case 3: 
    ;
    break;
  case 4: 
    ;
    break;
  case 5: 
    ;
    break;
  case 6: 
    ;
    break;
  case 7: 
    ;
    break;
  case 8: 
    ;
    break;
  case 9: 
    ;
    break;
  case 10: 
    ;
    break;
  case 11: 
    ;
    break;
  case 12: 
    ;
    break;
  case 13:

    break;
  case 14:

    px=10*sin(0.07*framcountc+(20*PI))+350;
    py=10*cos(0.07*framcountc+(20*PI))+250;

 /*   ppx[0]=(50*cos(0.010*framcountc*(2*PI)))+(50*sin(0.00010*framcountc*(2*PI)))+px;
    ppy[0]=(50*cos(0.00010*framcountc*(2*PI)))+py;

    ppx[1]=(0.1*px+10*sin(0.08*framcountc/2+(2*PI)))+ppx[0];
    ppy[1]=(10*cos(0.08*framcountc/2+(2*PI)))+ppy[0];

    ppx[2]=(50*cos(0.010*framcountc*(2*PI)))+(150*sin(0.00010*framcountc*(2*PI)))+px;
    ppy[2]=(50*cos(0.010*framcountc*(2*PI)))-(150*cos(0.00010*framcountc*(2*PI)))+py;
    ;
    break;*/
  case 15:
    px=100*sin(0.007*framcountc+(20*PI))+350;
    py=100*cos(0.007*framcountc+(20*PI))+250;

    ppx[0]=(50*sin(0.00010*framcountc*(2*PI)))+px;
    ppy[0]=(50*cos(0.00010*framcountc*(2*PI)))+py;

    ppx[1]=(-60*cos(0.009*framcountc/(2*PI)))-(50*sin(0.0008*framcountc*(2*PI)))+ppx[0];
    ppy[1]=(150*cos(0.008*framcountc/(2*PI)))+ppy[0];


    ppx[2]=(160*cos(0.009*framcountc/(2*PI)))-(50*sin(0.0008*framcountc*(2*PI)))+ppx[0];
    ppy[2]=(150*cos(0.008*framcountc/(2*PI)))+ppy[0];
    break;

  case 16:
    px=100*sin(0.07*framcountc+(20*PI))+350;
    py=100*cos(0.07*framcountc+(20*PI))+250;

    ppx[0]=(50*sin(0.0010*framcountc*(2*PI)))+px;
    ppy[0]=(50*cos(0.0010*framcountc*(2*PI)))+py;

    ppx[1]=(-60*cos(0.09*framcountc-(2*PI)))-(50*sin(0.0008*framcountc*(2*PI)))+ppx[0];
    ppy[1]=(150*cos(0.08*framcountc-(2*PI)))+ppy[0];
    break;
  }
  //fill(20+py, 240, 100);

//    }
 // pg_render.endDraw();
/*if(true){
      // luminance pass
      filter.luminance_threshold.param.threshold = 0.0f; // when 0, all colors are used
      filter.luminance_threshold.param.exponent  = 5;
      filter.luminance_threshold.apply(pg_render, pg_luminance);
      
      // bloom pass
      // if the original image is used as source, the previous luminance pass 
      // can just be skipped
//      filter.bloom.setBlurLayers(10);
      filter.bloom.param.mult   = map(mouseX, 0, width, 0, 10);
      filter.bloom.param.radius = map(mouseY, 0, height, 0, 1);
      filter.bloom.apply(pg_luminance, pg_bloom, pg_render);
    }
    
    filter.copy.apply(pg_bloom, pg_render); 
    
      // display result
    blendMode(ADD );
    background(0);
  //  image(pg_render, 0, 0);
    */

  /////////////////layer3//////////////////////////////////////////////

fill(layer3);
  switch(layer3) {

    
      case 0:

 
    break;
    
    
  case 1:

    ellipse(px, py, 10, 10);
    ellipse(ppx[0], ppy[0], 50+  kick, 50+  kick);
    ellipse(ppx[1], ppy[1], ppy[1]/50, ppy[1]/50);
    ellipse(ppx[2], ppy[2], 50+  kick, 50+  kick);
    break;
    
    
  case 2:

    ellipse(px, py, 10, 10);
    ellipse(ppx[0], ppy[0], 50+  kick, 50+  kick);
    ellipse(ppx[1], ppy[1], ppy[1]/50, ppy[1]/50);
    ellipse(ppx[2], ppy[2], 50+  kick, 50+  kick);
    break;
  case 3:
    PShape s;
    s = createShape();
    s.beginShape(TRIANGLE_STRIP);
    s.vertex(px, py);
    s.vertex(ppx[0], ppy[0]);
    s.vertex(ppx[1], ppy[1]);
    s.vertex(ppx[2], ppy[2]);
    s.endShape();
    shape(s, 0, 0);

    break;
  case 4:
    rect(px, py, 5, 5);
    rect(ppx[0], ppy[0], 10, 10);
    rect(ppx[1], ppy[1], ppy[1]/50, ppy[1]/50);
    rect(ppx[2], ppy[2], 10, 10); 
    ;
    break;
  case 5:
    line(px, py, ppx[0], ppy[0]);
    line(ppx[2], ppy[2], ppx[0], ppy[0]);


    ;
    break;
  case 6: fill(0);

  for  (int i = 1; i < 300; i++) {
    ellipse( (width/300) * i, (height/2) + random(-rand, rand),10+bpm,10+bpm );
 
 if(second()%6>3) rand += random(-15, 15);else rand=0;
    
  }

    ;
    break;
    
    
    

    
    
  case 7:
  

     pushMatrix();
  translate( (width*0.5), (height*0.5)); 
  fill(cl2,alphashape);
  xx=350;
yy=100;
x1=100;x2=500;y1=0;y2=0;
  int dx = x2 - x1;
int dy = y2 - y1;
for (float x = x1;x< x2;x+=2) {
 y = y1 + dy * (x - x1) / dx;
// point(x, y);
//point(200*cos(2*PI*radians( x)%30)*sin(TWO_PI * x / 4000+pow(i,10)+i*10),y+200*sin(2*PI*radians( x)%10)*sin(TWO_PI * x / 4000+i+i*10));
//point(100*cos(2*PI*radians( x)%30),y+100*sin(2*PI*radians( x)%10));
//point(200*cos(2*PI*radians( x)*7)*sin(TWO_PI * x / 4000+i),y+200*sin(2*PI*radians( x)*7)*sin(TWO_PI * x / 4000+i));
  ellipse(300*cos(2*PI*radians( x))*sin(TWO_PI * x / 40+framcountc*0.01),y+300*sin(2*PI*radians( x))*sin(TWO_PI * x / 400+framcountc*0.01),10,10);
}
  
     popMatrix(); 
    ;
    break;
  case 8: 
   
    
    
     pushMatrix();
  translate( (width*0.5), (height*0.5)); 
  fill(cl2,alphashape);
  xx=350;
yy=100;
x1=100;x2=500;y1=0;y2=0;
    dx = x2 - x1;
  dy = y2 - y1;
for (float x = x1;x< x2;x+=2) {
 y = y1 + dy * (x - x1) / dx;
// point(x, y);
//point(200*cos(2*PI*radians( x)%30)*sin(TWO_PI * x / 4000+pow(i,10)+i*10),y+200*sin(2*PI*radians( x)%10)*sin(TWO_PI * x / 4000+i+i*10));
//point(100*cos(2*PI*radians( x)%30),y+100*sin(2*PI*radians( x)%10));
ellipse(200*cos(2*PI*radians( x)*7)*sin(TWO_PI * x / 4000+framcountc*0.005),y+200*sin(2*PI*radians( x)*7)*sin(TWO_PI * x / 4000+framcountc*0.005),10,10);
//  ellipse(300*cos(2*PI*radians( x))*sin(TWO_PI * x / 40+framcountc*0.02),y+300*sin(2*PI*radians( x))*sin(TWO_PI * x / 400+framcountc*0.05),10,10);
}
  
     popMatrix(); 
    ;
    break;
  case 9: 
  
       pushMatrix();
  translate( (width*0.5), (height*0.5)); 
  fill(cl2,alphashape);
  xx=350;
yy=100;
x1=100;x2=500;y1=0;y2=0;
    dx = x2 - x1;
  dy = y2 - y1;
for (float x = x1;x< x2;x+=2) {
 y = y1 + dy * (x - x1) / dx;
// point(x, y);
//point(200*cos(2*PI*radians( x)%30)*sin(TWO_PI * x / 4000+pow(i,10)+i*10),y+200*sin(2*PI*radians( x)%10)*sin(TWO_PI * x / 4000+i+i*10));
 ellipse(10+bpm*0.+400*cos(2*PI*radians( x+framcountc*0.05)%30),y+400*sin(2*PI*radians( x+framcountc*0.05)%10),10+sizeshape,10+sizeshape);
ellipse(200*cos(2*PI*radians( x)*7)*sin(TWO_PI * x / 4000+framcountc*0.005),y+200*sin(2*PI*radians( x)*7)*sin(TWO_PI * x / 4000+framcountc*0.005),10,10);
//  ellipse(300*cos(2*PI*radians( x))*sin(TWO_PI * x / 40+framcountc*0.02),y+300*sin(2*PI*radians( x))*sin(TWO_PI * x / 400+framcountc*0.05),10,10);
}
  
     popMatrix(); 
    ;
  
    ;
    break;
  case 10: 
    ;
    break;
  case 11: 
    ;
    break;
  case 12: 
    ;
    break;
  case 13: 
    ;
    break;
  case 14: 
    ;
    break;
  case 15:

    break;

  case 16:

    break;
  }
/*

  // How much of the top layer should be blended in the lower layer?
  float blendOpacity = float( mouseX ) / float( width );
  myShader.set( "blendAlpha", blendOpacity );

  // Pass the index of the blend mode to the shader
  myShader.set( "blendMode", BL_OVERLAY );

  // Apply the specified shader to any geometry drawn from this point  
  shader(myShader);

  // Draw the output of the shader onto a rectangle that covers the whole viewport
  rect(0, 0, width, height);

 
  // Call resetShader() so that further geometry remains unaffected by the shader
  resetShader();
 */

///////////////////////////////////////////////////////////////////////////////////////////////
//layer4//
 
///////////////////////////////////////////////////////////////////////////////////////////////

  switch(layer4) {
      case 0:


    break;
  case 1:
rectMode(CORNER);
        fill(selectedColor.toARGB(),alphashape);    
        if(!bw)fill(0);

 for (int x=startx; x<width; x+=2)
      rect(0,20*x,width,10+bpm*0.1);
 break;
    
      case 2:
rectMode(CORNER);
        fill(selectedColor.toARGB(),alphashape); 
        if(!bw)fill(0);
 for (int x=startx; x<height; x+=2)
      rect(20*x,0,10+bpm*0.2,height);
 break;
    
    case 3:
    
     pushMatrix();
 translate((width*0.5),-(height)*2); 
   rotate(radians(rotani));
  translate(-(width*2),-(height*0.5)); 
    translate((width*2),(height*0.5)); 
  rectMode(CORNER);
        fill(selectedColor.toARGB(),alphashape);    
        if(!bw)fill(0);

 for (int x=startx; x<width*2; x+=2){
      rect(0,20*x,width*3,10+bpm*0.1);
 }
     popMatrix();
 break;
    
      case 4:
  
     pushMatrix();
 translate((width*0.5),-(height)*2); 
   rotate(radians(-rotani));
  translate(-(width*2),-(height*0.5)); 
    translate((width*2),(height*0.5)); 
  rectMode(CORNER);
        fill(selectedColor.toARGB(),alphashape);    
        if(!bw)fill(0);

 for (int x=startx; x<width*2; x+=2){
      rect(0,20*x,width*3,20+bpm*0.2);
 }
     popMatrix();
 break;  
    
      case 5:
       pushMatrix();
 translate((width*0.5),-(height)*2); 
   rotate(radians(rotani));
  translate(-(width*2),-(height*0.5)); 
    translate((width*2),(height*0.5)); 
  rectMode(CORNER);
        fill(selectedColor.toARGB(),alphashape);    
        if(!bw)fill(0);

 for (int x=startx; x<width*2; x+=5){
      rect(0,20*x,width*3,20+bpm*0.2);
 }
     popMatrix(); 
     
     
 break;     
    
    
       case 6:
       
       
         stroke(selectedColor.toARGB(),alphashape);    
        if(!bw)stroke(0);
       
   
 pushMatrix();
translate((width*0.52),(height*0.5)); 
 rotate(radians(rotani));
   translate(-(width*0.5),-(height*0.5)); 
    translate((width*0.5),(height*0.5)); 
   noFill();
     
strokeWeight(60);
 
 
arc(0, 0,260+bpm*0.2,  260 +bpm*0.2, HALF_PI, PI);
arc(0, 0,370 +bpm*0.2, 370 +bpm*0.2, PI*0.5, PI+QUARTER_PI);
arc(0, 0,480 +bpm*0.2, 480 +bpm*0.2, PI+QUARTER_PI, TWO_PI);  
 
 
     popMatrix(); 
     
     
 break;     
       
    

    
    case 7:
       
       
         stroke(selectedColor.toARGB(),alphashape);    
        if(!bw)stroke(0);
       
       noFill();
 pushMatrix();
translate((width*0.5),(height*0.5)); 
 rotate(radians(rotani));
   translate(-(width*0.5),-(height*0.5)); 
    translate((width*0.5),(height*0.5)); 
   noFill();
     
strokeWeight(10);
 
 
 for (int x=startx; x<width; x+=10)
ellipse(0,0,width*0.2+x*10,width*0.2+x*10);
 
 
     popMatrix(); 
     
     
 break;     
           
    
    
     case 8:
       noStroke();
         
         fill(cl2,alphashape);    
        if(!bw)fill(0);
       
   
 
 
 for (int x=startx; x<20; x+=1)
 for (int y=starty; y<20; y+=1)
ellipse(50*x,50*y, 10*sizeshape, 10*sizeshape);
 
 
   
     
 break;     
        
     case 9:
       
       
         fill(selectedColor.toARGB(),alphashape);    
        if(!bw)fill(0);
       
   


   
  
 for (int x=startx; x<20; x+=1)
 for (int y=starty; y<40; y+=1){ 
 pushMatrix();
 translate(50*x,(50*y)); 
 rotate(radians(rotani));
   translate(-(50*x),-(50*y)); 
    translate((50*x),(50*y)); 
rect(0,0, 10*sizeshape, 10*sizeshape);
   popMatrix(); 
 }
    
     
 break;              
       
           
           
     case 10:
       
       
         fill(selectedColor.toARGB(),alphashape);    
        if(!bw)fill(0);
       
   


   
  
 for (int x=startx; x<20; x+=1)
 for (int y=starty; y<40; y+=1){ 
 pushMatrix();
 translate(50*x,(50*y)); 
 rotate(radians(rotani));
   translate(-(50*x),-(50*y)); 
    translate((50*x),(50*y)); 
rect(0,0, 40*sizeshape, 5*sizeshape);
rect(0,0, 5*sizeshape, 40*sizeshape);
   popMatrix(); 
 }
    
     
 break;              
                  
         
           
           
       case 11:     
           
   strokeWeight(20);
 // line(0, height/2, width, height/2);
  stroke(selectedColor.toARGB(),alphashape);    
        if(!bw)stroke(0);
 
  xPos = 0;
  yPos = height/2;
  while (xPos < width) {
    int xNextPos = xPos + round(random(10, 20));
    int yNextPos = yPos + round(random(-50, 50));
    yNextPos = constrain(yNextPos, 0, height/2);
    line(xPos, yPos, xNextPos, yNextPos);
    xPos = xNextPos;
    yPos = yNextPos;
  }        
           
           
           
     break;         
           
           
  case 22:
  
     noStroke();  
    pushMatrix();
      fill(250);  
     // translate(800*0.5, -300);
      
   
     //  shape(drawing[millis()/500%2],200,150);           // Draw at coordinate (280, 40) at the default size
     
     //for (int i = 0; i < drawing[0].getChildCount(); i++) {
   //  PShape thisShape = drawing[1].getChild(1+(second())%drawing[1].getChildCount()-1);
   PShape thisShape = drawing[1].getChild("layer1");
        shape(thisShape,200,150);  
     

     //println(drawing[1].getChildCount());
     
    popMatrix(); 
  
  
    break;
  case 32: 
   float speed = map(mouseX, 0, width, 0.01, 0.3);

  // semi transparent rectangle  
  rest.beginDraw();
  rest.fill(0, 0);
  rest.noStroke();
  rest.rect(0, 0, width, height);
 
  // calculate points
  float angle = TWO_PI / steps;
  for (int i =0; i< points.length; i++) {
    float c = i*angle;
    float offset=map(noise(xOff, yOff), 0, 0.8, -30, 30);
    float radius=height/5+offset;
    points[i].x = radius*cos(c);
    points[i].y = 1.2*radius*sin(c);
    xOff+=0.5;
  }
  xOff = 0;
  yOff += speed;
 
  // draw points 1
  rest.translate(width/2, height/2);
  rest.noFill();
  rest.strokeWeight(random(60*sizeshape));
  rest.stroke(255, 60, 220, 20);
 
   rest.stroke( selectedColor.toARGB(), 20);
 

  rest.beginShape();
  rest.curveVertex(points[points.length-1].x, points[points.length-1].y);
 
  for (int i =0; i< points.length; i+=2) {
    rest.curveVertex(points[i].x, points[i].y);
  }
  rest.curveVertex(points[0].x, points[0].y);
  rest.curveVertex(points[1].x, points[1].y);
  rest.endShape();
 
 
  // draw points 2
  rest.noFill();
  rest.strokeWeight(60*sizeshape);
  rest.stroke(20, 220, 220, 20);
  //rest.scale(frameCount%5);

  rest.beginShape();
  rest.curveVertex(points[points.length-1].x, points[points.length-1].y);
 
  for (int i =0; i< points.length; i+=3) {
    rest.curveVertex(points[i].x, points[i].y);
  }
  rest.curveVertex(points[0].x, points[0].y);
  rest.curveVertex(points[1].x, points[1].y);
  rest.endShape();
  rest.endDraw();
 
  image(rest, 0, 0);
 
  translate(width/2, height/2);
  // draw points 3
  noFill();
  strokeWeight(sizeshape*40);
  stroke(0);
 
  beginShape();
  curveVertex(points[points.length-1].x, points[points.length-1].y);
 
  for (int i =0; i< points.length; i+=1) {
    curveVertex(points[i].x, points[i].y);
  }
  curveVertex(points[0].x, points[0].y);
  curveVertex(points[1].x, points[1].y);
  endShape();
    break;
  case 64: 
    ;
    break;
  case 74: 
    ;
    break;
  case 84: 
    ;
    break;
  case 94: 
    ;
    break;
  case 104: 
    ;
    break;
  case 114: 
    ;
    break;
  case 12: 
    ;
    break;
  case 13: 
    ;
    break;
  case 14: 
    ;
    break;
  case 15:
    break;
  case 16: 
    break;
  }

 switch(title) {
  case 1:

Title[0].beginDraw();
//Title[0].background(0.50);
 // Title[i].stroke(255);
//  Title[i].line(20, 20, mouseX, mouseY);
Title[0].textFont(fontawesome);
Title[0].fill(selectedColor.toARGB(),alphashape); 

Title[0].pushMatrix();
Title[0].scale(1);
Title[0].text("Mr OIZO",100, 450);
Title[0].popMatrix();
Title[0].endDraw();
  
   image(Title[0],0,0);
   // imgMasked.set(0,0,Title[0]);
 // imgMasked.mask(pg); // issue here on the iPad and iMacBook
 // image(imgMasked,0,0);
  
 // image(,0,0); 
break;
  case 2:
  
  
/*
 imgsketch.loadPixels();
  for (int y = 0; y < height; y++) { 
    for (int x = 0; x < width; x++) {
      int px = get(x, y);
imgsketch.pixels[x + y * width] = px;
    }
  }
imgsketch.updatePixels();  
  
*/
  
Title[0].beginDraw();
Title[0].background(0);
Title[0].textFont(fontawesome);
Title[0].fill(250); 
Title[0].pushMatrix();
Title[0].scale(0.70);
Title[0].text("Mr OIZO",10, 450);
Title[0].popMatrix();
Title[0].endDraw();
imgsketch= get();
//filter(INVERT);
imgsketch.mask(Title[0]); 
background(0,0,0);
 image(imgsketch,0,0);  
break;





  case 3:

Title[0].beginDraw();
//Title[0].background(0.50);
 // Title[i].stroke(255);
//  Title[i].line(20, 20, mouseX, mouseY);
Title[0].textFont(fontawesome);
Title[0].fill(selectedColor.toARGB(),alphashape); 

Title[0].pushMatrix();
Title[0].scale(1);
Title[0].text("NTO",100, 450);
Title[0].popMatrix();
Title[0].endDraw();
  
   image(Title[0],0,0);
   // imgMasked.set(0,0,Title[0]);
 // imgMasked.mask(pg); // issue here on the iPad and iMacBook
 // image(imgMasked,0,0);
  
 // image(,0,0); 
break;
  case 4:
  
  
/*
 imgsketch.loadPixels();
  for (int y = 0; y < height; y++) { 
    for (int x = 0; x < width; x++) {
      int px = get(x, y);
imgsketch.pixels[x + y * width] = px;
    }
  }
imgsketch.updatePixels();  
  
*/
  
Title[0].beginDraw();
Title[0].background(0);
Title[0].textFont(fontawesome);
Title[0].fill(250); 
Title[0].pushMatrix();
Title[0].scale(0.70);
Title[0].text("NTO",10, 450);
Title[0].popMatrix();
Title[0].endDraw();
imgsketch= get();
//filter(INVERT);
imgsketch.mask(Title[0]); 
background(0,0,0);
 image(imgsketch,0,0);  
break;




}


glitch();


  fill(20+py, 240, 100+ppy[1]);

  ////////////////////////////////////////////////////////////////////////////////
  spout.sendTexture();
  if (framcountb)framcountc=frameCount*speed;


  //triangle(px,py, ppx[0]*1.5,ppy[0],ppx[1],ppy[1]);

  /* int d = int(map(mouseX, 0, 100, 1, 20));
   bezierDetail(d);
   bezier(px,py, ppx[0],ppy[0], ppx[1],ppy[1], ppx[2],ppy[2]);*/
  
  
}




/*

 class shapc{
 int id;
 
 void draw (float x ,float y,float x ,float y){  }
 
 
 
 
 }*/


void glitch(){
if(glitch1){





}





}




float r=frameCount;
void mousePressed() {
  /* 
   if(framcountb)
   framcountb=false ; 
   else if(!framcountb)   framcountb=true ; 
   r = framcountc;
   println(r);*/
}



void Obshap( int  shape, float tx, float  ty, float sx, float sy) {
  
  if(fill1) noFill() ;
if(stroke1) noStroke() ;


if(bw)fill(250,alphashape);
sx=sx*sizeshape;
sy=sy*sizeshape;
  switch(shape) {

  case 1: //"ellipse":

    pushMatrix();
    //scale(2);
 // translate(400*-0.5, -100);
 // rotate(frameCount/50);
    ellipse(tx, ty, sx, sy);
    popMatrix();
    break;
    
    
      case 2://"rect":

    pushMatrix();
    //scale(2);
 // translate(400*-0.5, -100);
 // rotate(frameCount/50);
 // translate(-(tx+50), -(ty+50));
 
    
//rotate( (frameCount/50)+radians(45));   
    rect(00,0, sx, sy);
    popMatrix();
    break;
    
      
      case 3://"hexagone":
            float centx = tx;
        float centy = ty;
        float radius = sx;
        float angle = TWO_PI / 8;
 
        beginShape();
        for (float a = PI/8; a < TWO_PI; a += angle) {
          float vx = centx + cos(a) * radius;
          float vy = centy + sin(a) * radius;
          vertex(vx, vy);
        }
        endShape(CLOSE);
    
 break;    
 
 
  case 4://"Triangle":
 
               
            pushMatrix();
 
translate((tx+50), (ty+50));
   rotate(radians(rotani));
  translate(-(tx+50),- (ty+50));
    translate((tx+50), (ty+50));
       triangle(+sx, -sx, -sx+sx, 0, sx+sx, 0);

        popMatrix();
 
  break; 
 
    
      case 5://"Triangle":
     bot.disableStyle();  // Ignore the colors in the SVG

  
    strokeWeight(0.7);   
  stroke(255);          // Set the SVG fill to white
      shape(bot, tx,ty,sx,sy);           // Draw at coordinate (280, 40) at the default size
     

   break; 
 
    
    case 6://"long rect":

    pushMatrix();
    //scale(2);
 // translate(400*-0.5, -100);
 // rotate(frameCount/50);
 // translate(-(tx+50), -(ty+50));
  translate((tx+50), (ty+50));
   rotate(radians(rotani));
  translate(-(tx+50),- (ty+50));
    translate((tx+50), (ty+50));
//rotate( (frameCount/50)+radians(45));   
    rect(00,0, sx, sy*40);
    popMatrix();
    break;  
    
    
    
    case 7://"min rect":

    pushMatrix();
    //scale(2);
 // translate(400*-0.5, -100);
 // rotate(frameCount/50);
 // translate(-(tx+50), -(ty+50));
  translate((tx+50), (ty+50));
   rotate(radians(rotani));
  translate(-(((tx+50)*(framcountc*0.015))%width),- (ty+50));
    translate((tx+50), (ty+50));
//rotate( (frameCount/50)+radians(45));   
    rect(00,0, sx*0.5, sy*40);
    popMatrix();
    break;  
    
    
    
        case 8://"min rect":

    pushMatrix();
    //scale(2);
 // translate(400*-0.5, -100);
 // rotate(frameCount/50);
 // translate(-(tx+50), -(ty+50));
  translate((tx+50), (ty+50));
   rotate(radians(rotani));rect(00,0, sx*0.5, sy*4);
      rotate(radians(rotani));   rect(00,0, sx*0.5, sy*4);
  translate(-(tx+50),- (ty+50));
    translate((tx+50), (ty+50));
//rotate( (frameCount/50)+radians(45));   
    

//rotate( (frameCount/50)+radians(45));   
 
    popMatrix();
    break;   
    
    
        case 9://"min dragibus":

    pushMatrix();
    //scale(2);
 // translate(400*-0.5, -100);
 // rotate(frameCount/50);
 // translate(-(tx+50), -(ty+50));
  translate((((tx+50)*(framcountc*0.015))%width), (ty+50));
   rotate(radians(rotani));
  translate(-(((tx+50)*(framcountc*0.015))%width),- (ty+50));
    translate((((tx+50)*(framcountc*0.015))%width), (ty+50));
//rotate( (frameCount/50)+radians(45));   
    rect(00,0, sx*2, sy*2,7  );
    popMatrix();
    break; 
    
           case 10://"min dragibus":

    pushMatrix();
    //scale(2);
 // translate(400*-0.5, -100);
 // rotate(frameCount/50);
 // translate(-(tx+50), -(ty+50));
    translate((((tx+50)*(framcountc*0.015))%width), (ty+50));

   rotate(radians(rotani));
  translate(-(((tx+50)*(framcountc*0.015))%width),- (ty+50));
  translate((((tx+50)*(framcountc*0.015))%width),  (ty+50));
//rotate( (frameCount/50)+radians(45));   
    rect(00,0, sx*5, sy*02,7  );
    popMatrix();
    break; 
    
  }
  
  
  
  
  
  
  
  fill(cl1,alphashape);
  
sx/=2;
sy/=2; 
if(shape2)  switch(shape) {

  case 1: //"ellipse":
  
    pushMatrix();
    //scale(2);
 // translate(400*-0.5, -100);
 rotate(rotani*frameCount/50);
    ellipse(tx, ty, sx, sy);
    popMatrix();
    break;
    
    
      case 2://"rect":

    pushMatrix();
    //scale(2);
 // translate(400*-0.5, -100);
 // rotate(frameCount/50);
  translate((tx+50), (ty+50));
   rotate(radians(rotani));
   
   rotateZ(rotaniz);
  translate(-(tx+50),- (ty+50));
    translate((tx+50), (ty+50));
//rotate( (frameCount/50)+radians(45));  
 
    rect(0, 0, sx, sy);
    popMatrix();
    break;
    
      
      case 3://"hexagone":
            float centx = tx;
        float centy = ty;
        float radius = sx;
        float angle = TWO_PI / 8;
 
        beginShape();
        for (float a = PI/8; a < TWO_PI; a += angle) {
          float vx = centx + cos(a) * radius;
          float vy = centy + sin(a) * radius;
          vertex(vx, vy);
        }
        endShape(CLOSE);
    
 break;    
 
 
  case 4://"Triangle":
 
               
            pushMatrix();
 
       translate(tx-40, ty-40);  
rotate( (rotani*frameCount/50));   
       triangle(+sx, -sx, -sx+sx, 0, sx+sx, 0);
 rotate(frameCount/50);
        popMatrix();
 
  break; 
 
    
      case 5://"Triangle":
    
      //shape(bot, tx,ty,sx,sy);           // Draw at coordinate (280, 40) at the default size
   flock.run();
   

   break; 
 
    
    
    
    
  }  



   
   
  
   
}


void keyPressed() {
  OscMessage m;
  switch(key) {
    case('c'):
      /* connect to the broadcaster */
      m = new OscMessage("/server/connect",new Object[0]);
      oscP5.flush(m,myBroadcastLocation); 
      //println("eee");
      break;
    case('d'):
      /* disconnect from the broadcaster */
     // println("ee");
      m = new OscMessage("/server/disconnect",new Object[0]);
      oscP5.flush(m,myBroadcastLocation);  
      break;

  }  
}


/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  /* get and print the address pattern and the typetag of the received OscMessage */
 // println("### received an osc message with addrpattern "+theOscMessage.addrPattern()+" and typetag "+theOscMessage.typetag());
  theOscMessage.print();
}





















Map<String, String> midimapper = new HashMap<String, String>();

String ref(String theDevice, int theIndex) {
  return theDevice+"-"+theIndex;
}