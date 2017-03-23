float i=500;void setup(){
size(800,600);
}

void draw(){background(0);
i+=0.100000991;
for (int index =-250;index<250;index++)
for (int indey =-250;indey<250;indey++){color a= color(250,index*cos(2*PI*radians( index)+i)*indey*cos(2*PI*radians( indey)+i)/22,0);
float rr= index*sin(2*PI*radians(i));
//if((index*index)*cos(40*i)+(indey*indey)*sin(i)>=1800 &&(index*index)*cos(i/100)+(indey*indey)<=2900)set(int((250+index)+rr),+450+indey,a);
if((index*index)+((indey*indey))>=40000&&(index*index)+((indey*indey))<=48000)set(int((250+index)),int((+250+indey)+10*cos(4*PI*radians( index/2)+i*3)),a);

if((index*index)+((indey*indey))>=8000&&(index*index)+((indey*indey))<=8800)set(int((250+index)),int((+250+indey)+10*cos(4*PI*radians( index/4)+i)),a);

//if((index*index)+((indey*indey))>=5000&&(index*index)+((indey*indey))<=10800)set(int((250+index)),int((+250+indey)+10*cos(2*PI*radians( index/5)+i)/100),a);


if((index*index)+((indey*indey))>=400&&(index*index)+((indey*indey)+rr)<=4800)set(int((250+index)),int((+250+indey)),a);

}

}
