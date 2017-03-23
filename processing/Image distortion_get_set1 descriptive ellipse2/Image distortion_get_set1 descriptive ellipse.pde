
float i=5;
PImage po= new PImage();
void setup(){
size (800,600);
background (0);
po= loadImage("montagne.jpg");
}
color c= color(250,0,0);
void draw()

{background(0);
//image(po,0,0);


i+=0.4;
for(int x=0 ;x<800;x+=80)
for(int y=0 ;y<600;y+=40){rect(x+y%80,y,40,40);
fill(250,x,y);
}
stroke(250,0,0);
//for(int x=0;x<800;x++)point(x,millis()/10%600);


for(int u=0 ;u<800;u+=1)
for(int uu=0 ;uu<600;uu+=1){
c = get(int(250+500/(10%20)*sin(2*PI*radians (u)*100)),int(400+500/((10%20))*cos(2*PI*radians(u)*100)));
stroke(0,0,250);

//set(int(u),int(uu),c);
//set(int(u,uu,c);


//set((int(u+400*sin(i%800/1)))%800,(+int(uu+40*cos(i/10*u)))%600,c);
set(int(250+500/(20)*sin(2*PI*radians (u)*10)),int(400+500/((20))*cos(2*PI*radians(u)*10)),c);
}

 color gradiant= color(250,0,0);
  color cola= color(250,2502,0);
    color colb= color(0,2502,250);
//color

i=i%100;
  for (float y = -200; y <=200; y++)
  for (float x= -200; x <= 200; x++){
  //  c = get(int(400+x*0.8),250+y*2);
  //  c = get(int(250+x%i%100),int(250+y%i%100));
c = get(int ((mouseX+100+x/1.5)%800),int((mouseY+y/1.5))%600);


   if ((x * x) + (y * y) <= (90*90)&&(x * x) + (y * y) >= (50*50))
    set(int ((250+x)),int(( +250+y)), c);
     
  if ((x * x) + (y * y)>= (100*100)&&(x * x) + (y * y) <= (150*150))   cola= get(int ((140+x)),int((+150 +y)));
         
if ((x * x) + (y * y)>= (125*125)&&(x * x) + (y * y) <= (150*150))     colb= get(int ((250+x)),int(( 250+y)));
     
     
      gradiant = lerpColor(cola, colb, 0.9);
 if ((x * x) + (y * y)>= (90*90)&&(x * x) + (y * y) <= (125*125))   
      set(int ((250+x)),int(( +250+y)), gradiant);  
      
if ((x * x) + (y * y)>= (125*125)&&(x * x) + (y * y) <= (150*150))   
    set(int ((250+x)),int(( +250+y)+10*cos(2*PI*radians( x/5)+i)), c);  
    

  }
  
}
