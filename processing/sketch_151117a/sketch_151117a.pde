 

int y=-111,w=1,h=1;float rayon=3,theta=4;
void setup(){size(800,600);
stroke(250,0,0);}
void draw (){
background(0);println(mouseX/100);
translate(300,400);

for(float x=-2220;x<1200;x+=1){

y=int(sin(x/19)*100);
y=int(x)+int(sin(x/19)*100);
//y=int(abs( abs( abs(x%10)-133 ) -34)+abs( abs( abs(x*3)-222)-34)           );

y=int(abs( abs(abs( abs( abs(x*2)-222)-222+x)-222)-44)            );

point(x,-1*((y)));

}



for(float x=0;x<3000;x+=radians(1)){
 //rayon=0.4+0.4*sin(1.1 );//row
// rayon=0.4+0.4*sin(1.1 );//row
//  rayon= (1+2*sin(x*8))+(x*0.09+2*cos(x*PI))+ (12+22*cos(PI*x));
 // rayon= (2*sin(x))*abs(20*cos(x))^(2*cos(33/x));
 // rayon= 200*sin(x)*cos(x*2);
 rayon= (3*cos(x*4))*(6*cos(x*4)+10+33*sin(x))+(16*cos(x*14))+(6*cos(x*140))+(404+20*cos(x*6))/2;
//point(rayon*cos(x), rayon*sin(x));
}

for(float x=-111;x<1200;x+=100){
y=int(sin(x/19)*100); 

text(x+"/"+y+"",x,y);

}



line(-550,-0,1200,0);
line(-0,-720,0,900);

}
  