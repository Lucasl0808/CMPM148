var c;
var co;

var y = 250;
var z = 250;

var startx = 100;
var starty = 100;

let player, lemony;

let caught = false;

function runDeliveryMinigame(){
    c = document.getElementById("cooler");
    co = c.getContext("2d");

    co.clearRect(0,0,c.width, c.height);

    co.fillStyle = "#00FF00";
    player = co.fillRect(z, y, 20,20);

    co.fillStyle = "#FFFF00"
    lemony = co.fillRect(startx, starty, 20,20);

    if(dist(z, y, startx, starty) < 20){
        caught = true;
        game.deliveryComplete();
        io.appendIntoElement("Delivery Completed!", "reports")
        reset();
    }

    document.onkeydown = move;
}


function spawnLemon(){
    startx = Math.random() * 500;
    starty = Math.random() * 500;
    lemony = co.fillRect(startx, starty, 20,20);
}

function clear(a){
    a.clearRect(0,0,c.width, c.height);
}

function reset(){
    clear(co);
    co.fillStyle ="#00FF00";
    player = co.fillRect(z, y, 20,20);
    co.fillStyle = "#FFFF00"
    lemony = co.fillRect(startx, starty, 20,20);
    if(caught){
        spawnLemon();
        caught =false;
    }
}

function move(e){
    if(e.keyCode == '38'){
        y -= 6;
        reset();
    }
    if(e.keyCode == '40'){
        y += 6;
        reset();
    }
    if(e.keyCode == '37'){
        z -= 6;
        reset();
    } 
    if(e.keyCode == "39"){
        z += 6;
        reset();
    }
}

function dist(ax, ay, bx, by){
    return Math.sqrt( Math.pow(ax - bx, 2) + Math.pow(ay - by, 2)) 
    
  }