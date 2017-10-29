import spout.*;
// DECLARE A SPOUT OBJECT
Spout spout;
int num=100;
Pa[] pa =new Pa[100000];
int res=100;
void setup(){

  // Initial window size
  size(800,600, P3D);
  textureMode(NORMAL);
  
  
int t=0 ; 
for(int x=0; x< res;x++)for(int y=0 ; y<res;y++){t++;
pa[t]=new Pa(10+x*10,10+y*10); 
pa[t].id=t; 
}
    
  // CREATE A NEW SPOUT OBJECT
  spout = new Spout(this);
  
  // CREATE A NAMED SENDER
  // A sender can be created now with any name.
  // Otherwise a sender is created the first time
  // "sendTexture" is called and the sketch
  // folder name is used.  
  spout.createSender("Spout Processing");

//for(int x=0 ; x< num;x++)pa[x].id=10; 
}

void draw(){
 background(0);
for(int x=0 ,t=0 ; x< res;x++) for(int y=0 ; y< res;y++){t++; pa[t].update();}
for(int x=0,t=0 ; x< res;x++) for(int y=0 ; y< res;y++){t++; pa[t].draw();}



  // OPTION 1: SEND THE TEXTURE OF THE DRAWING SURFACE
    // Sends at the size of the window    
    spout.sendTexture();
    

}

class Pa{
PVector pos= new PVector(0,0);
PVector pv= new PVector(0,0);
int id=0;float  theta ;
  Pa(float tx, float ty){ 
    pos.x=tx; pos.y=ty; 
 
pv.x=random(-1000,1000);  pv.y=random(-1000,1000);

pv.normalize(); 

pv.mult(0.0001);
pv.x+=tx;   pv.y+=ty;

}
 void update(){  
  // theta = map(noise(pos.x*.000491,pos.y*0.000891)+(100*sin(frameCount*.000101)),0,0.8,0,TWO_PI); //if(millis()<10)

  theta = map(noise(pos.x*.000491,pos.y*0.00891)+(100*sin(frameCount*.000101)),0,0.8,0,TWO_PI); //if(millis()<10)
  //theta =10+pos.x+pos.y*pos.y*2+frameCount*0.1; //if(millis()<10)
   //  theta =(id%(1+mouseX*0.5))*10; //if(millis()<10)

    {
//pv.x=random(-100,100);  pv.y=random(-100,100);
//theta+=dist(pos.x+theta,pos.y+theta,mouseX,mouseY);
//theta+=(frameCount*0.01+id*.0005*PI);
 pv = new PVector(cos(theta),sin(theta));


pv.normalize(); 

pv.mult(10);

pv.x+=pos.x;   pv.y+=pos.y;
 
 }}
  void draw(){  

       //stroke( 50 ,(cos(theta)+sin(the ta))*200 ,(cos(theta)-sin(theta))*200 );
//stroke(dist(pos.x*10,pos.y*10,400,300),(cos(theta)+sin(theta))*250,100);
  stroke( (( 450-dist(pos.x*10,pos.y*10,400*10,10*300)/(100+theta*0.01))%(100+dist(pos.x*10,pos.y*10,400*10,10*300)/10-(200*sin(theta)))));

    
  line(pos.x,pos.y,pv.x,pv.y);theta=0;
  }
  


}