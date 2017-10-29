int num=100;
Pa[] pa =new Pa[100000];PVector[] posm= new PVector[20];
int res=100;
void setup(){
size (800,600);
for(int x=0; x<16;x++)posm[x]=new PVector(random(800),random(600));
 
int t=0 ; 
for(int x=0; x< res;x++)for(int y=0 ; y<res;y++){t++;
pa[t]=new Pa(10+x*10,10+y*10); 
pa[t].id=t; 
}


//for(int x=0 ; x< num;x++)pa[x].id=10; 
}

void draw(){
 background(0);
for(int x=0 ,t=0 ; x< res;x++) for(int y=0 ; y< res;y++){t++; pa[t].update();}
for(int x=0,t=0 ; x< res;x++) for(int y=0 ; y< res;y++){t++; pa[t].draw();}

for(int x=0; x<10;x++)posm[x].add(new PVector(random(-1,1),random(-1,1)));

for(int x=0; x<10;x++)ellipse(posm[x].x,posm[x].y,2,2);


}

class Pa{
PVector pos= new PVector(0,0);


PVector pv= new PVector(0,0);
int id=0;float  theta ;
  Pa(float tx, float ty){ 
    pos.x=tx; pos.y=ty; 
 
pv.x=random(-100,100);  pv.y=random(-100,100);

pv.normalize(); 

pv.mult(5);
pv.x+=tx;   pv.y+=ty;

}
 void update(){  
//theta = map(noise(pos.x*.0000491,pos.y*0.0000891),0,0.8,0,TWO_PI); //if(millis()<10)

theta = map(noise(pos.x*.00491,pos.y*0.0091)+(100*sin(frameCount*.000101)),0,0.8,0,TWO_PI); //if(millis()<10)
//  theta =10+pos.x+pos.y*pos.y*2+frameCount*0.1; //if(millis()<10)
   //  theta =(id%(1+mouseX*0.5))*10; //if(millis()<10)

    {
//pv.x=random(-100,100);  pv.y=random(-100,100);
//theta+=dist(pos.x+theta,pos.y+theta,mouseX,mouseY);
//theta+=(frameCount*0.01+id*.0005*PI);
// pv = new PVector(cos(theta),sin(theta));

pv = new PVector(cos(theta),sin(theta));

pv.normalize(); 
//if(dist(pos.x,pos.y,posm[0].x,posm[0].y)<100)
//for(int x=0; x<10;x++)pv.rotate(new PVector(sin(posm[0].x),cos(posm[0].y)));


pv.mult(50);
pv.sub(pos);
for(int x=0; x<10;x++){  
  
//  posm[x].mult(dist(pos.x,pos.y,posm[x].x,posm[x].y));
if(dist(pos.x,pos.y,posm[x].x,posm[x].y)<100
&& dist(pos.x,pos.y,posm[x].x,posm[x].y)>50)pv.add(posm[x]);
//pv.mult(-1);
}




pv.normalize(); 
pv.mult(25);

pv.x+=pos.x;   pv.y+=pos.y;



 
 }}
  void draw(){  

    // stroke( 50 ,(cos(theta)+sin(theta))*200 ,(cos(theta)-sin(theta))*200 );
//stroke(dist(pos.x*10,pos.y*10,400,300),(cos(theta)+sin(theta))*250,100);
//stroke( (20*( 45-dist(pos.x*10,pos.y*10,400*10,10*300)/(100+theta*0.01))%(100+dist(pos.x*10,pos.y*10,400*10,10*300)/5-(200*sin(theta))))
 // %(dist(pos.x*10,pos.y*10,mouseX*10,10*mouseY)/20));

    
 // stroke( (( 250+dist(pos.x*10,pos.y*10,400*10,10*300)/2)%(dist(pos.x*10,pos.y*10,400*10,10*300)-2550))
 // %-(dist(pos.x*10,pos.y*10,mouseX*10,10*mouseY)/1));    
    
  
for(int x=0; x<10;x++){  stroke(dist(pos.x*10,pos.y*10,posm[x].x,posm[x].y)*0.1,0,theta);
    
    //stroke(250);
/*
for(int x=0; x<10;x++){  
 
//  posm[x].mult(dist(pos.x,pos.y,posm[x].x,posm[x].y));
if(dist(pos.x,pos.y,posm[x].x,posm[x].y)<100
&& dist(pos.x,pos.y,posm[x].x,posm[x].y)>50)
 stroke( 250,0,( 100-dist(pos.x*1,pos.y*1,posm[x].x,posm[x].y))*2);
theta=0;*/
}  

 line(pos.x,pos.y,pv.x,pv.y);
 // 

  }
  


}