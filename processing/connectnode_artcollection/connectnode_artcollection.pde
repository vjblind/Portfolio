import netP5.*; //<>//
import oscP5.*;

import com.corajr.loom.*;
import com.corajr.loom.wrappers.*;
import com.corajr.loom.util.*;
Loom loom;
Pattern pat,pat1, pat2, pat3, pat4;


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


//Square square[]=new Square[100];
float px=0, py=0, s = 0, h=80;//sensor
int grid=11;
int gridx=11;int gridy=11;
int startx=0,starty=0;
int endx=0,endy=0;
int nx = gridx;
int ny = gridy;


int easing=0;
int ii=0, layer1=0, layer2=14,layer3=0,layer4=0,layershape,title=1,Brightness=255,diagonal=0, rotani=0, hozisontalr=0,verticalr=0,speedmat=1,alphashape=255;
float[] ppx=new float[100], ppy=new float[100];//sensor
int bpm = 1;
HColorPool    colorsx;
float framcountc,speed=1,sizeshape=1,kick=0;

boolean  framcountb=true,bw=false;
float[][] s0 = new float [gridx][gridy];
float[][] s1 = new float [gridx][gridy];
float[][] ss = new float [gridx][gridy];
boolean[][] act = new boolean [gridx][gridy];
boolean reverser=false,stroke1=false,fill1=true,shape2=true;

int cl1 = color(0), cl2 = color(0);


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



PFont fontawesome,pff;
PGraphics[] Title= new  PGraphics[10];
  PImage imgsketch;

///////////////////////////////////////////////////////////////////////////////////////////////
//PShape//
///////////////////////////////////////////////////////////////////////////////////////////////

PShape bot;
PShape[] drawing=new PShape [20] ;







