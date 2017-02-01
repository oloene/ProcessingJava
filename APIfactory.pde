
import java.io.File;
import java.util.Vector;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

/*get information from yr.no API*/
class APIfactory{
  
  public String getTemp(String urlToGet, String time){
    
    String grader = "error";
    
    try{
    //factory for yr.no's API
    DocumentBuilderFactory dbFactory2 = DocumentBuilderFactory.newInstance();
    DocumentBuilder dBuilder2 = dbFactory2.newDocumentBuilder();
    Document doc2 = dBuilder2.parse(urlToGet);
     
    //nodes in the xml file
    NodeList wheatherNode = doc2.getElementsByTagName("temperature");
    NodeList timeNode = doc2.getElementsByTagName("time");
    
    int timeCounter = 0;
    int tempCounter = 0;
    
    while(timeCounter < timeNode.getLength()){
      
      Node timenod = timeNode.item(timeCounter);
      Node tempnod = wheatherNode.item(tempCounter);
      
      
        if (timenod.getNodeType() == Node.ELEMENT_NODE) {
        
          Element timeElem = (Element) timenod;  
          Element tempElem = (Element) tempnod;
          
          if(timeElem.getAttribute("from").equals(timeElem.getAttribute("to"))){
            
            if( time.equals(timeElem.getAttribute("from")) ){
              grader = tempElem.getAttribute("value");
              return grader + " degrees Celsius";
            }
            timeCounter++;
            tempCounter++;
          }
          
        timeCounter++;
        }
      
    }

    return "make sure the time is within an hour from now!";
    //catch exception
    } catch (Exception e){
      System.out.println("! wheather error ! " + e);
      return grader;
    }
  }
}