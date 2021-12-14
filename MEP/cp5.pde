void drawStartScreen() {
  cp5 = new ControlP5(this);
  cp5.addButton("student").setPosition(200, 300).setFont(createFont("arial", 15)).setSize(300, 300);
  cp5.addButton("teacher").setPosition(700, 300).setFont(createFont("arial", 15)).setSize(300, 300);
}

void drawTeacherLoginScreen() {
  cp5.remove("teacher");
  cp5.remove("student");

  cp5.addTextfield("username").setPosition(100, 100).setSize(200, 40).setFont(createFont("arial", 20)).setAutoClear(false).setColorCaptionLabel(color(0));
  cp5.addTextfield("password").setPosition(100, 200).setSize(200, 40).setFont(createFont("arial", 20)).setAutoClear(false).setPasswordMode(true).setColorCaptionLabel(color(0)); 
  cp5.addButton("login").setPosition(100, 300).setFont(createFont("arial", 15)).setSize(200, 50);

  cp5.addTextfield("create username").setPosition(500, 100).setSize(200, 40).setFont(createFont("arial", 20)).setAutoClear(true).setColorCaptionLabel(color(0));
  cp5.addTextfield("create password").setPosition(500, 200).setSize(200, 40).setFont(createFont("arial", 20)).setAutoClear(true).setPasswordMode(true).setColorCaptionLabel(color(0));
  cp5.addButton("create user").setPosition(500, 300).setFont(createFont("arial", 15)).setSize(200, 50);
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

  cp5.addTextfield("create team").setPosition(100, 100).setSize(200, 40).setFont(createFont("arial", 20)).setAutoClear(true).setColorCaptionLabel(color(0));
  cp5.addTextfield("login to team").setPosition(500, 100).setSize(200, 40).setFont(createFont("arial", 20)).setAutoClear(false).setColorCaptionLabel(color(0));
}

void teacherMenu() {
  cp5.remove("create team");
  cp5.remove("login to team");

  cp5.addTextfield("add student").setPosition(100, 100).setSize(200, 40).setFont(createFont("arial", 20)).setAutoClear(true).setColorCaptionLabel(color(0));
  cp5.addTextfield("add question").setPosition(500, 200).setSize(500, 40).setFont(createFont("arial", 20)).setAutoClear(true).setColorCaptionLabel(color(0));
  cp5.addTextfield("correct answer").setPosition(600, 300).setSize(200, 40).setFont(createFont("arial", 20)).setAutoClear(true).setColorCaptionLabel(color(0));
  cp5.addTextfield("wrong answer 1").setPosition(600, 400).setSize(200, 40).setFont(createFont("arial", 20)).setAutoClear(true).setColorCaptionLabel(color(0));
  cp5.addTextfield("wrong answer 2").setPosition(600, 500).setSize(200, 40).setFont(createFont("arial", 20)).setAutoClear(true).setColorCaptionLabel(color(0));
  cp5.addButton("submit question").setPosition(600, 600).setFont(createFont("arial", 15)).setSize(200, 50);
}