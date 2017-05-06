void setup(){
  size (500,500);
  background(0 );
}PFont font;
float slide=200,op=0,ko;
void draw(){
  background(0 );
  slide+=1;ko+=1;
  for(int index=0;index <60;index++){
 //rect(-20+(slide/2+(index%280)*5)%520,(index/40-index%14)*index%105,3,3);
 float d3 = 10 + (sin(20 + PI) * 40/2) + 40/2; ellipse(width, height/2, d3, d3);


  fill(250,250,index*5);
   //rect(-20+(+slide+(index%130)*30)%600,300+((index*index/30%50)*index*index/30%100)*30%520,30,30);
   //rect(-20+(+slide/2+(index%300)*30)%600,300+(index/15%15)*30%300,30,30);
noStroke();
   //rect(-20+(+slide+(index%300)*30)%600,0+(index/5)*30%300,30,30);
  // rect(-20+((30 +cos (slide/5%300) * 8))+(+slide+(index)*40)%600,    (index*7*index)/100+(70+cos (slide/3) * 8)+((30 +sin (slide/3) * 8)+(index/5%5)*40%300),30,30);
  // rect(-20+(+slide+(index)*40)%600,  20+(slide/index%20)+index/2*(index/5%5)*45%800,30,30);
  //fill(0,(((index)*40)%600),10);
     // rect(-20+((index)*40)%600,  200+((index/1)%1)*45%800+sin(slide/4)*150,30,30);
      //rect(-20+((index)*40)%600,  200+(index/1%1)*45%800+sin(index%slide%15/slide%15)*100,30,30);slide/
println( 200+(index/1%1)*45%800+sin(index*slide/400)*index+" "+  slide   ); 

    rect(-20+(slide*2+(index)*40)%540,200+   (sin(constrain(slide, 0, 200)%index*40 )*sin(constrain(slide, 30, 70)%500*0.04*(slide*0.03+(index%300))) * 60),5+index%10,5+index%10);
  //  rect(+(slide*2+(index)*40)%540,200+  (cos(constrain(slide, 30, 70)%300*0.004*(slide*0.03+(index%300))) * 60),5+index%10,5+index%10);
stroke(250);

//if (index==op%60)line (-20+(slide*2+(index)*40)%540,200+  (sin(constrain(slide, 30, 70)%300*0.004*(slide*0.03+(index%300))) * 60),(slide*2+(index)*40)%540,200+  (cos(constrain(slide, 30, 70)%300*0.004*(slide*0.03+(index%300))) * 60));
//if (index==op%60)rect(250,250,4+index* (cos(constrain(slide, 30, 70)%300*0.004*(slide*0.03+(index%300)))),4+index* (cos(constrain(slide, 30, 70)%300*0.004*(slide*0.03+(index%300)))));

  } 
  

  
pushStyle();


text("vjblind",100,450);
popStyle();
}void mouseClicked(){op++;}