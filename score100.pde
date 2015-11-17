//score 100 words finder by mileu (2015.11.17)

BufferedReader ENreader;
PrintWriter ENwriter;
int readableCache=1;
String line;
void setup() {
  size(100, 100);
  background(0);
  ENreader = createReader("words.txt");
  ENwriter = createWriter("100.txt");
}

void draw() {
  readText();
  ENwriter.flush();
  ENwriter.close();
  exit();
}

void readText() {
  int i=0;
  int check=0;
  char cache='a';
  while (readableCache==1) {
    try {
      line = ENreader.readLine();
    } 
    catch (IOException e) {
      e.printStackTrace();
      line = null;
    }
    if (line == null) readableCache=0;
    else {
      for (i=0; i<line.length(); i++) {
        cache = line.charAt(i);
        check += (int)cache-96;
      }
      if (check==100) ENwriter.println(line);
      else check = 0;
    }
  }
}