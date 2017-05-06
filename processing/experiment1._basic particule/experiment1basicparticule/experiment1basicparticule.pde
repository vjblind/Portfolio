particul[] particul1= new particul[2000];

void setup(){background(0);
size(800,600);

for(int index=0;index <2000;index+=10){
particul1[index]=new  particul (10*(index%80),(5*(index/8)));
particul1[index].id=index;}
}
void draw(){
background(0);
stroke(250);
//translate(250,250);

for(int index=0;index <2000;index+=10)
particul1[index].draw();
for(int index=0;index <2000;index+=10)
particul1[index].update();

}

class particul{int id=0, size=(int)random(100);
 PVector local=new PVector(0,0);
 PVector motion=new PVector(0, 1*sin(millis()));

  particul(int x,int y){local =new PVector(x,y); }
  
  void draw(){
    stroke(250);
     fill(250);
  ellipse(local.x+100,local.y,size,size);
  fill(0);
  ellipse(local.x+100,local.y,size/2,size/2);
  } 
  void update(){
    size-=(random(10)*cos(millis()/1000+id))*0.2;
    motion=new PVector( random(10)/10*cos(millis()/1000), random(10)/10*sin(millis()/1000));
  local.add(motion);
  
  }
}