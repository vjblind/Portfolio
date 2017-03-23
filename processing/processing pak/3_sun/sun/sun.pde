float xx,yy, x , y ,phi ,t,T,i;
void setup(){
  size(800,600);
  background( 0);
}

int x1,y1,x2,y2=0;
void draw(){
  T=7;smooth(3);
  background(0 );
translate(200,300);
int start =5,finish=400;
i+=0.05;
println(i);stroke(250,250,250);
strokeWeight(4 );
color col =color(250,0,0);
x=50;
y=-50;


xx=350;
yy=100;

x1=-200;x2=400;y1=0;y2=0;
int dx = x2 - x1;
int dy = y2 - y1;
for (float x = x1;x< x2;x+=2) {
 y = y1 + dy * (x - x1) / dx;

    point(200+sin(i)*3*cos(2*PI*radians( x*3)) +100*cos(2*PI*radians( +x/10)/1)+cos(2*PI*radians( x*i/50)*5)
    ,cos(i)*3*sin(2*PI*radians( x*3))+100*sin(2*PI*radians( +x/10)/1)+sin(2*PI*radians( x*i/50)*5));

}




}
