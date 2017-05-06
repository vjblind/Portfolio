///////////////////////////////////////////////////////////////////////////////////////////////
//ControlFrame//
///////////////////////////////////////////////////////////////////////////////////////////////

ControlFrame cf;
 
float bpm=25, masterbpm=120;
float bumpinit=2;

class ControlFrame extends PApplet {

  int w, h;
  PApplet parent;
  ControlP5 cp5;
  
  
CustomMatrix m,sm ;
Matrix loopMatrix , pMatrix ;
int slide;

int ping = 0;

int pong = 100;



int ping2 = 0;

int pong2 = 100;



Range range1,range2;
CheckBox player,player1,player2;
  Accordion accordion;
 
  
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
      
      
     // group number 1, contains 2 bangs
  Group g1 = cp5.addGroup("myGroup1")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(150)
                ;
                
                
                
                
      // create a new accordion
  // add g1, g2, and g3 to the accordion.
  accordion = cp5.addAccordion("acc")
                 .setPosition(10,10)
                 .setWidth(200)
                 .addItem(g1)
           /*  .addItem(g2)
                 .addItem(g3)
                 .addItem(g4)
                 .addItem(g5) 
                 .addItem(g6)*/
                 ;  
   accordion.open(0,1,2);
  
  // use Accordion.MULTI to allow multiple group 
  // to be open at a time.
  accordion.setCollapseMode(Accordion.MULTI);
  
  // when in SINGLE mode, only 1 accordion  
  // group can be open at a time.  
  // accordion.setCollapseMode(Accordion.SINGLE);
  
  
  
  
   m = new CustomMatrix(cp5, "matrix");
   m.setPosition(0, 700)
  .plugTo("sliderTicks2") 
  .setSize(400, 10)
  .setInterval(int(60000 / masterbpm))
  .setGrid(40,1)
  .setMode(ControlP5.MULTIPLES)
  .setColorBackground(color(120))
  .setBackground(color(40));
  
   
   cp5 = new ControlP5(this);
    sm = new CustomMatrix(cp5, "submatrix");
   sm.setPosition(0, 710)
  .plugTo("sliderTicks2") 
  .setSize(400, 10)
  .setInterval((int)((60000 / masterbpm)*40))
  .setGrid(40,1)
  .setMode(ControlP5.MULTIPLES)
  .setColorBackground(color(120))
  .setBackground(color(40));
  
       
  
        
        
        
        
        
        
        
  ///////////////////////////////////////////////////////////////////////////////////////////////
//layer1//
///////////////////////////////////////////////////////////////////////////////////////////////            
       
  range1 = cp5.addRange("rangeController")
             // disable broadcasting since setRange and setRangeValues will trigger an event
             .setBroadcast(false) 
             .setPosition(0,630)
             .setSize(400,20)
             .setHandleSize(20)
             .setRange(0,40)
             .setRangeValues(5,12)
             // after the initialization we turn broadcast back on again
             .setBroadcast(true)
             .setColorForeground(color(255,40))
             .setColorBackground(color(255,40))  
             ;
                   
       
       
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
       
       
       
    
       
  ///////////////////////////////////////////////////////////////////////////////////////////////
//layer4//
///////////////////////////////////////////////////////////////////////////////////////////////     
   
    
  range2 = cp5.addRange("rangeController1")
             // disable broadcasting since setRange and setRangeValues will trigger an event
             .setBroadcast(false) 
             .setPosition(0,550)
             .setSize(400,20)
             .setHandleSize(20)
             .setRange(0,40)
             .setRangeValues(5,12)
             // after the initialization we turn broadcast back on again
             .setBroadcast(true)
             .setColorForeground(color(250,50,255,40))
             .setColorBackground(color(255,40))  
             ;
                   
         
       
 // use setMode to change the cell-activation which by 
  // default is ControlP5.SINGLE_ROW, 1 active cell per row, 
  // but can be changed to ControlP5.SINGLE_COLUMN or 
  // ControlP5.MULTIPLES
  player1 = cp5.addCheckBox("player2")
                .setPosition(100, 580)
                .setSize(40, 40)
                .setItemsPerRow(3)
                .setSpacingColumn(11) 
                .setSpacingRow(20)
                .addItem("3", 0)
                .addItem("4", 50)
                .addItem("5", 100)
            