void settings() {
  size(800, 600, P3D);
  
}
void setup() {


 for (int x=0; x<10; x++) Title[x]= createGraphics(800, 600);
  smooth(8);
  
  // Initialize the Loom with a tempo of 120 BPM.
 
  loom = new Loom(this, 125);
  pat = new Pattern(loom);  pat.extend("0101");
  pat1 = new Pattern(loom);  pat1.extend("01010101");
  pat2 = new Pattern(loom);  pat2.extend("10101110101000");
  pat3 = new Pattern(loom);  pat3.extend("10101110");
  pat4 = new Pattern(loom);  pat4.extend("111100101");
    pat.asColor(#FF3636,#36FF45);
    pat1.asColor(#FF3636,#36FF45);
    pat2.asColor(#FF3636,#36FF45);
    pat3.asColor(#FF3636,#36FF45);
    pat4.asColor(#FF3636,#36FF45);
   
     loom.setBPM(0202);
      // This is the crucial piece: every 4 bars, shift the 12-beat pattern left by 1.

  //  pat.every(12, pat3.repeat(4));
    
     
    
    
  fontawesome =loadFont("Italic-Bricks-200.vlw");
  pff= createFont("data/fontawesome-webfont.ttf",20);
  cf = new ControlFrame(this, 400, 800, "Controls");
  surface.setLocation(420, 10);
  noStroke();
  
  
   // Loop the pattern (otherwise, it stops after one cycle)
 pat.loop();
 pat1.loop();
 pat2.loop();
 pat3.loop();
 pat4.loop();
 
  // This is the crucial piece: every 4 bars, shift the 12-beat pattern left by 1.
  //pattern2.every(4, new Transforms.Shift(-1, 12));

  loom.play();
 

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
 
     
     
     
     



       
  /*     
       
  cp5.addMatrix("my_set")
    .setPosition(10, 340)
    .setSize(200, 200)
    .setGrid(nx, ny/2)
    .setGap(10, 1)
    .setInterval(200/speedmat)
    .setMode(ControlP5.MULTIPLES)
    .setColorBackground(color(120))
    .setBackground(color(40))
    ;
  cp5.getController("myMatrix").getCaptionLabel().alignX(CENTER);        
       
     */  
     
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
    
}








///////////////////////////////////////////////////////////////////////////////////////////////
//ControlFrame//
///////////////////////////////////////////////////////////////////////////////////////////////

ControlFrame cf;

class ControlFrame extends PApplet {

  int w, h;
  PApplet parent;
  ControlP5 cp5;
Range rangetimeline;
  public ControlFrame(PApplet _parent, int _w, int _h, String _name) {
    super();   
    parent = _parent;
    w=_w;
    h=_h;
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }

  public void settings() {
    size(w, h);
  }




public void setup() {
    surface.setLocation(10, 10);
    cp5 = new ControlP5(this);
  
       
    cp5.addKnob("startx")
       .plugTo(parent, "startx")
       .setPosition(200, 310)
       .setSize(50, 50)
       .setRange(0, 25)
       .setValue(0);
  
      cp5.addKnob("starty")
       .plugTo(parent, "starty")
       .setPosition(290,310)
       .setSize(50, 50)
       .setRange(0, 25)
       .setValue(0);
 
 
            cp5.addKnob("endx")
       .plugTo(parent, "endx")
       .setPosition(200, 380)
       .setSize(50, 50)
       .setRange(0, 255)
       .setValue(0);
       
      cp5.addKnob("endy")
       .plugTo(parent, "endy")
       .setPosition(290, 380)
       .setSize(50, 50)
       .setRange(0, 25)
       .setValue(0);
  
  
  
    cp5.addKnob("rotani")
       .plugTo(parent, "rotani")
       .setPosition(150, 120)
       .setSize(50, 50)
       .setRange(0, 360)
       .setValue(90);
  
  
      cp5.addKnob("bpm")
       .plugTo(parent, "bpm")
       .setPosition(150, 400)
       .setSize(50, 50)
       .setRange(1, 5)
       .setValue(1);
  
   rangetimeline = cp5.addRange("rangeController").plugTo(parent, "rangeController")
             // disable broadcasting since setRange and setRangeValues will trigger an event
             .setBroadcast(false) 
             .setPosition(0,750)
             .setSize(400,20)
             .setHandleSize(20)
             .setRange(0,255)
             .setRangeValues(50,100)
             // after the initialization we turn broadcast back on again
             .setBroadcast(true)
             .setColorForeground(color(255,40))
             .setColorBackground(color(255,40))  
             ;
             
  
  
  
       
   /* cp5.addSlider("speed")
       .plugTo(parent, "speed")
       .setRange(0, 0.1)
       .setValue(0.01)
       .setPosition(100, 240)
       .setSize(200, 30);*/
       
       
         cp5.addToggle("shape2").plugTo(parent, "shape2")
     .setPosition(340, 200)
     .setSize(50,20)
     .setValue(false)
     .setMode(ControlP5.SWITCH)
     ;
     
     
     cp5.addToggle("bw").plugTo(parent, "bw")
     .setPosition(340, 300)
     .setSize(50,20)
     .setValue(false)
     .setMode(ControlP5.SWITCH)
     ;
     
       cp5.addToggle("stroke1").plugTo(parent, "stroke1")
     .setPosition(340, 240)
     .setSize(50,20)
     
         .setValue(false)
     .setColorBackground(color(255,100))
            .setMode(ControlP5.SWITCH)
     ;  
     
     
   cp5.addToggle("fill1").plugTo(parent, "fill1")
     .setPosition(340,280)
     .setSize(50,20)
 
      .setValue(false)
     .setMode(ControlP5.SWITCH)
      
     ; 
       
       
         cp5.addButton("horizontalr").plugTo(parent, "horizontalr")
    .setValue(0)
    .setPosition(210, 280)
    .setSize(100, 19)
    ;

  // and add another 2 buttons
  cp5.addButton("verticalr").plugTo(parent, "verticalr")
    .setValue(100)
    .setPosition(210, 260)
    .setSize(100, 19)
    ;

  cp5.addButton("diagonal").plugTo(parent, "diagonal")
    .setPosition(210,240)
    .setSize(100, 19)
    .setValue(45)
    ;

  cp5.addColorWheel("cl1", 100, 100, 100 ).plugTo(parent, "cl1")
    .setRGB(color(0, 0, 0))  
    .setPosition(0, 10);

  cp5.addColorWheel("cl2", 100, 100, 100 ).plugTo(parent, "cl2")
    .setRGB(color(250))  
    .setPosition(100, 10);

  cp5.addSlider("layer1").plugTo(parent, "layer1")
    .setRange(0, 10)
    .setValue(0)
    .setPosition(10, 110)
    .setSize(100, 20)
    ;
      cp5.addSlider("layer2").plugTo(parent, "layer2")
    .setRange(0, 20)
    .setValue(0)
    .setPosition(10, 130)
    .setSize(100, 20)
    ;
      cp5.addSlider("layer3").plugTo(parent, "layer3")
    .setRange(0, 20)
    .setValue(0)
    .setPosition(10, 150)
    .setSize(100, 20)
    ;
         cp5.addSlider("layer4").plugTo(parent, "layer4")
    .setRange(0, 20)
    .setValue(0)
    .setPosition(10, 170)
    .setSize(100, 20)
    ;
     cp5.addSlider("title").plugTo(parent, "title")
    .setRange(0, 20)
    .setValue(0)                                                                  
    .setPosition(10, 190)
    .setSize(100, 20)
    ;
    
  cp5.addSlider("layershape").plugTo(parent, "layershape")
    .setRange(0, 10)
    .setValue(1)
    .setPosition(10, 240)
    .setSize(100, 30)
    ;


    
    
  cp5.addSlider("speed").plugTo(parent, "speed")
    .setRange(0, 10)
    .setValue(1)
    .setPosition(10, 270)
    .setSize(100, 30)
    ; 

  cp5.addSlider("speedmat").plugTo(parent, "speedmat")
    .setRange(0, 50)
    .setValue(1)
    .setPosition(10, 300)
    .setSize(100, 30)
    ;   


  cp5.addMatrix("myMatrix").plugTo(parent, "myMatrix")
    .setPosition(10, 340)
    .setSize(100, 100)
    .setGrid(nx, ny)
    .setGap(5, 1)
    .setInterval(200/speedmat)
    .setMode(ControlP5.MULTIPLES)
    .setColorBackground(color(120))
    .setBackground(color(40))
    ;
  cp5.getController("myMatrix").getCaptionLabel().alignX(CENTER);  
cp5.get(Matrix.class, "myMatrix").setInterval(200/1+speedmat); 
   
  
       
   cp5.addBang("errase").plugTo(parent, "errase")
    .setPosition(50, 550)
    .setSize(40, 40)
    ;

  cp5.addBang("bang").plugTo(parent, "bang")
    .setPosition(10, 550)
    .setSize(40, 40)
    ;
 cp5.addBang("reverse").plugTo(parent, "reverse")
    .setPosition(90, 550)
    .setSize(40, 40)
    ;

      
     
     /*
     
   cp5.addSlider("Brightness").plugTo(parent, "Brightness")
    .setRange(0, 255)
    .setValue(255)
    .setPosition(10, 460)
    .setSize(100, 20)
    ;   */
     
     
 cp5.addSlider("alphashape").plugTo(parent, "alphashape")
    .setRange(0, 255)
    .setValue(255)
    .setPosition(10, 490)
    .setSize(100, 20)
    ;
  cp5.addSlider("sizeshape").plugTo(parent, "sizeshape")
    .setRange(0, 10)
    .setValue(1)
    .setPosition(10, 510)
    .setSize(100, 30)
    ;   
           
           
           
           
 

  sl = cp5.addSlider2D("mod1").plugTo(parent, "mod1")
    .setPosition(200, 10)
    .setSize(100, 100)
    .setMinMax(20, 10, 360, 360)
    .setValue(140, 222)
    //.disableCrosshair()
    ;      
  sl1 = cp5.addSlider2D("mode2").plugTo(parent, "mode2")
    .setPosition(300, 10)
    .setSize(100, 100)
    .setMinMax(20, 10, 360, 360)
    .setValue(50, 50)
    //.disableCrosshair()
    ;          
           
           
           
              
           
   myChart = cp5.addChart("dataflow").plugTo(parent, "dataflow")
               .setPosition(200, 120)
               .setSize(200, 50)
               .setRange(-20, 20)
               .setView(Chart.LINE) // use Chart.LINE, Chart.PIE, Chart.AREA, Chart.BAR_CENTERED
               .setStrokeWeight(1.5)
               .setColorCaptionLabel(color(40))
               ;

  myChart.addDataSet("incoming");
  myChart.setData("incoming", new float[100]);          
           
           
      List l = Arrays.asList("BRIGHT", "COOL", "DARK", "FRESH", "HARD", "INTENSE", "LIGHT", "NEUTRAL", "SOFT", "WARM", "WEAK");     

  cp5.addScrollableList("dropdown").plugTo(parent, "dropdown")
    .setPosition(10, 670)
    .setSize(200, 100)
    .setBarHeight(20)
    .setItemHeight(20)
    .addItems(l)
    .close()  
    // .setType(ScrollableList.LIST) // currently supported DROPDOWN and LIST
    ;

  List l1 = Arrays.asList("ANALOGOUS", "COMPLEMENTARY", "COMPOUND", "LEFT_SPLIT_COMPLEMENTARY", "MONOCHROME", "RIGHT_SPLIT_COMPLEMENTARY"
    , "SINGLE_COMPLEMENT", "SPLIT_COMPLEMENTARY", "TETRAD", "TRIAD");     

  cp5.addScrollableList("dropdown1").plugTo(parent, "dropdown1")
    .setPosition(10, 650)
    .setSize(200, 100)
    .setBarHeight(20)
    .setItemHeight(20)
    .addItems(l1)
    .close()  
    // .setType(ScrollableList.LIST) // currently supported DROPDOWN and LIST
    ;

       
       
       
                cp5.addIcon("savex",10)
     .setPosition(20,600)
     .setSize(70,50)
     .setRoundedCorners(20)
     .setFont(pff)
     .setFontIcons(#00f205,#00f204)
     //.setScale(0.9,1)
     .setSwitch(true)
     .setColorBackground(color(255,100))
     .hideBackground()
     ;  
     
     
     cp5.addIcon("loadx",10)
     .setPosition(50,600)
     .setSize(70,50)
     .setRoundedCorners(20)
     .setFont(pff)
     .setFontIcons(#00f205,#00f204)
     //.setScale(0.9,1)
     .setSwitch(true)
     .setColorBackground(color(255,100))
     .hideBackground()
     ;  
     
       
     cp5.addTextfield("input")
     .setPosition(200,500)
     .setSize(150,20)
          .setFocus(true)
     .setColor(color(255,0,0))
     ;    
       
 
       
       
     // println(strategycolor +" "+range);
    
  /* here an item is stored as a Map  with the following key-value pairs:
   * name, the given name of the item
   * text, the given text of the item by default the same as name
   * value, the given value of the item, can be changed by using .getItem(n).put("value", "abc"); a value here is of type Object therefore can be anything
   * color, the given color of the item, how to change, see below
   * view, a customizable view, is of type CDrawable 
   */
strategy = ColorTheoryRegistry.getStrategyForName(strategycolor);
  colocrs = ColorList.createUsingStrategy(strategy, cocl);

  TColor col =ColorRange.getPresetForName(range ).getColor();


  ColorList colList = ColorList.createUsingStrategy(strategy, col);


  for (Iterator i = colList.iterator(); i.hasNext(); ) {
    c = (TColor) i.next();
    colocrs.add(c);
    selectedColor = c;
  }
      

    
       
  }

  void draw() {
    background(50);
//pat.speed(bpm%3);
 
pat2.extend("00000");
fill(pat.asColor());
rect(0,700,100,50);
fill(pat1.asColor());
rect(100,700,100,50);
fill(pat2.asColor());
rect(200,700,100,50);
fill(pat3.asColor());
rect(300,700,100,50);
fill(pat4.asColor());
rect(400,700,100,50);
  }
  
  
  
  
///////////////////////////////////////////////////////////////////////////////////////////////
//icon//
///////////////////////////////////////////////////////////////////////////////////////////////
void savex(boolean theValue) {
  cp5.saveProperties(("hello.properties"));
 
} 
void loadx(boolean theValue) {
 cp5.loadProperties(("hello.properties"));
} 

void  diagonal(){
 
rotani=60;

}


void  verticalr(){
 rotani=360;


}
void  horizontalr(){
 
rotani=90;

}



void  bpm(){
 


}
     ///////////////////////////////////////////////////////////////////////////////////////////////
//dropdown//
///////////////////////////////////////////////////////////////////////////////////////////////



 
void vertical() {






}



void dropdown(int n) {
  /* request the selected item based on index n */
  range=""+ cp5.get(ScrollableList.class, "dropdown").getItem(n).get("name").toString();
 // println( cp5.get(ScrollableList.class, "dropdown").getItem(n).get("name").toString());
  strategy =ColorTheoryRegistry.getStrategyForName(strategycolor);
  colocrs =  colocrs =  ColorList.createUsingStrategy(strategy, col);

 col =ColorRange.getPresetForName(range ).getColor();
  ColorList colList = ColorList.createUsingStrategy(strategy, col);


  for (Iterator i = colList.iterator(); i.hasNext(); ) {
    c = (TColor) i.next();
  //  colocrs.add(c);
    selectedColor = c;
  }
  
  //  bot = loadShape("bot1.svg");
}


void dropdown1(int n) {
  
  
  /* request the selected item based on index n */
  strategycolor=""+ cp5.get(ScrollableList.class, "dropdown1").getItem(n).get("name").toString();
//  if(strategycolor==null){strategycolor="error";            }
//  println(strategycolor +" "+range);


   strategy =ColorTheoryRegistry.getStrategyForName(strategycolor);
  colocrs =  colocrs =  ColorList.createUsingStrategy(strategy, col);

 col =ColorRange.getPresetForName(range ).getColor();
  ColorList colList = ColorList.createUsingStrategy(strategy, col);


  for (Iterator i = colList.iterator(); i.hasNext(); ) {
    c = (TColor) i.next();
    colocrs.add(c);
    selectedColor = c;
  }
}

  
  ///////////////////////////////////////////////////////////////////////////////////////////////
//errase//
///////////////////////////////////////////////////////////////////////////////////////////////

public void errase() {
  /*int theColor = (int)random(255);
  //println(strategycolor+"ee");

  for (int x=0; x<10; x++)
    for (int y=0; y<10; y++) {
      s0[x][y]=10;
      s1[x][y]=10;
      ss[x][y]=10;
      act[x][y]=false;
    } */
    

  cp5.get(Matrix.class,"myMatrix").clear();
      
 
 
    
  }
  
int ii=0, layer1=0, layer2=14,layer3=0,layer4=0,layershape,title=1,Brightness=255,diagonal=0, rotani=0, hozisontalr=0,verticalr=0,speedmat=1,alphashape=255;

 s=1;
}
  
  
}

 










///////////////////////////////////////////////////////////////////////////////////////////////
//icon//
///////////////////////////////////////////////////////////////////////////////////////////////
void fill1(boolean theValue) {
  println("got an event for icon", theValue);
  fill1=!fill1;
} 
void stroke1(boolean theValue) {
  println("got an event for icon", theValue);
  stroke1=!stroke1; 
} 

///////////////////////////////////////////////////////////////////////////////////////////////
//matrix//
///////////////////////////////////////////////////////////////////////////////////////////////
void myMatrix(int theX, int theY) {



 
 if(reverser) {  act[9-theX][theY]= true;  
  s0[9-theX][theY]=5-s1[9-theX][theY] ;
  Ani.to(this, 1, "h", random(0, 50), Ani.BOUNCE_IN);
 }
 if(!reverser) {  act[theX][theY]= true; 
 
 s0[theX][theY]=5-s1[theX][theY] ;
  Ani.to(this, 1, "h", random(0, 50), Ani.BOUNCE_IN);  }

 

  
  
}


///////////////////////////////////////////////////////////////////////////////////////////////
//reverse//
///////////////////////////////////////////////////////////////////////////////////////////////

public void reverse() {
  
  
  
  
  
 reverser=!reverser;
  //println(reverser);
 
}




///////////////////////////////////////////////////////////////////////////////////////////////
//bang//
///////////////////////////////////////////////////////////////////////////////////////////////

public void bang() {
 // int theColor = (int)random(10);
  ColorTheoryStrategy strategy =ColorTheoryRegistry.getStrategyForName(strategycolor);
  colocrs =  colocrs =  ColorList.createUsingStrategy(strategy, col);

  TColor col =ColorRange.getPresetForName(range ).getColor();
  ColorList colList = ColorList.createUsingStrategy(strategy, col);


  for (Iterator i = colList.iterator(); i.hasNext(); ) {
    c = (TColor) i.next();
    colocrs.add(c);
    selectedColor = c;
  }
  
}




///////////////////////////////////////////////////////////////////////////////////////////////
//matrix//
///////////////////////////////////////////////////////////////////////////////////////////////

void draw() {
  

  
  
 
 
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
    
      case 1:

    for (int x=startx; x<gridx-endx; x++)
      for (int y=starty; y<gridy-endy; y++) {
       // s1[x][y] += ( s0[x][y]-s1[x][y])*0.1;
        float s=s1[x][y];
          selectedColor = colocrs.get((x*y)%colocrs.size());
     //   fill(selecBrightnesstedColor.toARGB(),alphashape); 
      fill(selectedColor.toARGB(),alphashape); 
         selectedColor = colocrs.get(x%colocrs.size());
           stroke(selectedColor.toARGB(),alphashape); 
     
        if ( !act[x][y])Obshap(layershape, x*80,y*80, s   ,s);
      }
    break;

    case 2:

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

  case 3:

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


  case 4:
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


  case 5:
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







  case 6:
  
   
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
 
    

    
    
   case 11:

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
  case 7: 
  
  
  
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
  case 8: 
    ;
    break;
  case 9: 
    ;
    break;
  case 10: 
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





  /////////////////layer3//////////////////////////////////////////////

fill(layer3);
  switch(1) {

    
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
  case 66: 
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






 

///////////////////////////////////////////////////////////////////////////////////////////////
//layer4//
///////////////////////////////////////////////////////////////////////////////////////////////

  switch(layer4) {
      case 0:


    break;
  case 1:

    noStroke();  
    pushMatrix();
    fill(0);
    scale(2);
    translate(400*-0.5, -150);
    //rotate(frameCount/50);
    triangle(400, 200, 200, 500, 600, 500);
    popMatrix();


    break;
  case 2:
  
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
Title[0].scale(0.70);
Title[0].text("Mr OIZO",10, 450);
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


}





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



void controlEvent(ControlEvent theEvent) {
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
  translate((tx+50), (ty+50));
   rotate(radians(rotani));
  translate(-(tx+50),- (ty+50));
    translate((tx+50), (ty+50));
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
     

   break; 
 
    
    
    
    
  }  



   
   
  
   
}


void keyPressed() {
  OscMessage m;
  switch(key) {
    case('c'):
      /* connect to the broadcaster */
      m = new OscMessage("/server/connect",new Object[0]);
      oscP5.flush(m,myBroadcastLocation);     println("eee");
      break;
    case('d'):
      /* disconnect from the broadcaster */
      println("ee");
      m = new OscMessage("/server/disconnect",new Object[0]);
      oscP5.flush(m,myBroadcastLocation);  
      break;

  }  
}


/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  /* get and print the address pattern and the typetag of the received OscMessage */
  println("### received an osc message with addrpattern "+theOscMessage.addrPattern()+" and typetag "+theOscMessage.typetag());
  theOscMessage.print();
}



Map<String, String> midimapper = new HashMap<String, String>();

String ref(String theDevice, int theIndex) {
  return theDevice+"-"+theIndex;
}