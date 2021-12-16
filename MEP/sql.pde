String teacherLoginUsername, teacherLoginPassword, teacherCreateUsername, teacherCreatePassword, studentName, createTeam, loginTeam, createQuestion, correctAnswer, wrongAnswer1, wrongAnswer2, s, q, l, studentLogin, studentTeamName = ""; //<>//
String sql;
int questionIndex = 0;
String question, answer;
int amountOfCorrectAnswers;

ArrayList<String> names = new ArrayList<String>();
ArrayList<String> results = new ArrayList<String>();
ArrayList<String> scores = new ArrayList<String>();

ArrayList<Question> questions = new ArrayList<Question>();
ArrayList<String> correctAnswers = new ArrayList<String>();
ArrayList<String> wrongAnswers = new ArrayList<String>();
Boolean rightAnswer = false;
Boolean wrongAnswer = false;
Boolean studentText = false;
Boolean noMoreQuestions = false;
Boolean resultText = false;

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


        sql = "INSERT INTO Student (Name, ID_Team, Score, NumberOfCorrectAnswers) VALUES ('" + studentName + "', '" + db.getInt("ID_Team") + "', '"+ 0 +"', '"+ 0 +"');";

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
        getQuestions();
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

void scoreUpdater() {
  db = new SQLite( MEP.this, "MEP_database.sqlite" );
  // Connect to database
  if ( db.connect() )
  {
    try {

      db.query( "SELECT ID_Team FROM Team WHERE TeamName = '" + studentTeamName + "'" );
      db.query( "SELECT ID_Student FROM Student WHERE ID_Team = " + db.getInt("ID_Team") + " AND Name = '" + studentLogin + "'" );

      sql = "UPDATE Student SET Score = " + score + " WHERE ID_Student = " + db.getInt("ID_Student");

      db.execute(sql);

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

      int ID_Team = db.getInt("ID_Team");

      db.query( "SELECT Question FROM Question WHERE ID_Team = '" + ID_Team + "'" );

      questions.clear();
      while (db.next()) {
        Question question = new Question();
        question.question = db.getString("Question");
        questions.add(question);
      }

      db.query( "SELECT ID_Question FROM Question WHERE ID_Team = '" + ID_Team + "'" );

      correctAnswers.clear();

      ArrayList<Integer> ID_questions = new ArrayList<Integer>();

      while (db.next()) {
        Integer ID_Question = db.getInt("ID_Question");
        ID_questions.add(ID_Question);
      }


      for (int i = 0; i < ID_questions.size(); i++) {
        db.query( "SELECT Answer FROM CorrectAnswer WHERE ID_Question = '" + ID_questions.get(i) + "'" );
        questions.get(i).correctAnswer = db.getString("Answer");
      }

      for (int i = 0; i < ID_questions.size(); i++) {
        db.query( "SELECT WrongAnswer FROM WrongAnswer WHERE ID_Question = '" + ID_questions.get(i) + "'" );
        db.next();
        questions.get(i).wrongAnswer1 = db.getString("WrongAnswer");
        db.next();
        questions.get(i).wrongAnswer2 = db.getString("WrongAnswer");
      }
      db.close();
    }
    catch (Exception e) {
      System.out.println("Exception: "+e);
    }
  }
}

void drawQuiz() {
  if (questionText != null)
    questionText.remove();

  if (answer1 != null)
    answer1.remove();

  if (answer2 != null)
    answer2.remove();

  if (answer3 != null)
    answer3.remove();

  Question question = questions.get(questionIndex);

  ArrayList<String> answers = new ArrayList<String>();
  answers.add(question.correctAnswer);
  answers.add(question.wrongAnswer1);
  answers.add(question.wrongAnswer2);

  int random1 = (int)random(0, answers.size());
  String answer1Text = answers.get(random1);
  answers.remove(random1);
  int random2 = (int)random(0, answers.size());
  String answer2Text = answers.get(random2);
  answers.remove(random2);
  String answer3Text = answers.get(0);

  cp5 = new ControlP5(this);

  questionText = cp5.addTextarea("txt1")
    .setPosition(350, 100)
    .setSize(600, 50)
    .setFont(createFont("arial", 30))
    .setLineHeight(14)
    .setColor(color(0))
    .setColorBackground(color(255))
    .setBorderColor(0);
  questionText.setText(question.question);


  answer1 = cp5.addTextarea("txt2")
    .setPosition(350, 150)
    .setSize(600, 50)
    .setFont(createFont("arial", 20))
    .setLineHeight(14)
    .setColor(color(0))
    .setColorBackground(color(255))
    .setBorderColor(0);
  answer1.setText(answer1Text);

  answer2 = cp5.addTextarea("txt3")
    .setPosition(350, 200)
    .setSize(600, 50)
    .setFont(createFont("arial", 20))
    .setLineHeight(14)
    .setColor(color(0))
    .setColorBackground(color(255))
    .setBorderColor(0);
  answer2.setText(answer2Text);

  answer3 = cp5.addTextarea("txt4")
    .setPosition(350, 250)
    .setSize(600, 50)
    .setFont(createFont("arial", 20))
    .setLineHeight(14)
    .setColor(color(0))
    .setColorBackground(color(255))
    .setBorderColor(0);
  answer3.setText(answer3Text);

  cp5.addButton("answer 1").setPosition(950, 150).setFont(createFont("arial", 15)).setSize(100, 40);
  cp5.addButton("answer 2").setPosition(950, 200).setFont(createFont("arial", 15)).setSize(100, 40);
  cp5.addButton("answer 3").setPosition(950, 250).setFont(createFont("arial", 15)).setSize(100, 40);
  questionIndex++;
}

