void drawStartScreen() {
  cp5 = new ControlP5(this);
  cp5.addButton("student").setPosition(300, 250).setFont(createFont("arial", 15)).setSize(300, 300);
  cp5.addButton("teacher").setPosition(700, 250).setFont(createFont("arial", 15)).setSize(300, 300);
}

void drawTeacherLoginScreen() {
  cp5.remove("teacher");
  cp5.remove("student");

  cp5.addTextfield("username").setPosition(300, 225).setSize(200, 40).setFont(createFont("arial", 20)).setAutoClear(false).setColorCaptionLabel(color(0));
  cp5.addTextfield("password").setPosition(300, 325).setSize(200, 40).setFont(createFont("arial", 20)).setAutoClear(false).setPasswordMode(true).setColorCaptionLabel(color(0)); 
  cp5.addButton("login").setPosition(300, 425).setFont(createFont("arial", 15)).setSize(200, 50);

  cp5.addTextfield("create username").setPosition(800, 225).setSize(200, 40).setFont(createFont("arial", 20)).setAutoClear(true).setColorCaptionLabel(color(0));
  cp5.addTextfield("create password").setPosition(800, 325).setSize(200, 40).setFont(createFont("arial", 20)).setAutoClear(true).setPasswordMode(true).setColorCaptionLabel(color(0));
  cp5.addButton("create user").setPosition(800, 425).setFont(createFont("arial", 15)).setSize(200, 50);
}

void drawStudentLoginScreen() {
  cp5.remove("teacher");
  cp5.remove("student");

  cp5.addTextfield("student name").setPosition(550, 300).setSize(200, 40).setFont(createFont("arial", 20)).setAutoClear(false).setColorCaptionLabel(color(0));
  cp5.addTextfield("team name").setPosition(550, 400).setSize(200, 40).setFont(createFont("arial", 20)).setAutoClear(false).setColorCaptionLabel(color(0));
  cp5.addButton("play game").setPosition(550, 500).setFont(createFont("arial", 15)).setSize(200, 40);
}

void createTeamScreen() {
  cp5.remove("username");
  cp5.remove("password");
  cp5.remove("create username");
  cp5.remove("create password");
  cp5.remove("login");
  cp5.remove("create user");

  cp5.addTextfield("create team").setPosition(300, 380).setSize(200, 40).setFont(createFont("arial", 20)).setAutoClear(true).setColorCaptionLabel(color(0));
  cp5.addTextfield("login to team").setPosition(800, 380).setSize(200, 40).setFont(createFont("arial", 20)).setAutoClear(false).setColorCaptionLabel(color(0));
}

void teacherMenu() {
  cp5.remove("create team");
  cp5.remove("login to team");

  cp5.addTextfield("add student").setPosition(100, 100).setSize(200, 40).setFont(createFont("arial", 20)).setAutoClear(true).setColorCaptionLabel(color(0));
  cp5.addTextfield("add question").setPosition(700, 200).setSize(500, 40).setFont(createFont("arial", 20)).setAutoClear(true).setColorCaptionLabel(color(0));
  cp5.addTextfield("correct answer").setPosition(700, 300).setSize(200, 40).setFont(createFont("arial", 20)).setAutoClear(true).setColorCaptionLabel(color(0));
  cp5.addTextfield("wrong answer 1").setPosition(700, 400).setSize(200, 40).setFont(createFont("arial", 20)).setAutoClear(true).setColorCaptionLabel(color(0));
  cp5.addTextfield("wrong answer 2").setPosition(700, 500).setSize(200, 40).setFont(createFont("arial", 20)).setAutoClear(true).setColorCaptionLabel(color(0));
  cp5.addButton("submit question").setPosition(700, 600).setFont(createFont("arial", 15)).setSize(200, 50);
  cp5.addButton("result screen").setPosition(1040, 30).setFont(createFont("arial", 15)).setSize(200, 50);

  
}
