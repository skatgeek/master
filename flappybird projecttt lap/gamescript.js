"use strict"

function start(){
    
    document.getElementById("canvas").style.borderColor = "green";
    document.getElementById("canvas").style.borderStyle = "solid";
    document.getElementById("canvas").style.borderWidth = "5px";
    document.getElementById("canvas").style.borderRadius = "15px";


let cvs = document.getElementById("canvas");
let ctx = cvs.getContext("2d");

// load images

let bird = new Image();
let bg = new Image();
let fg = new Image();
let pipeNorth = new Image();
let pipeSouth = new Image();

bird.src = "images/bird.png";
bg.src = "images/bg.png";
fg.src = "images/fg.png";
pipeNorth.src = "images/pipeNorth.png";
pipeSouth.src = "images/pipeSouth.png";




let gap = 100;
let constant;


let bX = 10;
let bY = 150;

let gravity = 1;

let score = 0;



let fly = new Audio();
let scor = new Audio();

fly.src = "sounds/fly.mp3";
scor.src = "sounds/score.mp3";


// on key down

document.addEventListener("keydown",moveUp);

function moveUp(){
    bY -= 25;
    fly.play();
}

// pipe coordinates

let pipe = [];

pipe[0] = {
    x : cvs.width,
    y : 0
};

// draw images



function draw(){
    
    ctx.drawImage(bg,0,0);
    
    
    for(let i = 0; i < pipe.length; i++){
        
        constant = pipeNorth.height+gap;
        ctx.drawImage(pipeNorth,pipe[i].x,pipe[i].y);
        ctx.drawImage(pipeSouth,pipe[i].x,pipe[i].y+constant);
             
        pipe[i].x--;
        
        if( pipe[i].x == 125 ){
            pipe.push({
                x : cvs.width,
                y : Math.floor(Math.random()*pipeNorth.height)-pipeNorth.height
            }); 
        }

        // detect collision
        
        if( bX + bird.width >= pipe[i].x && bX <= pipe[i].x + pipeNorth.width && (bY <= pipe[i].y + pipeNorth.height || bY+bird.height >= pipe[i].y+constant) || bY + bird.height >=  cvs.height - fg.height){
            alert("gameover для продолжения нажмите ОК");
            location.reload(); 
        }
        
        
        if(pipe[i].x == 5){
            score++;
            scor.play();
        }
        
        
    }

    
    ctx.drawImage(fg,0,cvs.height - fg.height);
    
    ctx.drawImage(bird,bX,bY);
    
    bY += gravity;
    

    //draw score
    ctx.fillStyle = "#000";
    ctx.font = "20px Verdana";
    ctx.fillText("Score : "+score,10,cvs.height-20);
    
    requestAnimationFrame(draw);


}

draw()};




