void checkAnswer() {
  db = new SQLite( this, "MEP_database.sqlite" );
  // Connect to database
  if ( db.connect() )
  {
    try {
      db.query( "SELECT ID_Team FROM Team WHERE TeamName = '" + studentTeamName + "'" );
      db.query( "SELECT ID_Question FROM Question WHERE ID_Team = " + db.getInt("ID_Team") + " AND Question = '" + question + "'" ); 
      db.query( "SELECT Answer FROM CorrectAnswer WHERE ID_Question = '" + db.getInt("ID_Question") + "'" );

      if (answer.equals(db.getString("Answer"))) {
        rightAnswer = true;
        cp5.hide();
      } else {
        cp5.hide();
        wrongAnswer = true;
      }
      db.close();

      if (questionIndex == questions.size()) {
        noMoreQuestions = true;
        return;

        //gameOver = true;
        //return;
      }
    }
    catch (Exception e) {
      System.out.println("Exception: "+e);
    }
  }
}

void insertAmountOfCorrectAnswers() {
  db = new SQLite( this, "MEP_database.sqlite" );
  // Connect to database
  if ( db.connect() )
  {
    try {
      db.query( "SELECT ID_Team FROM Team WHERE TeamName = '" + studentTeamName + "'" );
      db.query( "SELECT ID_Student FROM Student WHERE ID_Team = " + db.getInt("ID_Team") + " AND Name = '" + studentLogin + "'" );

      sql = "UPDATE Student SET NumberOfCorrectAnswers = " + amountOfCorrectAnswers + " WHERE ID_Student = " + db.getInt("ID_Student");

      db.execute(sql);

      db.close();
    }

    catch (Exception e) {
      System.out.println("Exception: "+e);
    }
  }
}

void getResults() {
  db = new SQLite( this, "MEP_database.sqlite" );
  // Connect to database
  if ( db.connect() )
  {
    try {
      db.query( "SELECT ID_Team FROM Team WHERE TeamName = '" + loginTeam + "'" );

      int ID_Team = db.getInt("ID_Team");

      db.query( "SELECT NumberOfCorrectAnswers FROM Student WHERE ID_Team = '" + ID_Team + "'" );


      results.clear();

      while (db.next()) {
        String result = db.getString("NumberOfCorrectAnswers");
        results.add(result);
      }

      db.query( "SELECT Score FROM Student WHERE ID_Team = '" + ID_Team + "'" );
      scores.clear();

      while (db.next()) {
        String score = db.getString("Score");
        scores.add(score);
      }

      db.query( "SELECT Name FROM Student WHERE ID_Team = '" + ID_Team + "'" );
      names.clear();

      while (db.next()) {
        String name = db.getString("Name");
        names.add(name);
      }
      resultText = true;
      db.close();
    }
    catch (Exception e) {
      System.out.println("Exception: "+e);
    }
  }
}

void showResultText() {
  fill(255);
  rect(100, 60, 1100, 675);
  fill(0);
  line(475, 60, 475, 750);
  line(975, 60, 975, 750);

  textSize(30);
  text("Name", 125, 125);
  text("Number of correct answers", 500, 125);
  text("score", 1000, 125);

  textSize(20);
  int y1 = 150;
  for (String line : results) {
    text(line + " / " + results.size(), 500, y1);
    y1 += 30;
  }

  int y2 = 150;
  for (String line : names) {
    text(line, 125, y2);
    y2 += 30;
  }

  int y3 = 150;
  for (String line : scores) {
    text(line, 1000, y3);
    y3 += 30;
    
  }
  fill(255);
}
