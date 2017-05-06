  
  
  ///////////////////////////////////////////////////////////////////////////////////////////////
//PShape//
///////////////////////////////////////////////////////////////////////////////////////////////
  
  
  
  
  import controlP5.*;

ControlP5 cp5;

Accordion accordion;
 
 
 
 
 
 
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
CustomMatrix m,sm ;
Matrix loopMatrix , pMatrix ;
int slide;
float bpm=25, masterbpm=120;
int ping = 0;

int pong = 100;

Range range;
CheckBox player;
TestCanvas[] ttt= new TestCanvas[10];


  public void setup() {
    
    
    surface.setLocation(10, 10);
    cp5 = new ControlP5(this);
    
    
      gui();
    
  }

void gui() {
  
   cp5 = new ControlP5(this);
   m = new CustomMatrix(cp5, "matrix");
   m.setPosition(0, 600)
  .plugTo("sliderTicks2") 
  .setSize(400, 10)
  .setInterval(int(60000 / masterbpm))
  .setGrid(40,1)
  .setMode(ControlP5.MULTIPLES)
  .setColorBackground(color(120))
  .setBackground(color(40));
  
   
   cp5 = new ControlP5(this);
    sm = new CustomMatrix(cp5, "submatrix");
   sm.setPosition(0, 610)
  .plugTo("sliderTicks2") 
  .setSize(400, 10)
  .setInterval((int)((60000 / masterbpm)*40))
  .setGrid(40,1)
  .setMode(ControlP5.MULTIPLES)
  .setColorBackground(color(120))
  .setBackground(color(40));
  
   
   
   
     range = cp5.addRange("rangeController")
             // disable broadcasting since setRange and setRangeValues will trigger an event
             .setBroadcast(false) 
             .setPosition(0,630)
             .setSize(400,20)
             .setHandleSize(20)
             .setRange(0,40)
             .setRangeValues(20,30)
             // after the initialization we turn broadcast back on again
             .setBroadcast(true)
             .setColorForeground(color(255,40))
             .setColorBackground(color(255,40))  
             ;
             
  noStroke();             
 
 
  // use setMode to change the cell-activation which by 
  // default is ControlP5.SINGLE_ROW, 1 active cell per row, 
  // but can be changed to ControlP5.SINGLE_COLUMN or 
  // ControlP5.MULTIPLES
  player = cp5.addCheckBox("player")
                .setPosition(100, 650)
                .setSize(40, 40)
                .setItemsPerRow(3)
                .setSpacingColumn(11) 
                .setSpacingRow(20)
                .addItem("0", 0)
                .addItem("1", 50)
                .addItem("2", 100)
            
                ;



  
  
  // group number 1, contains 2 bangs
  Group g1 = cp5.addGroup("myGroup1")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(150)
                ;
  
  cp5.addBang("bang")
      .setLabel("play")
     .setPosition(10,20)
     .setSize(50,50)
     .moveTo(g1)
     .plugTo(this,"shuffle");
     ;
     
  // group number 2, contains a radiobutton
  Group g2 = cp5.addGroup("myGroup2")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(150)
                ;
  
  cp5.addRadioButton("radio")
     .setPosition(10,20)
     .setItemWidth(20)
     .setItemHeight(20)
     .addItem("black", 0)
     .addItem("red", 1)
     .addItem("green", 2)
     .addItem("blue", 3)
     .addItem("grey", 4).plugTo(parent, "c0")

     .setColorLabel(color(255))
     .activate(2)
     .moveTo(g2)
     ;

  // group number 3, contains a bang and a slider
  Group g3 = cp5.addGroup("myGroup3")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(150)
                ;
  
  cp5.addBang("shuffle")
     .setPosition(10,20)
     .setSize(40,50)
     .moveTo(g3)
     ;
     
  cp5.addSlider("hello")
     .setPosition(60,20)
     .setSize(100,20)
     .setRange(100,500)
     .setValue(100)
     .moveTo(g3)
     ;
     
  cp5.addSlider("world")
     .setPosition(60,50)
     .setSize(100,20)
     .setRange(100,500)
     .setValue(200)
     .moveTo(g3)
     ;

    cp5.addToggle("auto")
       .plugTo(parent, "auto")
       .setPosition(150, 70)
       .setSize(50, 50)
        .setValue(1)
     .moveTo(g1)
     ;
   cp5.addSlider("speed")
       .plugTo(parent, "speed")
       .setRange(0, 0.1)
       .setValue(0.01)
       .setPosition(50, 50)
       .setSize(50, 30)
       .moveTo(g2)
           ;
  
 // group number 2, contains a radiobutton
  Group g4 = cp5.addGroup("myGroup4")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(150)
                ;
  
  // group number 2, contains a radiobutton
  Group g5 = cp5.addGroup("myGroup5")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(150)
                ;
    // group number 2, contains a radiobutton
  Group g6 = cp5.addGroup("myGroup6")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(150)
                ;
   cp5.addGroup("myGroup69")
     .setLabel("ttt[1]")
     .setPosition(0,0)
     .setWidth(200)
     .moveTo(g6)
     .addCanvas(new TestCanvas())
    ;
 // create a new accordion
  // add g1, g2, and g3 to the accordion.
  accordion = cp5.addAccordion("acc")
                 .setPosition(10,10)
                 .setWidth(200)
                 .addItem(g1)
                 .addItem(g2)
                 .addItem(g3)
                 .addItem(g4)
                 .addItem(g5) 
                 .addItem(g6)
                 ;
                 
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.open(0,1,2);}}, 'o');
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.close(0,1,2);}}, 'c');
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.setWidth(300);}}, '1');
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.setPosition(0,0);accordion.setItemHeight(190);}}, '2'); 
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.setCollapseMode(ControlP5.ALL);}}, '3');
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.setCollapseMode(ControlP5.SINGLE);}}, '4');
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {cp5.remove("myGroup1");}}, '0');
  
  accordion.open(0,1,2);
  
  // use Accordion.MULTI to allow multiple group 
  // to be open at a time.
  accordion.setCollapseMode(Accordion.MULTI);
  
  // when in SINGLE mode, only 1 accordion  
  // group can be open at a time.  
  // accordion.setCollapseMode(Accordion.SINGLE);
}
  

 
int nx = 50;
int ny = 1;

