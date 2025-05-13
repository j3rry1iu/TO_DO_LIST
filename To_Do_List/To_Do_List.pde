import g4p_controls.*;
void setup(){
  PrintWriter writer = createWriter("data/tasks.txt");
 
  writer.println("Jerry is cool");
 
  writer.close();
  size(400, 400);
  textAlign(CENTER, CENTER);
  textSize(32);
  createGUI();
}
