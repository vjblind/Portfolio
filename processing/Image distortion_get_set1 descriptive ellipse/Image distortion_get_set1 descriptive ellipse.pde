
float i=5;
void setup(){
size (800,600);
background (0);

}
color c= color(250,0,0);
void draw()

{background(0);i+=5;
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

 

  for (int y = -150; y <= 150; y++)
  for (int x= -150; x <= 150; x++){
  //  c = get(int(400+x*0.8),250+y*2);
    c = get(int(250+x%i%100),int(250+y%i%100));

      if ((x * x) + (y * y) <= (150 * 150))
     set(int ((100+x)),int(( +250+y)), c);
  }
  
}
