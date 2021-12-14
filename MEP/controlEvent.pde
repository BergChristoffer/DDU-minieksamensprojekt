void controlEvent(ControlEvent theEvent) {
  if (theEvent.isAssignableFrom(Textfield.class)) {

    if (theEvent.getName() == "password") {  
      teacherLoginUsername= cp5.get(Textfield.class, "username").getText();
      teacherLoginPassword = theEvent.getStringValue();
      loginTeacher();
    }
    if (theEvent.getName() == "create password") {
      teacherCreateUsername = cp5.get(Textfield.class, "create username").getText();
      teacherCreatePassword = theEvent.getStringValue();
      createTeacher();
    }

    if (theEvent.getName() == "type student name") {
      studentName = theEvent.getStringValue();
      createStudent();
    }
    if (theEvent.getName() == "create team") {
      createTeam = theEvent.getStringValue();
      createTeam();
    }
    if (theEvent.getName() == "login to team") {
      loginTeam = theEvent.getStringValue();
      loginTeam();
    } 

    if (theEvent.getName() == "add student") {
      studentName = theEvent.getStringValue();
      createStudent();
      getStudentName();
    }
  }

  if (theEvent.getName() == "teacher") {
    drawTeacherLoginScreen();
  }

  if (theEvent.getName() == "student") {
    drawStudentLoginScreen();
  }

  if (theEvent.getName() == "create user") {
    teacherCreateUsername = cp5.get(Textfield.class, "create username").getText();
    teacherCreatePassword = cp5.get(Textfield.class, "create password").getText();
    createTeacher();
  }
  if (theEvent.getName() == "login") {
    teacherLoginUsername = cp5.get(Textfield.class, "username").getText();
    teacherLoginPassword = cp5.get(Textfield.class, "password").getText();
    loginTeacher();
  }
  if (theEvent.getName() == "submit question") {
    createQuestion = cp5.get(Textfield.class, "add question").getText();
    correctAnswer =  cp5.get(Textfield.class, "correct answer").getText();
    wrongAnswer1 =  cp5.get(Textfield.class, "wrong answer 1").getText();
    wrongAnswer2 =  cp5.get(Textfield.class, "wrong answer 2").getText();
    createQuestion();
    createAnswer();
  }
  
   if (theEvent.getName() == "play game") {
    studentLogin = cp5.get(Textfield.class, "student name").getText();
    studentTeamName = cp5.get(Textfield.class, "team name").getText();
    loginStudent();
  }
  
}
