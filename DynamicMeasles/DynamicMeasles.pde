//Global Variables
int reset, smallerDisplayDimension, mouthOpen;
float rectFaceX, rectFaceY, rectFaceWidth, rectFaceHeight;
float faceX, faceY, faceDiameter;
float leftEyeX, leftEyeY, rightEyeX, rightEyeY, eyeDiameter;
float mouthX1, mouthY1, mouthX2, mouthY2;
float xNose1, yNose1, xNose2, yNose2, xNose3, yNose3;
//
void setup() 
{
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
ellipse(faceX, faceY, faceDiameter, faceDiameter);
//

} //End setup
//
void draw() 
{
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
//Nose
//rect(xNose2, yNose1, xNose3-xNose2, yNose3-yNose1);
triangle(xNose1, yNose1, xNose2, yNose2, xNose3, yNose3);
//
//Mouth
int mouthWidth = int (mouthX2 - mouthX1);
int mouthHeight = mouthOpen;
//rect(mouthX1-mouthOpen*1/2, mouthY1-mouthOpen*1/2, mouthWidth+mouthOpen, mouthHeight);
strokeWeight(mouthOpen); //testing: 100=400/4 mouthOpen=height*1/4
line(mouthX1, mouthY1, mouthX2, mouthY2);
strokeWeight(reset); //reset to 1 pixel
//
} //End draw
//
void keyPressed() {} //End keypressed
//
void mousePressed() {} //End mousePressed
//
//End Main Program
