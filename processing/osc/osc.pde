import com.thomasdiewald.pixelflow.java.*; //<>//
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

ControlP5 cp5;
Slider2D sl, sl1;

Ani diameterAni;  


//Square square[]=new Square[100];
float px=0, py=0, s = 0, h=80;//sensor
color[] colors = {color(145, 195, 106), color(22, 154, 71), color(104, 182, 130), 
  color(26, 34, 106), color(1, 106, 172), color(107, 29, 105), 
  color(152, 20, 104), color(206, 27, 33), color(216, 77, 46), 
  color(230, 131, 46), color(238, 165, 34), color(254, 241, 15)};

int nx = 10;
int ny = 10;
int grid=10;

int easing=0;
int ii=0, layer1=0, layer2=14,layershape,  speedmat=1,alphashape=250;
float[] ppx=new float[100], ppy=new float[100];//sensor
HColorPool    colorsx;
float framcountc,speed=1,sizeshape=1,kick=0;

boolean  framcountb=true;
float[][] s0 = new float [10][10];
float[][] s1 = new float [10][10];
float[][] ss = new float [10][10];
boolean[][] act = new boolean [10][10];
boolean reverser=false,stroke1=true,fill1=false,shape2=false;

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






///////////////////////////////////////////////////////////////////////////////////////////////
//PShape//
///////////////////////////////////////////////////////////////////////////////////////////////

PShape bot;
PShape[] drawing=new PShape [20] ;







