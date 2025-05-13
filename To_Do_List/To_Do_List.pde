void setup(){
  PrintWriter writer = createWriter("data/tasks.txt");
  
  writer.println("Jerry is cool");
 
  writer.close();
  exit();
}
