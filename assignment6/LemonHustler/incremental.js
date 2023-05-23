const GameInstance = class {
  constructor() {
    this.narrativeManager = new narrativeManager(this)
    
    this.stages = ["stage1", "winner", "gameOver"];
    this.currentStage = "stage1"; 
    this.panels = {
      "stage1": ["lemon", "cool", "panel3"],
      "winner": [],
      "gameOver": []
    }
    this.currentPanel = "lemon";


    this.money = 0;
    this.lemons = 0;
    this.lemonade = 0;
    this.worker = 0;

    this.lemonadePrice = 3;
    this.reputation = 10;

    this.commentClock = 0;

    this.stop = true;

    this.deliveries = 0;

    this.goodAdjs = ["amazing", "great", "good", "tasty", "super", "outstanding", "wonderful", "refreshing", "cool", "swag"]
    this.badAdjs = ["alright", "gloomy", "overpriced", "mid", "bland", "nasty", "disgusting", "bad", "questionable", "expensive"]


    
  }
  
  

  
  // the following functions are to be called from buttons in the index.html
  pickLemons(){
     this.lemons +=1;
     this.updateDisplay();
  }
  sellLemonade(){
    if(this.lemons >= 5){
      this.lemonade +=1;
      this.lemons -=5;
      this.money += this.lemonadePrice;
      this.reputaion += 1;
      this.updateDisplay();
    }
  }
  hireWorker(){
    if(this.money >= 10){
      this.worker += 1;
      this.money -= 10;
      this.updateDisplay();
    }
  }
  increasePrice(){
    this.lemonadePrice += 1;
    this.reputation -= 4;
    this.updateDisplay();
  
  }
  decreasePrice(){
    if(this.lemonadePrice >= 1){
      this.lemonadePrice -= 1;
      this.reputation += 2
      this.updateDisplay();
    }
  }
  
  deliveryComplete(){
    this.deliveries += 1;
    this.reputation += 3;
    this.updateDisplay();
  }
  working(){
    if(this.worker > 0){
      this.lemonade += this.worker;
      this.lemons += this.worker * 5;
      this.money += this.worker * 3;
      this.reputation += 1;
    }
  }
  
  payWorkers(){
    this.money -= this.workers * 17;
    this.updateDisplay();
  }

  generateGoodAdj = function(){
    return this.goodAdjs[Math.floor(Math.random() * this.goodAdjs.length)]
  }
  generateBadAdj = function(){
    return this.badAdjs[Math.floor(Math.random() * this.badAdjs.length)]
  }

  randomComment(){
    if(this.reputation >= 10 && this.lemonadePrice < 10){
      let adj = this.generateGoodAdj()
      io.appendIntoElement("New Comment: This Lemonade Stand is so " + adj + "!", "reports");
    }
    else{
      let adj = this.generateBadAdj()
      io.appendIntoElement("New Comment: This Lemonade Stand is so " + adj + "!", "reports");
      io.appendIntoElement("The Bad Comments are tarnishing your stand's reputation and causing your workers to quit!", "reports")
      this.reputation -= 10;
      if(this.worker >= 5){
        this.worker -= 5;
      }

    }
  }
  // this function takes in a panel 
  swichPanels(panel) {
    game.currentPanel = panel;
    io.showPanel(game);    
  }
  
  updateDisplay(){
    io.writeValueIntoClass(this.money, "moneyValue")
    io.writeValueIntoClass(this.lemons, "lemons")
    io.writeValueIntoClass(this.lemonade, "lemonade")
    io.writeValueIntoClass(this.worker, "worker")
    io.writeValueIntoClass(this.lemonadePrice, "price")
    io.writeValueIntoClass(this.reputation, "rep")
    io.writeValueIntoClass(this.deliveries, "deliveries")
  }
  
};


// this function forom JQuery waits until the web page is fully loaded before triggering the start of the game
$( document ).ready(function() {
  game = new GameInstance();
  game.narrativeManager.setup();
  
  io.showStage(game); 
  game.updateDisplay()

  startRecording(game);

  // Run the Loop
  gameTimer = setInterval(function(){
    game.working();
    game.commentClock += 1;

    if(game.reputation <= 0 && this.stop){
      this.stop = false;
      game.currentStage = "gameOver";
      io.showStage(game);
    }
    if(game.money >= 100000){
      game.currentStage = "winner";
      io.showStage(game);
    }
    if(game.lemonade > 100 && game.commentClock % 8 == 1){
      game.randomComment();
    }

    if(game.workers > 0 && game.commentClock % 6 == 1){
      game.payWorkers();
    }

    game.narrativeManager.assess()
    game.updateDisplay()
}, 500)
  

})