void settings() {
  size(800, 600, P3D);
  
}
void setup() {


  smooth(8);
    cf = new ControlFrame(this, 400, 800, "Controls");
  surface.setLocation(420, 10);
  noStroke();
  
  hint(DISABLE_OPTIMIZED_STROKE);
  
  textureMode(NORMAL);
  cp5 = new ControlP5(this);

  // create a new button with name 'buttonA'
  cp5.addButton("colorA")
    .setValue(0)
    .setPosition(210, 80)
    .setSize(100, 19)
    ;

  // and add another 2 buttons
  cp5.addButton("vertical")
    .setValue(100)
    .setPosition(210, 60)
    .setSize(100, 19)
    ;

  cp5.addButton("colorC")
    .setPosition(210, 40)
    .setSize(100, 19)
    .setValue(0)
    ;

  cp5.addColorWheel("cl1", 100, 100, 100 )
    .setRGB(color(0, 0, 0))  
    .setPosition(10, 10);

  cp5.addColorWheel("cl2", 100, 100, 100 )
    .setRGB(color(250))  
    .setPosition(110, 10);

  cp5.addSlider("layer1")
    .setRange(0, 10)
    .setValue(1)
    .setPosition(10, 110)
    .setSize(100, 30)
    ;
      cp5.addSlider("layer2")
    .setRange(0, 20)
    .setValue(1)
    .setPosition(10, 140)
    .setSize(100, 30)
    ;
  cp5.addSlider("layershape")
    .setRange(0, 10)
    .setValue(1)
    .setPosition(10, 230)
    .setSize(100, 30)
    ;


    
    
  cp5.addSlider("speed")
    .setRange(0, 10)
    .setValue(1)
    .setPosition(10, 270)
    .setSize(100, 30)
    ; 

  cp5.addSlider("speedmat")
    .setRange(0, 50)
    .setValue(1)
    .setPosition(10, 300)
    .setSize(100, 30)
    ;   


  cp5.addMatrix("myMatrix")
    .setPosition(10, 340)
    .setSize(200, 200)
    .setGrid(nx, ny)
    .setGap(10, 1)
    .setInterval(200/speedmat)
    .setMode(ControlP5.MULTIPLES)
    .setColorBackground(color(120))
    .setBackground(color(40))
    ;
  cp5.getController("myMatrix").getCaptionLabel().alignX(CENTER);  



  sl = cp5.addSlider2D("mod1")
    .setPosition(590, 10)
    .setSize(100, 100)
    .setMinMax(20, 10, 360, 360)
    .setValue(140, 222)
    //.disableCrosshair()
    ;      
  sl1 = cp5.addSlider2D("mode2")
    .setPosition(700, 10)
    .setSize(100, 100)
    .setMinMax(20, 10, 360, 360)
    .setValue(50, 50)
    //.disableCrosshair()
    ;
 cp5.addSlider("alphashape")
    .setRange(0, 250)
    .setValue(250)
    .setPosition(610, 230)
    .setSize(100, 30)
    ;
  cp5.addSlider("sizeshape")
    .setRange(0, 10)
    .setValue(1)
    .setPosition(610, 260)
    .setSize(100, 30)
    ;   
    
  List l = Arrays.asList("BRIGHT", "COOL", "DARK", "FRESH", "HARD", "INTENSE", "LIGHT", "NEUTRAL", "SOFT", "WARM", "WEAK");     

  cp5.addScrollableList("dropdown")
    .setPosition(590, 130)
    .setSize(200, 100)
    .setBarHeight(20)
    .setItemHeight(20)
    .addItems(l)
    .close()  
    // .setType(ScrollableList.LIST) // currently supported DROPDOWN and LIST
    ;

  List l1 = Arrays.asList("ANALOGOUS", "COMPLEMENTARY", "COMPOUND", "LEFT_SPLIT_COMPLEMENTARY", "MONOCHROME", "RIGHT_SPLIT_COMPLEMENTARY"
    , "SINGLE_COMPLEMENT", "SPLIT_COMPLEMENTARY", "TETRAD", "TRIAD");     

  cp5.addScrollableList("dropdown1")
    .setPosition(590, 150)
    .setSize(200, 100)
    .setBarHeight(20)
    .setItemHeight(20)
    .addItems(l1)
    .close()  
    // .setType(ScrollableList.LIST) // currently supported DROPDOWN and LIST
    ;

  cp5.addBang("errase")
    .setPosition(50, 540)
    .setSize(40, 40)
    ;

  cp5.addBang("bang")
    .setPosition(10, 540)
    .setSize(40, 40)
    ;
 cp5.addBang("reverse")
    .setPosition(90, 540)
    .setSize(40, 40)
    ;


     
       cp5.addIcon("stroke1",10)
     .setPosition(590,310)
     .setSize(70,50)
     .setRoundedCorners(20)
     .setFont(createFont("fontawesome-webfont.ttf", 20))
     .setFontIcons(#00f205,#00f204)
     //.setScale(0.9,1)
     .setSwitch(true)
     .setColorBackground(color(255,100))
     .hideBackground()
     ;  
     
     
   cp5.addIcon("fill1",10)
     .setPosition(640,310)
     .setSize(70,50)
     .setRoundedCorners(20)
     .setFont(createFont("fontawesome-webfont.ttf", 20))
     .setFontIcons(#00f205,#00f204)
     //.setScale(0.9,1)
     .setSwitch(true)
     .setColorBackground(color(255,100))
     .hideBackground()
     ;  
     
     
     
     
            cp5.addIcon("savex",10)
     .setPosition(590,510)
     .setSize(70,50)
     .setRoundedCorners(20)
     .setFont(createFont("fontawesome-webfont.ttf", 20))
     .setFontIcons(#00f205,#00f204)
     //.setScale(0.9,1)
     .setSwitch(true)
     .setColorBackground(color(255,100))
     .hideBackground()
     ;  
     
     
   cp5.addIcon("loadx",10)
     .setPosition(640,510)
     .setSize(70,50)
     .setRoundedCorners(20)
     .setFont(createFont("fontawesome-webfont.ttf", 20))
     .setFontIcons(#00f205,#00f204)
     //.setScale(0.9,1)
     .setSwitch(true)
     .setColorBackground(color(255,100))
     .hideBackground()
     ;  

 // create a toggle and change the default look to a (on/off) switch look
  cp5.addToggle("shape2")
     .setPosition(700,320)
     .setSize(50,20)
     .setValue(false)
     .setMode(ControlP5.SWITCH)
     ;
     
     
  myChart = cp5.addChart("dataflow")
               .setPosition(350, 10)
               .setSize(200, 50)
               .setRange(-20, 20)
               .setView(Chart.LINE) // use Chart.LINE, Chart.PIE, Chart.AREA, Chart.BAR_CENTERED
               .setStrokeWeight(1.5)
               .setColorCaptionLabel(color(40))
               ;

  myChart.addDataSet("incoming");
  myChart.setData("incoming", new float[100]);
       
       
  /*     
  cp5.addMatrix("myMatrix_set")
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


  for (int x=0; x<10; x++)
    for (int y=0; y<10; y++) {
      s0[x][y]=10;
      s1[x][y]=10;
      ss[x][y]=10;
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
    
    cp5.addToggle("auto")
       .plugTo(parent, "auto")
       .setPosition(10, 70)
       .setSize(50, 50)
       .setValue(true);
       
    cp5.addKnob("blend")
       .plugTo(parent, "c3")
       .setPosition(100, 300)
       .setSize(200, 200)
       .setRange(0, 255)
       .setValue(200);
       
    cp5.addNumberbox("color-red")
       .plugTo(parent, "c0")
       .setRange(0, 255)
       .setValue(255)
       .setPosition(100, 10)
       .setSize(100, 20);
       
    cp5.addNumberbox("color-green")
       .plugTo(parent, "c1")
       .setRange(0, 255)
       .setValue(128)
       .setPosition(100, 70)
       .setSize(100, 20);
       
    cp5.addNumberbox("color-blue")
       .plugTo(parent, "c2")
       .setRange(0, 255)
       .setValue(0)
       .setPosition(100, 130)
       .setSize(100, 20);
       
   /* cp5.addSlider("speed")
       .plugTo(parent, "speed")
       .setRange(0, 0.1)
       .setValue(0.01)
       .setPosition(100, 240)
       .setSize(200, 30);*/
       
  }

  void draw() {
    background(190);
  }
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
  
  
    bot = loadShape("bot1.svg");
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
//icon//
///////////////////////////////////////////////////////////////////////////////////////////////
void savex(boolean theValue) {
  cp5.saveProperties(("hello.properties"));
 
} 
void loadx(boolean theValue) {
 cp5.loadProperties(("hello.properties"));
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

 
 
 
 
  
  
  // act[theY][theX]=true;
  
  
}
///////////////////////////////////////////////////////////////////////////////////////////////
//
// myMatrix_set//
///////////////////////////////////////////////////////////////////////////////////////////////
/*void myMatrix_set(int theX, int theY) {
 act {theX][theY]= true; 
   
    cp5.loadProperties((theX+".properties"));
}
*/


///////////////////////////////////////////////////////////////////////////////////////////////
//reverse//
///////////////////////////////////////////////////////////////////////////////////////////////

public void reverse() {
  
  
  
  
  
 reverser=!reverser;
 println(reverser);
 
}




///////////////////////////////////////////////////////////////////////////////////////////////
//bang//
///////////////////////////////////////////////////////////////////////////////////////////////

public void bang() {
  int theColor = (int)random(255);
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
//errase//
///////////////////////////////////////////////////////////////////////////////////////////////

public void errase() {
  int theColor = (int)random(255);
  println(strategycolor+"ee");

  for (int x=0; x<10; x++)
    for (int y=0; y<10; y++) {
      s0[x][y]=10;
      s1[x][y]=10;
      ss[x][y]=10;
      act[x][y]=false;
    } 
  cp5.get(Matrix.class, "myMatrix").clear();

  h=0;

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
  cp5.get(Matrix.class, "myMatrix").setInterval(200/1+speedmat);
   // unshift: add data from left to right (first in)
  //myChart.unshift("incoming", (sin(frameCount*0.1)*20));
  
  
  kick=  sin(frameCount*0.1)*10 ;
  // push: add data from right to left (last in)
  myChart.push("incoming", (kick));
 

  background(0);
  fill(0, 05);
  rect(400, 300, 800, 600);
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
  case 1:

    for (int x=0; x<grid; x++)
      for (int y=0; y<grid; y++) {
        s1[x][y] += ( s0[x][y]-s1[x][y])*0.1;
        float s=s1[x][y];
          selectedColor = colocrs.get((x*y)%colocrs.size());
        fill(selectedColor.toARGB(),alphashape); 
         selectedColor = colocrs.get(x%colocrs.size());
           stroke(selectedColor.toARGB(),alphashape); 
     
        if ( !act[x][y])Obshap(layershape, 40+x*80, 40+y*80, s+(50*cos(0.010*framcountc*(2*PI)))+(y*sin(0.00010*framcountc*(2*PI))), s+
          (50*cos(0.010*framcountc*(2*PI)))+(y*sin(0.00010*framcountc*(2*PI))));
      }
    break;



  case 2:

    for (int x=0; x<10; x++)
      for (int y=0; y<10; y++) {
        
        
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

    for (int x=0; x<10; x++)
      for (int y=0; y<10; y++) {
        
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
    for (int x=0; x<10; x++)
      for (int y=0; y<10; y++) { 
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
    for (int x=0; x<10; x++)
      for (int y=0; y<10; y++) {
       
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
  
   
   for (int x=0; x<10; x++)
      for (int y=0; y<10; y++){
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
    
    
     case 777:
  
   
   for (int x=0; x<10; x++)
      for (int y=0; y<10; y++){
         
        fill(selectedColor.toARGB(),alphashape); 
        selectedColor = colocrs.get((y*x)%colocrs.size());
       stroke(selectedColor.toARGB(),alphashape); 
        selectedColor = colocrs.get(x%colocrs.size());
       Obshap(layershape,40+x*80, 40+y*80, 
          dist(40+x*80, 40+y*80, ppx[1], ppy[1])%200-framcountc*ppx[1]/50, 
          (dist(40+x*80, 40+y*80, ppx[1], ppy[1])%200-framcountc*ppx[1]/50));
          
          
          
      }
      
      
   for (int x=0; x<10; x++)
      for (int y=0; y<10; y++){
         
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

    for (int x=0; x<5; x+=2)
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

    for (int x=0; x<10; x++)
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








  /*
fill(250);
   px=320*sin(frameCount/100);py=100*cos(0.8*frameCount/(2*PI));
   ellipse(350+px,250+py,20,20);
   
   
   px=320*sin(frameCount/(2*PI));py=100*cos(0.8*frameCount/(2*PI));
   ellipse(350+px,250+py,20,20);
   
   
   px=100*sin(0.8*frameCount/(2*PI));py=100*cos(0.8*frameCount/(2*PI));
   ellipse(350+px,250+py,20,20);
   
   px=200*sin(0.8*frameCount/(2*PI))*cos(0.8*frameCount/(2*PI));py=200*cos(0.8*frameCount/(2*PI));
   ellipse(350+px,250+py,10,10);
   
   
   
   px=2000*sin(0.008*frameCount+(20*PI));
   py=200*cos(0.08*frameCount+(20*PI));
   ellipse(px/100+350,px/py+250,5,5);
   
   
   px=2000*sin(0.08*frameCount+(2*PI));
   py=400*sin(0.008*frameCount+(2*PI));
   ellipse(px/py+100+350,20*cos(0.08*frameCount+(2*PI))-20*cos(0.008*frameCount+(2*PI))+250,15,15);
   
   px=200*sin(0.01*frameCount+(2*PI))+200*sin(0.02*frameCount+(2*PI))+350;
   py=100*cos(0.008*frameCount+(2*PI))+250;
   ellipse(px,py,10,px/10);
   
   */  //fill(250,0,0);
  //noFill();

  /*

   
   
   */


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

fill(cl2);
  switch(1) {
  case 1:

    ellipse(px, py, 10, 10);
    ellipse(ppx[0], ppy[0], 50+  kick, 50+  kick);
    ellipse(ppx[1], ppy[1], ppy[1]/50, ppy[1]/50);
    ellipse(ppx[2], ppy[2], 50+  kick, 50+  kick);
    break;
  case 2:
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
  case 3:
    rect(px, py, 5, 5);
    rect(ppx[0], ppy[0], 10, 10);
    rect(ppx[1], ppy[1], ppy[1]/50, ppy[1]/50);
    rect(ppx[2], ppy[2], 10, 10); 
    ;
    break;
  case 4:
    line(px, py, ppx[0], ppy[0]);
    line(ppx[2], ppy[2], ppx[0], ppy[0]);


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
//layer3//
///////////////////////////////////////////////////////////////////////////////////////////////

  switch(2) {
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
     

     println(drawing[1].getChildCount());
     
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
 
 translate(tx+50, ty+50);  
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
rotate(radians(45));   
       triangle(+sx, -sx, -sx+sx, 0, sx+sx, 0);
 rotate(frameCount/50);
        popMatrix();
 
  break; 
 
    
      case 5://"Triangle":
     bot.disableStyle();  // Ignore the colors in the SVG

  
    strokeWeight(0.7);   
  stroke(255);          // Set the SVG fill to white
      shape(bot, tx,ty,sx,sy);           // Draw at coordinate (280, 40) at the default size
     

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
 // rotate(frameCount/50);
    ellipse(tx, ty, sx, sy);
    popMatrix();
    break;
    
    
      case 2://"rect":

    pushMatrix();
    //scale(2);
 // translate(400*-0.5, -100);
 // rotate(frameCount/50);
 
 translate(tx+50, ty+50);  
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
rotate(radians(45));   
       triangle(+sx, -sx, -sx+sx, 0, sx+sx, 0);
 rotate(frameCount/50);
        popMatrix();
 
  break; 
 
    
      case 5://"Triangle":
    
      //shape(bot, tx,ty,sx,sy);           // Draw at coordinate (280, 40) at the default size
     

   break; 
 
    
    
    
    
  }  
   
  
}

Map<String, String> midimapper = new HashMap<String, String>();

String ref(String theDevice, int theIndex) {
  return theDevice+"-"+theIndex;
}