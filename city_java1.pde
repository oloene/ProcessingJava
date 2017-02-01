/*
city object returns an array with city coordinates
*/
class City{
  private float[] coordinates = new float[2];
  private PVector location;
  private boolean isClicked = false;
  
  public City(float lat, float lon, int x, int y){
    this.coordinates[0] = lat;
    this.coordinates[1] = lon;
    this.location = new PVector(x, y);
  }

  boolean isInside(PVector location){
    if (mouseY < this.location.y + 4 && 
        mouseY > this.location.y - 4 && 
        mouseX < this.location.x + 4 &&
        mouseX > this.location.x - 4 ) {
          this.isClicked = true;
          return true;
        }
    return false;
  }

  void mapCity(int col) {
    fill(col);
    ellipse(this.location.x, this.location.y, 8, 8);
  }

  public PVector getLocation(){
    return this.location;
  }
    
  public float[] getCords(){
    return this.coordinates;
  }
  
  public String getUrl(){
    return "http://api.met.no/weatherapi/locationforecast/1.9/?lat="
    + coordinates[0] /*latitude*/
    + ";lon="
    + coordinates[1] /*longitude*/
    + ";msl="
    + 20 /*altitude 10 by default*/;
  }
}