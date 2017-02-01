import java.util.Calendar;
import java.text.SimpleDateFormat;
import java.util.Date;

PImage map;
PVector sPos;
PVector vPos;
PVector oPos;
float[] sCords;
float[] oCords;

boolean bool = true;
City sthlm, oslo;
APIfactory tempFactory, tempFactory1;
int stCol = color(255, 0, 0);
int oCol = color(0, 255, 0);

String date; 
String sthlmURL, osloURL;
String sTemp, oTemp;
float stY = -20.0;
float oY = -20.0;

Sun sthlmSun = new Sun(stY, stCol);
Sun oSun = new Sun(oY, oCol);

void setup() {
  size(800, 600);
  map = loadImage("pictures\\map.png");
  
  Date today = new Date();
  SimpleDateFormat today_format = new SimpleDateFormat("yyyy-MM-dd'T'HH:00:00'Z'");
 
  /* used for current time nordic*/
  String date = today_format.format(today);
 
  /* OSLO */
  oslo = new City(59.913869, 10.752245, 396, 243);
  osloURL = oslo.getUrl();
  
  /* STOCKHOLM */
  sthlm = new City(59.3293235, 18.0685808, 410, 245);
  sthlmURL = sthlm.getUrl();
  
  sthlm.mapCity(color(255,0,0));
  oslo.mapCity(color(0,255,0));
  sthlmSun.paintSun("Stockholm", sTemp);
  oSun.paintSun("Oslo", oTemp);
  
  /* JAVA FACTORIES, USED TO PARSE XML INFORMATION */
  APIfactory tempFactory = new APIfactory();
  APIfactory tempFactory2 = new APIfactory();
  
  /* GET TEMPERATURE FOR EACH CITY */
  oTemp = tempFactory2.getTemp(osloURL,date);
  sTemp = tempFactory.getTemp(sthlmURL,date);
  //System.out.println("STOCKHOLM URL: " + sthlmURL + '\n' + "DATE: " + date);
}   

void mouseClicked() {
  if (sthlm.isInside(sPos)) {
    sthlm.isClicked = true;
    oslo.isClicked = false;
    //System.out.print("\nStockholm temperature is: " + sTemp);
  } 
  if (oslo.isInside(oPos)) {
    sthlm.isClicked = false;
    oslo.isClicked = true;
    //System.out.print("\nOslo temperature is: " + oTemp);
  }
}


void draw() {
  background(255);
  image(map, 0, 0, width, height);
 
  /* PUT CITITES AS DOTS ON MAP */
  ellipse(sthlm.location.x, sthlm.location.y, 8, 8);
  ellipse(oslo.location.x, oslo.location.y, 8, 8);
  
  /* NEED FUNCTION FOR THIS. */
  if(sthlm.isClicked){
    sthlmSun.paintSun("Stockholm", sTemp);
    sthlm.mapCity(color(255,0,0));
    if(sthlmSun.sunPos < 40){ 
      sthlmSun.paintSun("Stockholm", sTemp);
      oSun.sunPos = -20.0;
      sthlmSun.sunPos += 1.0;
    } 
  } 
  if(oslo.isClicked){
    oSun.paintSun("Oslo", oTemp);
    oslo.mapCity(color(0,255,0));
    if(oSun.sunPos < 40){ 
      oSun.paintSun("Oslo", oTemp);
      sthlmSun.sunPos = -20.0;
      oSun.sunPos += 1.0;
    } 
  }
}