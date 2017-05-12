ArrayList <Part> parts= new ArrayList<Part>();
 
void setup(){
size(800,600,P3D);background(0);
for(int x=0;x<50;x++)parts.add(new Part(x));

 
}


void draw(){  
//background(0); 
if(second()%10<1)background(0);
stroke(225,0,0);
noFill();

//for (Part xx : parts) {
  for (int i = 0; i < parts.size(); i++) {
   Part xxx = parts.get(i);
   
 xxx.update();
  xxx.detect(parts);
  xxx.draw();
 // println(xxx.id);
}

//if(millis()%500<1)filter(BLUR,13);

}

class Part{
  PVector pos = new PVector(0,0,0); 
  PVector vel = new PVector(0,0,0);
  PVector size = new PVector(0,0,0);
    PVector or = new PVector(0,0,0);
    PVector ttt= new PVector(pos.x,pos.y,0);
  int s=10;
  color skin =color(10,10,10);
  int ia=0;
  int id=0;
 float theta=0;
  
Part( int t){id=t;
pos.x+=125+(id%5)*100;
pos.y+=100+((id/5)%5)*100;
pos.z+=-100+(id/5)*10;
or.add(pos);
}
void update (){
if(millis()%500<10)ia=(int)random(5);
switch(ia )
{
case 1: vel.x++; stroke(250,0,0, 100); break;
case 2: vel.x--;break;
case 3: vel.y++;break;
case 4: vel.y--;break;
case 5: vel.z++;break;
case 6: vel.z--;break;

}
/* or.add(vel);
vel.normalize();


//if(dist(pos.x+s*0.5,pos.y,400,300)>500)vel.mult(-5);


PVector tt= new PVector(-mouseX,-mouseY,0);

tt.add(or);
 
tt.mult(-1);
tt.normalize();


//;


or.add(pos);

ttt.add(tt);
ttt.setMag(7);
//ttt.normalize();
or.add(ttt);

or.sub(pos);

*/


 or.add(vel);
vel.setMag(5);


//if(dist(pos.x+s*0.5,pos.y,400,300)>500)vel.mult(-5);


PVector tt= new PVector(-mouseX,-mouseY,0);

tt.add(pos);
 
tt.mult(-1);
tt.normalize();


//;


///
or.add(pos);

ttt.add(tt);
ttt.setMag(5+second()%5);
//ttt.normalize();
pos.add(ttt);

 




 //<>//
}
void detect(ArrayList <Part> t){ 
    stroke(#3C92D6, 100);
 stroke(50,50*vel.x,150, 5+vel.y*1); 
   for (int i = 1; i < parts.size(); i++) {
  Part reg = parts.get(i);
  //line(or.x+s*0.5,or.y,or.z+s*0.5,reg.pos.x+s*0.5,reg.pos.y,reg.pos.z);
 if(dist(pos.x+s*0.5,pos.y,pos.z+s*0.5,reg.pos.x+s*0.5,reg.pos.y,reg.pos.z)<millis()/10%300)
 
 {
  beginShape(LINES); stroke(50,50*vel.x,150, 5+vel.y*1); 

 vertex(pos.x,pos.y);
 vertex(reg.pos.x,reg.pos.y);  
  vertex((reg.pos.x+pos.x)*.5,(reg.pos.y+pos.y)*.5);  stroke(#3C92D6, 1);
   stroke(2,0,0, 1);
 
 endShape(); 
 
 
 
 //line(pos.x+s*0.5,pos.y,pos.z+s*0.5,reg.pos.x+s*0.5,reg.pos.y,reg.pos.z);
 }
 
 
 
  //line(pos.x+s*0.5,pos.y,or.x+s*0.5,or.y); 
  
   }
}


void draw(){ 
  
   blendMode(ADD);
  stroke(#3C92D6, 100);
 // fill(#3C92D6, 100);
  
    pushMatrix();
    translate(pos.x,pos.y,pos.z);

  //rect(0, 0, 10, 10);
    popMatrix();


    pushMatrix();
    translate(or.x,or.y,or.z);
 //rect(0, 0, 20, 20);
    popMatrix();
}
}