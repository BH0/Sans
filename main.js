let fs = require("fs");
fs.readFile(process.env.jsonValuesFileLocation+"/values.json", "utf8", (err, values) => { 
  fs.readFile(JSON.parse(values).workingDir+JSON.parse(values).questionDashed+'.html', "utf8", (err, data) => {     
      if (err) throw err;
      const cheerio = require('cheerio'); 
      const $ = cheerio.load(data); 
      fs.writeFile(JSON.parse(values).workingDir+JSON.parse(values).questionDashed+'.txt', $("#answers .answer .post-text").text(), err => console.log(err)); // I don't thhink we are writing the file 
      fs.writeFile(JSON.parse(values).workingDir+JSON.parse(values).questionDashed+'.html', $("#answers .answer .post-text").html(), err => console.log(err)); // this may overwrite an existing file created by the Batch script 
      console.log("Sans Stripped html"); 
  }); 
}); 