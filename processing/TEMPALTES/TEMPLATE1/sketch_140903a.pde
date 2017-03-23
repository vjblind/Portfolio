int point=0;
int ia=0;
float xplay, yplay, xia,yia , lifeplay,bonus  =0;
color colorplayer, iacolor ;
boolean menu1 , menu2 , menu3, menu4 = false ; 
 color bonuscolor1 , bonuscolor2 , iacolor1 , playcolor1;

 void setup() 
 {size (800 , 600);
 frameRate(30);
 xia =120;
 }
 
 void draw(){
   background(150);

if (menu1==false){     intro();            }

if (menu2==true) game();

if (menu3==true) win();

if (menu4==true)loose();

 }
 
 void game(){
 
 //car
fill(iacolor) ;  stroke(iacolor1); 
rect(xia,yia,10,10);
fill(colorplayer ) ;  stroke(playcolor1); 
rect(xplay,yplay,10,10);
 
 
 //bonnus
 stroke(bonuscolor1); 
 fill(bonuscolor2);
 ellipse (10,10,10,10);
 //key
if (key=='z'||keyCode==UP)  iacolor=color(0,250,152);
if (key=='s'||keyCode==DOWN )  iacolor=color(0,250,152);
if (key=='q'||keyCode==LEFT)  iacolor=color(0,250,152);
if (key=='d'||keyCode==RIGHT)  iacolor=color(0,250,152);

 }
 
 
void intro(){    


textSize(32); 
text("intro" , width/2,height/2);
fill(0, 102, 153);

  if (key=='a'||keyCode==ENTER)   {menu1=true; menu2=true;  }

}
 void win(){}
 void loose(){}
 void ia(){}
