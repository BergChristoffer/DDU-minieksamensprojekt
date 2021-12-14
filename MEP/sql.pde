String teacherLoginUsername, teacherLoginPassword, teacherCreateUsername, teacherCreatePassword, studentName, createTeam, loginTeam, createQuestion, correctAnswer, wrongAnswer1, wrongAnswer2, s, q, l, studentLogin, studentTeamName = ""; //<>//
String sql;
ArrayList<String> names = new ArrayList<String>();
ArrayList<String> questions = new ArrayList<String>();
Boolean studentText = false;
int numberOfStudents;


void createTeacher() {
  db = new SQLite( this, "MEP_database.sqlite" );
  // Connect to database
  if ( db.connect() )
  {
    try {

      if (teacherCreateUsername != "" && teacherCreatePassword != "") {

        // Password hashing
        MessageDigest md = MessageDigest.getInstance("SHA-512"); 
        md.update(teacherCreatePassword.getBytes());    
        byte[] byteList = md.digest();
        StringBuffer hashedValueBuffer = new StringBuffer();
        for (byte b : byteList)hashedValueBuffer.append(hex(b)); 

        // Insert username & hashed password into database
        sql = "INSERT INTO TeacherLogin (TeacherUsername,TeacherPassword) VALUES ('" + teacherCreateUsername + "', '" + hashedValueBuffer.toString() + "');";
        db.execute(sql);

        teacherCreateUsername = "";
        teacherCreatePassword = "";

        db.close();
      }
    }
    catch (Exception e) {
      System.out.println("Exception: "+e);
    }
  }
}

void loginTeacher() {
  db = new SQLite( this, "MEP_database.sqlite" );
  if ( db.connect() )
  { 
    try
    {
      if (teacherLoginUsername != "" && teacherLoginPassword != "") { 

        // Password hashing
        MessageDigest md = MessageDigest.getInstance("SHA-512"); 
        md.update(teacherLoginPassword.getBytes());    
        byte[] byteList = md.digest();
        StringBuffer hashedValueBuffer = new StringBuffer();
        for (byte b : byteList)hashedValueBuffer.append(hex(b)); 

        // Check if Username and Password matches database
        db.query( "SELECT TeacherUsername, TeacherPassword FROM TeacherLogin WHERE TeacherUsername = '" + teacherLoginUsername + "' AND TeacherPassword = '" + hashedValueBuffer.toString() +"'" );
        int count = 0;
        while (db.next()) {
          count++;
        }

        if (count==0) {
          //wrongLogin = true;
          //i=0;
          println("wrong login");
        } else 
        createTeamScreen();


        db.close();
      }
    }
    catch (Exception e) {
      System.out.println("Exception: "+e);
    }
  } else
  {
    println("Error DB");
  }
}


void createTeam() {
  db = new SQLite( this, "MEP_database.sqlite" );
  // Connect to database
  if ( db.connect() )
  {
    try {

      if (createTeam != "") {

        // Insert username & hashed password into database
        sql = "INSERT INTO Team (TeamName) VALUES ('" + createTeam + "');";
        db.execute(sql);

        createTeam = "";
        db.close();
      }
    }
    catch (Exception e) {
      System.out.println("Exception: "+e);
    }
  }
}

void loginTeam() {
  db = new SQLite( this, "MEP_database.sqlite" );
  if ( db.connect() )
  { 
    try
    {
      if (loginTeam != "") { 
        // Check if Username and Password matches database
        db.query( "SELECT TeamName FROM Team WHERE TeamName = '" + loginTeam + "'" );
        int count = 0;
        while (db.next()) {
          count++;
        }

        if (count==0) {

          println("wrong login");
        } else {
          teacherMenu();
          getStudentName();
        }

        db.close();
      }
    }
    catch (Exception e) {
      System.out.println("Exception: "+e);
    }
  } else
  {
    println("Error DB");
  }
}

void createStudent() {
  //y = 200;
  db = new SQLite( this, "MEP_database.sqlite" );
  // Connect to database
  if ( db.connect() )
  {
    try {

      if (studentName != "") {

        db.query( "SELECT ID_Team FROM Team WHERE TeamName = '" + loginTeam + "'" );


        sql = "INSERT INTO Student (Name, ID_Team) VALUES ('" + studentName + "', '" + db.getInt("ID_Team") + "');";

        println(db.getInt("ID_Team"));

        db.execute(sql);

        studentName = "";

        db.close();
      }
    }
    catch (Exception e) {
      System.out.println("Exception: "+e);
    }
  }
}