                ;       
              
       
    
       
     
       
   // use setMode to change the cell-activation which by 
  // default is ControlP5.SINGLE_ROW, 1 active cell per row, 
  // but can be changed to ControlP5.SINGLE_COLUMN or 
  // ControlP5.MULTIPLES
  player2 = cp5.addCheckBox("player3")
                .setPosition(350, 350)
                .setSize(40, 40)
                .setItemsPerRow(1)
                .setSpacingColumn(0) 
                .setSpacingRow(20)
                 .addItem("6", 0)
                .addItem("7", 50)
                .addItem("8", 100)
            
                ;         
       
     
       
       
       
       
       
       
       
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
  
  
      cp5.addKnob("masterbpm")
       .plugTo(parent, "masterbpm")
       .setPosition(150, 720)
       .setSize(50, 50)
       .setRange(100, 145)
       .setValue(120);
  
        
  
  
  
       
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
    .setPosition(0, 10)
     .moveTo(g1)
    ;

  cp5.addColorWheel("cl2", 100, 100, 100 ).plugTo(parent, "cl2")
    .setRGB(color(250))  
    .setPosition(100, 10) 
    .moveTo(g1);

  cp5.addSlider("layer1").plugTo(parent, "layer1")
    .setRange(0, 50)
    .setValue(0)
    .setPosition(10, 110)
    .setSize(100, 20)   .moveTo(g1)
    ;
      cp5.addSlider("layer2").plugTo(parent, "layer2")
    .setRange(0, 50)
    .setValue(0)
    .setPosition(10, 130)
    .setSize(100, 20)   .moveTo(g1)
    ;
      cp5.addSlider("layer3").plugTo(parent, "layer3")
    .setRange(0, 20)
    .setValue(0)
    .setPosition(10, 150)
    .setSize(100, 20)   .moveTo(g1)
    ;
         cp5.addSlider("layer4").plugTo(parent, "layer4")
    .setRange(0, 20)
    .setValue(0)
    .setPosition(10, 170)   .moveTo(g1)
    .setSize(100, 20)
    ;
     cp5.addSlider("title").plugTo(parent, "title")
    .setRange(0, 20)
    .setValue(0)                                                                  
    .setPosition(10, 190)
    .setSize(100, 20)   .moveTo(g1)
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
   
  
       
       
       
       
       
       /*
  cp5.addMatrix("xmyMatrix").plugTo(parent, "xmyMatrix")
    .setPosition(150, 550)
    .setSize(500, 100)
    .setGrid(setnx, setny)
    .setGap(4, 1)
    .setInterval(1000/speedmat)
    .setMode(ControlP5.MULTIPLES)
    .setColorBackground(color(120))
    .setBackground(color(40))
    ;
  cp5.getController("xmyMatrix").getCaptionLabel().alignX(CENTER);  
cp5.get(Matrix.class, "xmyMatrix").setInterval(1000/1+speedmat);   */     
       
       
   cp5.addBang("errase").plugTo(parent, "errase")
    .setPosition(50, 500)
    .setSize(20, 20)
    ;

  cp5.addBang("bang").plugTo(parent, "bang")
    .setPosition(10, 500)
    .setSize(20, 20)
    ;
 cp5.addBang("reverse").plugTo(parent, "reverse")
    .setPosition(90, 500)
    .setSize(20, 20)
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
    .setPosition(10, 450)
    .setSize(100, 20)
    ;
  cp5.addSlider("sizeshape").plugTo(parent, "sizeshape")
    .setRange(0, 10)
    .setValue(1)
    .setPosition(10, 480)
    .setSize(100, 20)
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
    .setSize(50, 100)
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
    .setSize(50, 100)
    .setBarHeight(20)
    .setItemHeight(20)
    .addItems(l1)
    .close()  
    // .setType(ScrollableList.LIST) // currently supported DROPDOWN and LIST
    ;

       
       
       
                cp5.addIcon("savex",10)
     .setPosition(220,500)
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
     .setPosition(250,500)
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
     .setPosition(200,480)
     .setSize(100,20)
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
 
// pause-play
  if(player.getArrayValue(0)==0.0)  m.pause=false;  
  if(player.getArrayValue(0)==1.0)  m.pause=true;


//pingpong
 // if(player.getArrayValue(1)==0.0)  m.pause=false;  
  
