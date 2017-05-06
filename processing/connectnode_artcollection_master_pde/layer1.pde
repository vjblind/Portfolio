 ////////////////////layer1////////////////////////////////////////////////
  // fill(cl1);    
  ///////////////////////////////////////////////////////////////////////////////////////////////
  //matrix//
  ///////////////////////////////////////////////////////////////////////////////////////////////
  PGraphics pgx;
void layer_1(PGraphics l1, float xd, float yd){ strokeWeight(3);
   switch(layer1) {
      case 0: 
      l1.beginDraw();
  l1.lights();
  l1.clear();
  l1.noStroke();
  l1.translate(l1.width/2, l1.height/2);
  l1.rotateX(frameCount/xd);
  l1.rotateY(frameCount/yd);
  l1.box(80);
  l1.endDraw();
    break;
    
      case 1:
 /*   framcountc=1;
    for (int x=0; x<gridx; x++)
      for (int y=0; y<gridy; y++) { 
        selectedColor = colocrs.get((x*y)%colocrs.size());
        fill(selectedColor.toARGB(),alphashape); 
       
stroke(selectedColor.toARGB(),alphashape); 
        selectedColor = colocrs.get(x%colocrs.size());
        //     s1=((4+x)*constrain (framcountc*0.7%50, 0, 80) );
        s1[x][y] += ( s0[x][y]-s1[x][y])*0.1*speed;
        //s1[x][y]  =h;
        s=s1[x][y];
        if ( act[x][y])ss[x][y]=(h+s)*0.3; 

     Obshap(layershape,40+x*80, 40+y*80, ss[x][y], ss[x][y]  );
      }*/
    break;
    
    
       case 2:
 /*   framcountc=1;
    for (int x=0; x<gridx; x++)
      for (int y=0; y<gridy; y++) { 
        selectedColor = colocrs.get((x*y)%colocrs.size());
        fill(selectedColor.toARGB(),alphashape); 
       
stroke(selectedColor.toARGB(),alphashape); 
        selectedColor = colocrs.get(x%colocrs.size());
        //     s1=((4+x)*constrain (framcountc*0.7%50, 0, 80) );
        s1[x][y] += ( s0[x][y]-s1[x][y])*0.1*speed;
        //s1[x][y]  =h;
        s=s1[x][y];
        if ( act[x][y])ss[x][y]=(h+s)*0.3; 

     Obshap(layershape,40+x*80, 40+y*80, ss[x][y], ss[x][y]  );
      }*/
    break;   
    
    
    
    
  }}
 
    
 ////////////////////layer1////////////////////////////////////////////////
  // fill(cl1);    
  ///////////////////////////////////////////////////////////////////////////////////////////////
  //matrix//
  ///////////////////////////////////////////////////////////////////////////////////////////////    