void createQuestion() {
  db = new SQLite( this, "MEP_database.sqlite" );
  // Connect to database
  if ( db.connect() )
  {
    try {

      if (createQuestion != "") {

        db.query( "SELECT ID_Team FROM Team WHERE TeamName = '" + loginTeam + "'" );
        sql = "INSERT INTO Question (Question, ID_Team) VALUES ('" + createQuestion + "', '" + db.getInt("ID_Team") + "');";
        db.execute(sql);

        db.close();
      }
    }
    catch (Exception e) {
      System.out.println("Exception: "+e);
    }
  }
}

void createAnswer() {
  db = new SQLite( this, "MEP_database.sqlite" );
  // Connect to database
  if ( db.connect() )
  {
    try {

      if (correctAnswer != "" && wrongAnswer1 != "" && wrongAnswer2 != "") {


        db.query( "SELECT ID_Question FROM Question WHERE Question = '" + createQuestion + "'" );


        s = "INSERT INTO CorrectAnswer (Answer, ID_Question) VALUES ('" + correctAnswer + "', '" + db.getInt("ID_Question") + "');";
        q = "INSERT INTO WrongAnswer (WrongAnswer, ID_Question) VALUES ('" + wrongAnswer1 + "', '" + db.getInt("ID_Question") + "');";
        l = "INSERT INTO WrongAnswer (WrongAnswer, ID_Question) VALUES ('" + wrongAnswer2 + "', '" + db.getInt("ID_Question") + "');";

        println(createQuestion);
        println(db.getInt("ID_Question"));

        db.execute(s);
        db.execute(q);
        db.execute(l);


        db.close();
      }
    }
    catch (Exception e) {
      System.out.println("Exception: "+e);
    }
  }
}

void getStudentName() {
  db = new SQLite( this, "MEP_database.sqlite" );
  // Connect to database
  if ( db.connect() )
  {
    try {
      db.query( "SELECT ID_Team FROM Team WHERE TeamName = '" + loginTeam + "'" );

      db.query( "SELECT Name FROM Student WHERE ID_Team = '" + db.getInt("ID_Team") + "'" );


      names.clear();

      while (db.next()) {
        String name = db.getString("Name");
        names.add(name);
        studentText = true;
      }

      if (names.size() == 20)
        cp5.remove("add student");

      db.close();
    }
    catch (Exception e) {
      System.out.println("Exception: "+e);
    }
  }
}

void showStudent() {
  int y = 200;
  textSize(20);
  fill(0);

  text( names.size() + "/20", 250, 164);
  for (String line : names) {
    text(line, 100, y);
    y += 30;
  }
}


void loginStudent() {
  db = new SQLite( this, "MEP_database.sqlite" );
  // Connect to database
  if ( db.connect() )
  {
    try {
      db.query( "SELECT ID_Team FROM Team WHERE TeamName = '" + studentTeamName + "'" );

      db.query( "SELECT Name, ID_Team FROM Student WHERE Name = '" + studentLogin + "' AND ID_Team = '" + db.getInt("ID_Team") +"'" );

      int count = 0;
      while (db.next()) {
        count++;
      }

      if (count==0) {
        //wrongLogin = true;
        //i=0;
        println("wrong login");
      } else {
        println("playing game");
        //Her starter spillet
        game = true;
        cp5.hide();
      }


      db.close();
    }
    catch (Exception e) {
      System.out.println("Exception: "+e);
    }
  }
}



void getQuestions() {
  db = new SQLite( this, "MEP_database.sqlite" );
  // Connect to database
  if ( db.connect() )
  {
    try {

      db.query( "SELECT ID_Team FROM Team WHERE TeamName = '" + studentTeamName + "'" );

      db.query( "SELECT Question FROM Question WHERE ID_Team = '" + db.getInt("ID_Team") + "'" );


      while (db.next()) {
        String question = db.getString("Question");
        questions.add(question);
      }





      //myTextarea = cp5.addTextarea("txt")
      //  .setPosition(100, 100)
      //  .setSize(200, 200)
      //  .setFont(createFont("arial", 12))
      //  .setLineHeight(14)

      //  .setColor(color(255))
      //  .setColorBackground(color(150))
      //  .setColorForeground(color(0));


      //myTextarea.setText(db.getString("Question"));





      db.close();
    }
    catch (Exception e) {
      System.out.println("Exception: "+e);
    }
  }
}