  // if(player.getArrayValue(1)==0.0) println("yy");  
  if(player.getArrayValue(1)==1.0)pingpong1();
  
  
  
   if(player.getArrayValue(2)==1.0)rotani();
  //println(bpm);
  
  
  
  
  
 if(player1.getArrayValue(1)==1.0)pingpong2();
  
   //  if(player2.getArrayValue(2)==1.0)glitch1=true else glitch1=false;
  
     bpm=(bpm-bumpinit);
    ellipse(20,750,bpm/2,bpm/2);
    
    ellipse(20,750,bpm/4,bpm/4);
  }
  
  
    void rotani(){
  
 if(second()%7>3 ){   rotani++;rotani*=speed;
 //println("oops");  
 }
 else{  rotani--;rotani*=speed;
// println("pooss");  
 }
  
  }
  
  void pingpong1(){
  
 if(second()%7>3 ){   layer1=ping;
 //println("oops");  
 }
 else{   layer1=pong; 
// println("pooss");  
 }
  
  }
  

  void pingpong2(){
  
 if(second()%7>3 ){   layer4=ping2;
 //println("oops");  
 }
 else{   layer4=pong2; 
// println("pooss");  
 }
  
  } 
  
  
  ///////////////////////////////////////////////////////////////////////////////////////////////
//controlEvent//
///////////////////////////////////////////////////////////////////////////////////////////////

void controlEvent(ControlEvent theControlEvent) {
  
 

  
    m.setInterval((int)(60000 / masterbpm)) ;
   sm.setInterval((int)(60000 / masterbpm)*40) ;
         
         
    if (theControlEvent.isFrom(player)) {
 
   // print("got an event from "+player.getName()+"\t\n");
    // checkbox uses arrayValue to store the state of 
    // individual checkbox-items. usage:
// println(player.getArrayValue(1)+"  vff");
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
       if(n==2) {
  print("loop");
      }    
      
      
    }
    
  }
 


   if(theControlEvent.isFrom("rangeController1")) {
    // min and max values are stored in an array.
    // access this array with controller().arrayValue().
    // min is at index 0, max is at index 1.
    ping2 = int(theControlEvent.getController().getArrayValue(0));
    pong2 = int(theControlEvent.getController().getArrayValue(1));
   // println("range update, done.");
 


}

  if(theControlEvent.isFrom("rangeController")) {
    // min and max values are stored in an array.
    // access this array with controller().arrayValue().
    // min is at index 0, max is at index 1.
    ping = int(theControlEvent.getController().getArrayValue(0));
    pong = int(theControlEvent.getController().getArrayValue(1));
   // println("range update, done.");
 


}}
  
  
///////////////////////////////////////////////////////////////////////////////////////////////
//CustomMatrix//
///////////////////////////////////////////////////////////////////////////////////////////////
  
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

///////////////////////////////////////////////////////////////////////////////////////////////
//bpm//
///////////////////////////////////////////////////////////////////////////////////////////////
void bpm(){
bpm=100;
  
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
 
rotani=30;

}


void  verticalr(){
 rotani=360;


}
void  horizontalr(){
 
rotani=90;

}



     ///////////////////////////////////////////////////////////////////////////////////////////////
//dropdown//
///////////////////////////////////////////////////////////////////////////////////////////////



 



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
  
 
  }
  
 

 










///////////////////////////////////////////////////////////////////////////////////////////////
//icon//
///////////////////////////////////////////////////////////////////////////////////////////////
void fill1(boolean theValue) {
  //println("got an event for icon", theValue);
  fill1=!fill1;
} 
void stroke1(boolean theValue) {
 // println("got an event for icon", theValue);
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
   int theColor = (int)random(10);
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