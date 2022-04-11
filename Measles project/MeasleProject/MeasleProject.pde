///Global Variables
PVector leftEye;
PVector rightEye;
int reset, smallerDisplayDimension, mouthOpen;
float rectFaceX, rectFaceY, rectFaceWidth, rectFaceHeight;
float faceX, faceY, faceDiameter;
float leftEyeX, leftEyeY, rightEyeX, rightEyeY, eyeDiameter;
float mouthX1, mouthY1, mouthX2, mouthY2;
float xNose1, yNose1, xNose2, yNose2, xNose3, yNose3;
float imageX, imageY, imageWidth, imageHeigth, imageWidthRatio=0.0, imageHeightRatio=0.0;
float largerDimension, smallerDimension;
PImage pic;
Boolean widthLarger=false, heightLarger=false;
//
void setup() 
{
   leftEye = new PVector(displayWidth*.38, displayHeight*.28);
 rightEye = new PVector(displayWidth*.57, displayHeight*.28);
//
pic = loadImage("f3a0c38b4ceb4f359fea2b43ab32a23c.jpg"); //450x470
int picWidth = 450; //Mine is 800, do not copy this!!!
int picHeight = 470; //Mine is 600, do not copy this!!!
if ( picWidth >= picHeight ) {
  largerDimension = picWidth;
  smallerDimension = picHeight;
  widthLarger = true;
} else {
  largerDimension = picHeight;
  smallerDimension = picWidth;
  heightLarger = true;
}//End Dimension Comparision
println(smallerDimension, largerDimension, widthLarger, heightLarger); //Verifying Variable details
//Note: single line IFs can be summarized to IF-ELSE or IF-ELSEIF-ELSE
if ( widthLarger == true ) imageWidthRatio = largerDimension / largerDimension;
if ( widthLarger == true ) imageHeightRatio = smallerDimension / largerDimension;
if ( heightLarger == true ) imageHeightRatio = largerDimension / largerDimension;
if ( heightLarger == true ) imageWidthRatio = smallerDimension / largerDimension;
println(imageWidthRatio, imageHeightRatio, smallerDimension/largerDimension, 600.0/800.0); //Verify variable values
//
imageX = width*0;
imageY = height*0;
imageWidth = width*imageWidthRatio;
imageHeigth = height*imageHeightRatio;
if ( imageWidth > width ) println("ERROR: Image is too wide"); //Simple Display Checker
if ( imageHeigth > height ) println("ERROR: Image is too high"); //Simple Display Checker

//
//Rectangle Layout
rect(imageX, imageY, imageWidth, imageHeigth);
image(pic, imageX, imageY, imageWidth, imageHeigth);


  //Display Geometry
fullScreen(); //size(); displayWidth, displayHeight
//Landscape, not square or portrait
println (width, height, displayWidth, displayHeight); //Verification of values
int appWidth = width, appHeight = height; //Swap with displayWidth, displayHeight for testing
println(appWidth, appHeight);
//
//Display Orientation: a few comparisons for IFs
//Computer tells us the orientation, go
String orientation = ( displayWidth >= displayHeight ) ? "Landscape or Square": "Portrait"; 
println("Display Orientation:", orientation); //Verify Veriables
if ( orientation=="Portrait" ) println("Turn your phun");
/*
if ( orientation=="Landscape or Square") 
{
  //Empty IF
} else { 
  println("Turn your phun");
} //FUN */
//
//Variable Population: notice using appWidth & appHeight to move between size() & fullScreen()
smallerDisplayDimension = appHeight; //ALWAYS in Landscape
reset = smallerDisplayDimension / smallerDisplayDimension; //returns "1"
rectFaceX = (appWidth*1/2) - (smallerDisplayDimension*1/2);
rectFaceY =appHeight*0;
rectFaceWidth = smallerDisplayDimension; //Square Shape
rectFaceHeight = smallerDisplayDimension; //Square Shape
faceX = appWidth*1/2;
faceY = appHeight*1/2;
faceDiameter = smallerDisplayDimension;
leftEyeX = appWidth*1.5/4;
leftEyeY = appHeight*1/4;
rightEyeX = appWidth*2.5/4;
rightEyeY = leftEyeY; //Best Practice: change one line of code
eyeDiameter = smallerDisplayDimension*1/4;
mouthX1 = leftEyeX;
mouthY1 = appHeight*3/4;
mouthX2 = rightEyeX;
mouthY2 = mouthY1;
mouthOpen = smallerDisplayDimension*1/4;
xNose1 = faceX;
yNose1 = leftEyeY;
xNose2 = faceX - leftEyeY*1/2;
yNose2 = faceY;
xNose3 = faceX + leftEyeY*1/2;
yNose3 = faceY ;
//
//Face: Circle = Inscribing a Circle in a Square
//Center a circle on display orientation
//rect(rectFaceX, rectFaceY, rectFaceWidth, rectFaceHeight);
fill(#FFF5F0);
ellipse(faceX, faceY, faceDiameter, faceDiameter);
//

} //End setup
//
void draw() 
{
  //background(200);
 // background(#000000);
  PVector mouseVector = new PVector(mouseX, mouseY);

  PVector leftPupil = leftEye.copy().add(mouseVector.copy().sub(leftEye).setMag(20)) ;
  PVector rightPupil = rightEye.copy().add(mouseVector.copy().sub(rightEye).setMag(20));
 //

 smooth();
noStroke();
fill(#D80B0B);
beginShape();
vertex(50, 15);
bezierVertex(50, -5, 10, 5, 50, 40);
vertex(50, 15);
bezierVertex(50, -5, 10, 5, 50, 40);
endShape();

//
//Measle
float measleDiameter = random(smallerDisplayDimension*1/100 , smallerDisplayDimension*1/25); //Range of measle size: small=*1/100, large=4xbigger (*1/25)
float measleRadius = measleDiameter*1/2;
println (measleRadius);
float measleX = random( rectFaceX+measleRadius, ( ( rectFaceX+rectFaceWidth) - measleRadius) );
float measleY = random( rectFaceY+measleRadius, ( ( rectFaceY+rectFaceHeight) - measleRadius) );
Boolean nightMode=false; //Note: IF-ELSE similar to ternary operator
//color red=#FF0000, measleColour=red, whiteReset=#000000;
color measleColour = ( nightMode==false ) ? color ( 255, random(0,50), random(120) ) : color ( 255, random(0,50), 0 ) ; //ternary operator for day:night
color whiteReset=#FFFFFF; // Note: need ranger here too
//
float measleRectX = measleX-measleDiameter*1/2;
float measleRectY = measleY-measleDiameter*1/2;
float measleWidth = measleDiameter;
float measleHeight = measleDiameter;
//rect( measleRectX, measleRectY, measleWidth, measleHeight);
//random values given other variables (similar to button code)
noStroke(); //Shape outline
fill(measleColour);
ellipse( measleX, measleY, measleDiameter, measleDiameter );
stroke(reset);
fill(whiteReset); //reset to first colour (i.e blackReset
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
  ellipse(leftPupil.x, leftPupil.y, 200, 200);
  ellipse(rightPupil.x+150, rightPupil.y+10, 200, 200);
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
} //End draw
//
void keyPressed() {} //End keypressed
//
void mousePressed() {} //End mousePressed
//
//End Main Program




































































































/*//Global variables


PVector leftEye;
PVector rightEye;

void setup(){
  fullScreen();
  leftEye = new PVector(width*.38, height*.28);
 rightEye = new PVector(width*.57, height*.28);
 
}

void draw(){
  background(200);
 // background(#000000);
  PVector mouseVector = new PVector(mouseX, mouseY);

  PVector leftPupil = leftEye.copy().add(mouseVector.copy().sub(leftEye).setMag(40)) ;
  PVector rightPupil = rightEye.copy().add(mouseVector.copy().sub(rightEye).setMag(10));
fill(#FFFFFF);
//draw the head
ellipse(1300, 910, 1800, 1800);
  fill(255);
  ellipse(leftEye.x, leftEye.y, 200, 200);
  ellipse(rightEye.x, rightEye.y, 200, 200);
  //eyes
  fill(0);
  ellipse(leftPupil.x, leftPupil.y, 100, 100);
  ellipse(rightPupil.x, rightPupil.y, 100, 100);
  //mouth
 arc(1290, 1225, 950, 500, 0, 3.14);
 //
 //Nose
 fill(#000000);
triangle(1170, 800, 1282, 1000, 1424, 800);

//teeth
rect(210, 210, 130, 130);
//

} 


///Global Variables
PVector leftEye;
PVector rightEye;
int reset, smallerDisplayDimension, mouthOpen;
float rectFaceX, rectFaceY, rectFaceWidth, rectFaceHeight;
float faceX, faceY, faceDiameter;
float leftEyeX, leftEyeY, rightEyeX, rightEyeY, eyeDiameter;
float mouthX1, mouthY1, mouthX2, mouthY2;
float xNose1, yNose1, xNose2, yNose2, xNose3, yNose3;
pic1 = loadImage("cartoon-chicken-coop-outline-isolated-on-white-background_gg105160839.jpg"); //Dimensions: width 1920, height 1280
//
void setup() 
{
   leftEye = new PVector(width*.38, height*.28);
 rightEye = new PVector(width*.57, height*.28);

  //Display Geometry
fullScreen(); //size(); displayWidth, displayHeight
//Landscape, not square or portrait
println (width, height, displayWidth, displayHeight); //Verification of values
int appWidth = width, appHeight = height; //Swap with displayWidth, displayHeight for testing
println(appWidth, appHeight);
//
//Display Orientation: a few comparisons for IFs
//Computer tells us the orientation, go
String orientation = ( displayWidth >= displayHeight ) ? "Landscape or Square": "Portrait"; 
println("Display Orientation:", orientation); //Verify Veriables
if ( orientation=="Portrait" ) println("Turn your phun");
/*
if ( orientation=="Landscape or Square") 
{
  //Empty IF
} else { 
  println("Turn your phun");
} //FUN 
//
//Variable Population: notice using appWidth & appHeight to move between size() & fullScreen()
smallerDisplayDimension = appHeight; //ALWAYS in Landscape
reset = smallerDisplayDimension / smallerDisplayDimension; //returns "1"
rectFaceX = (appWidth*1/2) - (smallerDisplayDimension*1/2);
rectFaceY =appHeight*0;
rectFaceWidth = smallerDisplayDimension; //Square Shape
rectFaceHeight = smallerDisplayDimension; //Square Shape
faceX = appWidth*1/2;
faceY = appHeight*1/2;
faceDiameter = smallerDisplayDimension;
leftEyeX = appWidth*1.5/4;
leftEyeY = appHeight*1/4;
rightEyeX = appWidth*2.5/4;
rightEyeY = leftEyeY; //Best Practice: change one line of code
eyeDiameter = smallerDisplayDimension*1/4;
mouthX1 = leftEyeX;
mouthY1 = appHeight*3/4;
mouthX2 = rightEyeX;
mouthY2 = mouthY1;
mouthOpen = smallerDisplayDimension*1/4;
xNose1 = faceX;
yNose1 = leftEyeY;
xNose2 = faceX - leftEyeY*1/2;
yNose2 = faceY;
xNose3 = faceX + leftEyeY*1/2;
yNose3 = faceY ;
//
//Face: Circle = Inscribing a Circle in a Square
//Center a circle on display orientation
//rect(rectFaceX, rectFaceY, rectFaceWidth, rectFaceHeight);
fill(#FFF5F0);
ellipse(faceX, faceY, faceDiameter, faceDiameter);
//

} //End setup
//
void draw() 
{
  //background(200);
 // background(#000000);
  PVector mouseVector = new PVector(mouseX, mouseY);

  PVector leftPupil = leftEye.copy().add(mouseVector.copy().sub(leftEye).setMag(20)) ;
  PVector rightPupil = rightEye.copy().add(mouseVector.copy().sub(rightEye).setMag(20));
 //

 smooth();
noStroke();
fill(#D80B0B);
beginShape();
vertex(50, 15);
bezierVertex(50, -5, 10, 5, 50, 40);
vertex(50, 15);
bezierVertex(50, -5, 10, 5, 50, 40);
endShape();

//
//Measle
float measleDiameter = random(smallerDisplayDimension*1/100 , smallerDisplayDimension*1/25); //Range of measle size: small=*1/100, large=4xbigger (*1/25)
float measleRadius = measleDiameter*1/2;
println (measleRadius);
float measleX = random( rectFaceX+measleRadius, ( ( rectFaceX+rectFaceWidth) - measleRadius) );
float measleY = random( rectFaceY+measleRadius, ( ( rectFaceY+rectFaceHeight) - measleRadius) );
Boolean nightMode=false; //Note: IF-ELSE similar to ternary operator
//color red=#FF0000, measleColour=red, whiteReset=#000000;
color measleColour = ( nightMode==false ) ? color ( 255, random(0,50), random(120) ) : color ( 255, random(0,50), 0 ) ; //ternary operator for day:night
color whiteReset=#FFFFFF; // Note: need ranger here too
//
float measleRectX = measleX-measleDiameter*1/2;
float measleRectY = measleY-measleDiameter*1/2;
float measleWidth = measleDiameter;
float measleHeight = measleDiameter;
//rect( measleRectX, measleRectY, measleWidth, measleHeight);
//random values given other variables (similar to button code)
noStroke(); //Shape outline
fill(measleColour);
ellipse( measleX, measleY, measleDiameter, measleDiameter );
stroke(reset);
fill(whiteReset); //reset to first colour (i.e blackReset
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
  ellipse(leftPupil.x, leftPupil.y, 200, 200);
  ellipse(rightPupil.x+150, rightPupil.y+10, 200, 200);
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
} //End draw
//
void keyPressed() {} //End keypressed
//
void mousePressed() {} //End mousePressed
//
//End Main Program



*/