void radio(int theC) {
  switch(theC) {
    case(0):c=color(0,200);break;
    case(1):c=color(255,0,0,200);break;
    case(2):c=color(0, 200, 140,200);break;
    case(3):c=color(0, 128, 255,200);break;
    case(4):c=color(50,128);break;
  }
} 

void myMatrix() {
  
 // cp5.get(Matrix.class,"myMatrix").clear();
   
}

public void pause( int theValue ) {
 
 
   m.setInterval((int)(60000 / masterbpm)) ;
   sm.setInterval((int)(60000 / masterbpm)*40) ;
/*if (mouseX>100){  m.pause =false; }
else{  m.pause =true; }
println("pause update, done."+theValue+"  "+m.pause  );*/
}



void controlEvent(ControlEvent theControlEvent) {
  
 
  
    if (theControlEvent.isFrom(player)) {
 
    print("got an event from "+player.getName()+"\t\n");
    // checkbox uses arrayValue to store the state of 
    // individual checkbox-items. usage:
    println(player.getArrayValue());
    int col = 0;
    for (int i=0;i<player.getArrayValue().length;i++) {
      int n = (int)player.getArrayValue()[i];
      print(n);
       if(n==0) {
  print("succes");
      }
          if(n==1) {
  print("loose");
      }
    }
    println();    
  }
  
  
  
  
  
  if(theControlEvent.isFrom("rangeController")) {
    // min and max values are stored in an array.
    // access this array with controller().arrayValue().
    // min is at index 0, max is at index 1.
    ping = int(theControlEvent.getController().getArrayValue(0));
    pong = int(theControlEvent.getController().getArrayValue(1));
   // println("range update, done.");
 


}
  
  
  
  
  
   //<>//
}


void shuffle() {
  c = color(random(255),random(255),random(255),random(128,255));
}

 

void sliderTicks2() {


}


 class TestCanvas extends Canvas {
  

  
  public void setup(PGraphics pg) {
    println("starting a test canvas.");
    n = 1;
  }
  public void draw(PGraphics pg) {
    

  r();
  }
  
  
  
  
  


}
    public    float n=1;
public  float a;PGraphics preview = createGraphics(200, 200,P3D);
   void r(){     n += 0.01;
     ellipseMode(CENTER);
     fill(lerpColor(color(0,100,200),color(0,200,100),map(sin(n),-1,1,0,1)));
     rect(0,0,200,200);;
    fill(255,150);
    a+=0.01;    
 
    ellipse(100,100,abs(sin(a)*150),abs(sin(a)*150));
    ellipse(40,40,abs(sin(a+0.5)*50),abs(sin(a+0.5)*50)); 
    ellipse(60,140,abs(cos(a)*80),abs(cos(a)*80));} 
void bpm(){
bpm=100;

}

float bumpinit=2;


 public void draw() {
 
  if(player.getArrayValue(0)==0.0)  m.pause=false;  
    if(player.getArrayValue(0)==1.0)  m.pause=true;

 
  
   //println("eee"+m.pause);
   
    background(0);  
   
    fill(250);
    
    bpm=(bpm-bumpinit);
    ellipse(20,750,bpm/2,bpm/2);
  }
  
  
  
  
  
  
  
// function called by our CustomMatrix with name matrix
public void matrix(int x, int y) {
  println("trigger", x, y);
}


// extend the Matrix class since we need to override the Matrix's sequencer
class CustomMatrix extends Matrix {

  Thread update;
boolean pause=false;
  CustomMatrix(ControlP5 cp5, String theName) {
    super(cp5, theName);
    stop(); // stop the default sequencer and
    // create our custom sequencer thread. Here we 
    // check if the sequencer has reached the end and if so
    // we updated to the next preset.
    update = new Thread(theName) {
      public void run( ) {
        while (true ) {
         if(!pause) cnt++; 
         //println(cnt);
      if(!pause)   bpm();else  bpm=10;
          cnt %= _myCellX;
          if (cnt==0) {
            // we reached the end and go back to start and 
            // update the preset 
           // println("rr");
          }
          trigger(cnt);
          try {
            sleep( _myInterval );
          } 
          catch ( InterruptedException e ) {
          }
        }
      }
    };
    update.start();
  }
  

  
}
 
 
 
  
}
 
 
 