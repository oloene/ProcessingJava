/* "sun", more like a circle with color */
class Sun{
  private float sunPos;
  private int sunCol;
  
  public Sun(float xpos, int sunCol){
    this.sunPos = xpos;
    this.sunCol = sunCol;
  }
  
  public void paintSun(String place, String placeTemp){
    ellipse(width/2, this.sunPos, 20, 20);
    text(place + " temperature is: " + placeTemp, width/2+20, this.sunPos+7);
    fill(this.sunCol);
  }
  

}