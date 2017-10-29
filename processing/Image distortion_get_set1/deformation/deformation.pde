/* deform image produced by the draw loop with "set"*/
float i=0;
void setup(){
size (800,600);
background (0);

}
color c= color(0);
void draw()

{background(0);i+=5;
fill(250);
for(int x=0 ;x<800;x+=80)
for(int y=0 ;y<600;y+=40)rect(x+y%80,y,40,40);

stroke(250,0,0);
for(int x=0;x<800;x++)point(x,second());



for(int u=0 ;u<800;u+=1)
for(int uu=0 ;uu<600;uu+=1){
c = get(int(u), +int(uu ));
stroke(0,0,250);


//set(int(u,uu,c);


//set((int(3-u+i%800))%800,(+int(uu+40*cos(i/1000*u)))%600,c);
//set((int(3-u+50*10%800))%700,(+int(uu+40*cos(i/100+7/1000*u)))%600,c*uu);
//set((int(u+i%800))%800,(+int(uu+40*cos(i*10+10/1000*u)))%600,c*uu);

//set((int(u*1.01+i%2.2+i/20%800))%800,(+int(uu+40*cos((i/10%50)/1000*u)))%600,c);

set((int(u*1.01+i%2.2+10%800))%800,(+int(uu+40*cos((i/10%50)/1000*u)))%600,c);
}



}