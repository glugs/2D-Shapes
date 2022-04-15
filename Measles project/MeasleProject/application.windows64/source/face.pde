void face() {
  
  
  
  ////Left Eye
//rect(leftEyeX-eyeDiameter*1/2, leftEyeY-eyeDiameter*1/2, eyeDiameter, eyeDiameter);
ellipse(leftEyeX, leftEyeY, eyeDiameter, eyeDiameter);
//
//Right Eye
//rect(rightEyeX-eyeDiameter*1/2, rightEyeY-eyeDiameter*1/2, eyeDiameter, eyeDiameter);
ellipse(rightEyeX, rightEyeY, eyeDiameter, eyeDiameter);
//
 //eyes
  fill(#0F6719);
  ellipse(leftEye.x, leftEye.y, 300, 300);
  ellipse(rightEye.x+150, rightEye.y+0, 300, 300);
  fill(0);
 
  //
//Nose
fill(#FFDF24);

//rect(xNose2, yNose1, xNose3-xNose2, yNose3-yNose1);
triangle(xNose1, yNose1, xNose2, yNose2, xNose3, yNose3);
    

//
fill(#F04D5B);
 arc(1370, 1335, 1050, 1200, 0, 9.14);
//Mouth
fill(#F04D5B);
int mouthWidth = int (mouthX2 - mouthX1);
int mouthHeight = mouthOpen;
//rect(mouthX1-mouthOpen*1/2, mouthY1-mouthOpen*1/2, mouthWidth+mouthOpen, mouthHeight);
strokeWeight(mouthOpen); //testing: 100=400/4 mouthOpen=height*1/4
line(mouthX1, mouthY1, mouthX2, mouthY2);
strokeWeight(reset); //reset to 1 pixel
//

fill(#E38ECE);
 arc(1370, 1335, 1050, 900, 0, 3.14);
 //Layout our text space and typographical features
 

}
