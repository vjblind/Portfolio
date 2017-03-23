void setup(){
  size (500,500);
  frameRate(60);
  background(0 );
}PFont font;
float slide=0;
void draw(){
  background(0 );
  slide+=1;
  for(int index=0;index <1000;index++){
// rect(-20+(slide/2+(index%280)*5)%520,(index/40-index%14)*index%105,3,3);
  rect(-20+(slide+(index%280)*5)%520,100+(index/44-index%4)*5,3,3);
  fill(250,150,50);
 
 float a,b;
 a=(100+(index/103+slide-index%45)*5)%530;
 b=-20+(slide+(index%25)*5)%520;

  fill(250);

   rect(-20+(slide/2+(index%280)*5)%520,400+(index/40-index%14)*index%105,3,3);
//if((slide)>=520)stop();

  }
pushStyle();
font = loadFont("StarlinerBTN-48.vlw");
textFont(font, 32);
text("housegamejam",100,250);
popStyle();


//saveFrame(frameCount+".jpg" );
}
