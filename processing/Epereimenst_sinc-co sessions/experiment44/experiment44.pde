float xx,yy, x , y ,phi ,t,T,i;
void setup(){
  size(800,600);
  background( 0);
}int x1,y1,x2,y2=0;
void draw(){
  T=7;
  background(0 );
translate(200,300);
int start =5,finish=400;
i=13.5;
println(i);stroke(250,250,250);
strokeWeight(4 );
color col =color(250,0,0);
x=50;
y=-50;


xx=350;
yy=100;
//ellipse(x,y,10,10);

//ellipse(xx,yy,10,10);
//point(

x1=-100;x2=400;y1=0;y2=20;
int dx = x2 - x1;
int dy = y2 - y1;
for (int x = x1;x< x2;x++) {
 y = y1 + dy * (x - x1) / dx;
// point(x, y);
  point(100*cos(2*PI*radians( x)%30),y+100*sin(2*PI*radians( x)%10));
   //point(x,-50+y);
//point(x,-10+( 20 * cos(TWO_PI * x / 200+i))* sin(TWO_PI * x / 400+i)+y );

}


//ellipse((gg+h),lo,40,40);


for (int t=start;t<xx-x;t+=1){
  //float x = amplitude * cos(TWO_PI * frameCount / period);
  stroke(250,250,250,50);
//float f =23 * sin(TWO_PI * yy+t/finish -i*xx);
float f =t;
point(x+(t%xx),t);
//point(t, 100 * cos(TWO_PI * t / 100+i));

//stroke(0,250,0);
point(t+x,-100+( 20 * cos(TWO_PI * t / 20+i))* sin(TWO_PI * t /i)+f  );
//stroke(250,250,0);
//point(t,100+( 10 * cos(TWO_PI * t / 300+i))+(23 * cos(TWO_PI * t / 500-i))  );
if(23 * cos(TWO_PI * t / 100)==23)text(23 * cos(TWO_PI * t / 100),t+15,0);
}

ellipse(i*2000, 23 * sin(TWO_PI * i*2000 / 500-i),10,10);
ellipse(i*2000, 10 * cos(TWO_PI * i*2000 / 300+i),10,10);
ellipse(i*2000,-100+( 10 * cos(TWO_PI *  i*2000 / 300+i))+(23 * sin(TWO_PI *  i*2000 / 500-i)),10,10);

//line(0,0,600,0);
for(int Ti=0;Ti<T+1;Ti++)line(Ti*100,10,Ti*100,0);
for(int Ti=0;Ti<T+1;Ti++)line(10,-Ti*100,0,-Ti*100);
}
