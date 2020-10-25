#!/usr/bin/osascript -l JavaScript
const readline = require('readline');
const fs = require('fs');
const applescript = require('applescript');
//////////////////////////
// COMMAND LINE ARGUMENTS:
//////////////////////////
const args = process.argv.slice(2);
console.log('myArgs: ', args);
run(args);
//////////////////////////
//////////////////////////
//////////////////////////

//////////////////////////
// RUN:
//////////////////////////
function run(command_line_parameters){
  readPIDs((line) => {
    console.log("pID:", typeof line, line);
    applescript.execString(`tell application ${line}`)
  });
}
//////////////////////////
//////////////////////////
//////////////////////////

//////////////////////////
// READ pIDs:
//////////////////////////
function readPIDs(eachLine){
  const readInterface = readline.createInterface({
    input: fs.createReadStream('./pIDs.txt'),
    console: false
  });
  readInterface.on('line', function(line) {
    eachLine(line);
  });
}
//////////////////////////
//////////////////////////
//////////////////////////