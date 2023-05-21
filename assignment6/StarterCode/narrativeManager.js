// this object is to keep track of narrative beats and unlocks

// each "beat" has a test function, a function which unlocks elements, and a report function

const narrativeManager = class {
  constructor(parentObject) {
  this.data = parentObject;
    console.log(parentObject, this.data)
    
  this.beats = [
  {
    triggered: false,
    test: function(data){return data.lemons >= 10}, 
    unlock:function(){io.showElement("resource2Row")}, 
    report: function(){
      io.appendIntoElement("You have enough lemons to start selling lemonade", "reports");
      io.writeIntoElement ("Lemonade Hustler", "era");
      }
  },
  {
    triggered: false,
    test: function(data){return data.money >= 10}, 
    unlock:function(){io.showElement("resource3Row")}, 
    report: function(){
      io.appendIntoElement("You have enough money to start hiring workers", "reports");
      }
  },
  {
    triggered: false,
    test: function(data){return data.lemonade >= 10}, 
    unlock:function(){
      io.showElement("showCool");
      io.showElement("cooler");
      game.deliveryMinigame = setInterval(runDeliveryMinigame, 100)
    },

    report: function(){io.appendIntoElement("You should deliver lemonade to some customers...", "reports");}
  },
  ]
  }
  
  setup(){
    io.hideElement("resource2Row")
    io.hideElement("showCool")
    io.hideElement("showPanel3")
    io.hideElement("resource3Row")
  }


// goes through all narrative events, checks if they activate, runs activation code, and runs code that delivers a message about the story event
  assess(){
    for (let b = 0; b < this.beats.length; b++){
      let beat = this.beats[b]
      if (!beat.triggered){
        if (beat.test(this.data)){
          beat.triggered = true;
          beat.unlock();
          beat.report();
        }
      }
    }
  }

}