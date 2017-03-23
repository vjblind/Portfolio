void setup() {
  size (500, 500);
  background(0 );
}
PFont font;
float slide=10, op=0;
void draw() {
  background(0 );
  slide+=1;
  for (int index=0; index <200; index++) {
    //rect(-20+(slide/2+(index%280)*5)%520,(index/40-index%14)*index%105,3,3);
    float d3 = 10 + (sin(20 + PI) * 40/2) + 40/2; 
    ellipse(width, height/2, d3, d3);


    fill(250);
    //rect(-20+(+slide+(index%130)*30)%600,300+((index*index/30%50)*index*index/30%100)*30%520,30,30);
    //rect(-20+(+slide/2+(index%300)*30)%600,300+(index/15%15)*30%300,30,30);
    noStroke();
    //rect(-20+(+slide+(index%300)*30)%600,0+(index/5)*30%300,30,30);
    // rect(-20+((30 +cos (slide/5%300) * 8))+(+slide+(index)*40)%600,    (index*7*index)/100+(70+cos (slide/3) * 8)+((30 +sin (slide/3) * 8)+(index/5%5)*40%300),30,30);
    // rect(-20+(+slide+(index)*40)%600,  20+(slide/index%20)+index/2*(index/5%5)*45%800,30,30);
    //fill(0,(((index)*40)%600),10);
    // rect(-20+((index)*40)%600,  200+((index/1)%1)*45%800+sin(slide/4)*150,30,30);
    rect(-20+((index)*40)%600, 200+(index/1%1)*45%800+sin(index%slide%15/slide%15)*100, 30, 30);//(sin(+slide/index*45+ PI) ;
    println( 200+(index/1%1)*45%800+sin(index*slide/4000)*index+" "+  slide +" " +op ); 

    rect(-20+(slide+(index)*40)%600, 100 + (index%14)* index/30, 30, 30);
  } 



  pushStyle();
  font = loadFont("StarlinerBTN-48.vlw");
  textFont(font, 32);
  text("vjblind", 100, 450);
  popStyle();
}
void mouseClicked() {
  op++;
}