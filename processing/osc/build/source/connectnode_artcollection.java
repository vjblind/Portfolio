import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import spout.*; 
import hype.*; 
import hype.extended.behavior.*; 
import hype.extended.colorist.*; 
import hype.extended.layout.*; 
import hype.interfaces.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class connectnode_artcollection extends PApplet {














//Square square[]=new Square[100];
float px=0,py=0, s = 0;//sensor
int[] colors = {color(145,195,106),color(22,154,71),color(104,182,130),
                  color(26,34,106),color(1,106,172),color(107,29,105),
                  color(152,20,104),color(206,27,33),color(216,77,46),
                  color(230,131,46),color(238,165,34),color(254,241,15)};


         int ii=0;
float[] ppx=new float[100] ,ppy=new float[100];//sensor



public void setup(){

background(0);
frameRate(30);
}

public void draw(){
 // background(0);
 fill(0,05);
   rect(400,300,800,600);
  rectMode(CENTER) ;

  noFill();stroke(250,50);
for(int x=0;x<10;x++)
for(int y=0;y<10;y++)
rect(40+x*80,40+y*80,80,80);

fill(250,80);
for(int x=0;x<10;x++)
for(int y=0;y<10;y++){

 fill(20,240,100);
 stroke(20,240,100);
 if  (dist(x*80,y*80,350+px,250+py)<100){ s=10; }else s=0;

//rect(40+x*80,y*80,80-s,80-s);
}





switch(1){
case 1:

for(int x=0;x<10;x++)
for(int y=0;y<10;y++)
ellipse(40+x*80,40+y*80,(50*cos(0.010f*frameCount*(2*PI)))+(y*sin(0.00010f*frameCount*(2*PI))),
(50*cos(0.010f*frameCount*(2*PI)))+(y*sin(0.00010f*frameCount*(2*PI))));

break;

case 2:

for(int x=0;x<10;x++)
for(int y=0;y<10;y++)
ellipse(40+x*80,40+y*80,
dist(40+x*80,40+y*80,ppx[1],ppy[1])%200-mouseX*ppx[1]/100,
(dist(40+x*80,40+y*80,ppx[1],ppy[1])%200-mouseX*ppx[1]/100));

fill(250);
for(int x=0;x<10;x++)
for(int y=0;y<10;y++)
ellipse(40+x*80,40+y*80,
(dist(40+x*80,40+y*80,ppx[1],ppy[1])%200-mouseX*ppx[1]/80),
(dist(40+x*80,40+y*80,ppx[1],ppy[1])%200-mouseX*ppx[1]/80));
fill(0);

break;
case 3:

for(int x=0;x<10;x++)
for(int y=0;y<10;y++)
ellipse(40+x*80,40+y*80,
dist(40+x*80,40+y*80,ppx[1],ppy[1])%200-mouseX*ppx[1]/100,
(dist(40+x*80,40+y*80,ppx[1],ppy[1])%200-mouseX*ppx[1]/100));

fill(250);
for(int x=0;x<10;x++)
for(int y=0;y<10;y++)
ellipse(40+x*80,40+y*80,
(dist(40+x*80,40+y*80,ppx[1],ppy[1])%200-mouseX*ppx[1]/50),
(dist(40+x*80,40+y*80,ppx[1],ppy[1])%200-mouseX*ppx[1]/50));


fill(0);
/*for(int x=0;x<10;x+=1)
for(int y=0;y<10;y+=1){

rect(40+x*80,40+y*80,
(dist(40+x*80,40+y*80,ppx[1],ppy[1])%200-mouseX*ppx[1]/200),
(dist(40+x*80,40+y*80,ppx[1],ppy[1])%200-mouseX*ppx[1]/200));
}*/
for(int x=0;x<5;x+=2)
for(int y=0;y<5;y+=2){
  noStroke();  pushMatrix();
translate(80+x*80*2,80+y*80*1.5f);
rotate(frameCount/100);
rect(0,0,
(dist(40+x*80,40+y*80,ppx[1],ppy[1])%100*px/450),
(dist(40+x*80,40+y*80,ppx[1],ppy[1])%100*px/150)); popMatrix();


pushMatrix();
translate(80+x*80*2,80+y*80*1.5f);
rotate(frameCount/100);
rect(0,0,
(dist(40+x*80,40+y*80,ppx[1],ppy[1])%100*px/150),
(dist(40+x*80,40+y*80,ppx[1],ppy[1])%100*px/450)); popMatrix();

pushMatrix();
translate(x*80*2,dist(40+x*80,40+y*80,ppx[1],ppy[1])%100*px/450+y*80*2);
//rotate(frameCount/50);
triangle(+80, -100, -80+80, 0, 80+80, 0);
popMatrix();

}

;break;
case 4:

for(int x=0;x<5;x+=2)
for(int y=0;y<5;y+=2){
  noStroke();  pushMatrix();
translate(x*80*2,dist(40+x*80,40+y*80,ppx[1],ppy[1])%100*px/450+y*80*2);
//rotate(frameCount/50);
triangle(+80, -100, -80+80, 0, 80+80, 0);
popMatrix();
}



;break;
case 5: ;break;
case 6: ;break;
case 7: ;break;
case 8: ;break;
case 9: ;break;
case 10: ;break;
}






 noStroke();  pushMatrix();
 scale(2);
translate(400*-0.5f,-100);
//rotate(frameCount/50);
triangle(400,200,200,500, 600, 500);
popMatrix();

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

*///fill(250,0,0);
//noFill();

/*



*/
switch(13){
case 1: ;break;
case 2: ;break;
case 3: ;break;
case 4: ;break;
case 5: ;break;
case 6: ;break;
case 7: ;break;
case 8: ;break;
case 9: ;break;
case 10: ;break;
case 11: ;break;
case 12: ;break;
case 13:

px=100*sin(0.07f*frameCount+(20*PI))+350;
py=100*cos(0.07f*frameCount+(20*PI))+250;


ppx[0]=(50*cos(0.0070f*frameCount*(2*PI)))+px;
ppy[0]=(50*cos(0.010f*frameCount*(2*PI)))+py;

ppx[1]=(0.1f*px+10*sin(0.08f*frameCount+(2*PI)))+ppx[0];
ppy[1]=(10*cos(0.08f*frameCount+(2*PI)))+ppy[0];
/*
ppx[2]=(50*cos(0.010*frameCount*(2*PI)))+(150*sin(0.00010*frameCount*(2*PI)))+px;
ppy[2]=(50*cos(0.010*frameCount*(2*PI)))-(150*cos(0.00010*frameCount*(2*PI)))+py;
;*/
break;
case 14:

px=100*sin(0.07f*frameCount+(20*PI))+350;
py=100*cos(0.07f*frameCount+(20*PI))+250;

ppx[0]=(50*cos(0.010f*frameCount*(2*PI)))+(50*sin(0.00010f*frameCount*(2*PI)))+px;
ppy[0]=(50*cos(0.00010f*frameCount*(2*PI)))+py;

ppx[1]=(0.1f*px+10*sin(0.08f*frameCount+(2*PI)))+ppx[0];
ppy[1]=(10*cos(0.08f*frameCount+(2*PI)))+ppy[0];

ppx[2]=(50*cos(0.010f*frameCount*(2*PI)))+(150*sin(0.00010f*frameCount*(2*PI)))+px;
ppy[2]=(50*cos(0.010f*frameCount*(2*PI)))-(150*cos(0.00010f*frameCount*(2*PI)))+py;
;break;
case 15:
px=100*sin(0.007f*frameCount+(20*PI))+350;
py=100*cos(0.007f*frameCount+(20*PI))+250;

ppx[0]=(50*sin(0.00010f*frameCount*(2*PI)))+px;
ppy[0]=(50*cos(0.00010f*frameCount*(2*PI)))+py;

ppx[1]=(-60*cos(0.009f*frameCount/(2*PI)))-(50*sin(0.0008f*frameCount*(2*PI)))+ppx[0];
ppy[1]=(150*cos(0.008f*frameCount/(2*PI)))+ppy[0];


ppx[2]=(160*cos(0.009f*frameCount/(2*PI)))-(50*sin(0.0008f*frameCount*(2*PI)))+ppx[0];
ppy[2]=(150*cos(0.008f*frameCount/(2*PI)))+ppy[0];
break;

case 16:
px=100*sin(0.07f*frameCount+(20*PI))+350;
py=100*cos(0.07f*frameCount+(20*PI))+250;

ppx[0]=(50*sin(0.0010f*frameCount*(2*PI)))+px;
ppy[0]=(50*cos(0.0010f*frameCount*(2*PI)))+py;

ppx[1]=(-60*cos(0.09f*frameCount-(2*PI)))-(50*sin(0.0008f*frameCount*(2*PI)))+ppx[0];
ppy[1]=(150*cos(0.08f*frameCount-(2*PI)))+ppy[0];
break;

}
fill(20+py,240,100);







switch(3){
case 1:

ellipse(px,py,10,10);
ellipse(ppx[0],ppy[0],50,50);
ellipse(ppx[1],ppy[1],ppy[1]/50,ppy[1]/50);
ellipse(ppx[2],ppy[2],50,50);
break;
case 2:
 PShape s;
 s = createShape();
  s.beginShape(TRIANGLE_STRIP);
  s.vertex(px,py);
  s.vertex(ppx[0],ppy[0]);
  s.vertex(ppx[1],ppy[1]);
  s.vertex(ppx[2],ppy[2]);
    s.endShape();
   shape(s, 0, 0);

break;
case 3:rect(px,py,5,5);
rect(ppx[0],ppy[0],10,10);
rect(ppx[1],ppy[1],ppy[1]/50,ppy[1]/50);
rect(ppx[2],ppy[2],10,10); ;break;
case 4:
line(px,py,ppx[0],ppy[0]);
line(ppx[2],ppy[2],ppx[0],ppy[0]);


;break;
case 5: ;break;
case 6: ;break;
case 7: ;break;
case 8: ;break;
case 9: ;break;
case 10: ;break;
case 11: ;break;
case 12: ;break;
case 13: ;break;
case 14: ;break;
case 15:

break;

case 16:

break;

}





 fill(20+py,240,100+ppy[1]);
//triangle(px,py, ppx[0]*1.5,ppy[0],ppx[1],ppy[1]);

 /* int d = int(map(mouseX, 0, 100, 1, 20));
  bezierDetail(d);
  bezier(px,py, ppx[0],ppy[0], ppx[1],ppy[1], ppx[2],ppy[2]);*/
}
  public void settings() { 
size(800,600,P2D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--hide-stop", "connectnode_artcollection" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
