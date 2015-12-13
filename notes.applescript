
// Backup will be saved under ~/Library/Containers/com.apple.TextEdit/Data .

// config
var html = true;
var file = "note" + Date();
var data = "";

var dumpNote = function(note) {

  var text = "";
  var title = note.name();
  var body = note.body();

  if(html) {
    text = "<h4>" + title + "</h4>" + "\n" + body + "\n";
  } else {
    text = "Title: " + title + "\n" + "Body: " + body + "\n";
  }

  data = data + text;

}

var dumpFolder = function(folder) {

  var text = "";
  var name = folder.name();

  if(html) {
    text = "<h3>" + name + "</h3>" + "\n";
  } else {
    text = "Folder: " + name + "\n";
  }

  data = data + text;

  folder.notes().forEach(dumpNote);

}

var dumpAccount = function(account) {

  var text = "";
  var name = account.name();

  if(html) {
    text = "<h2>" + name + "</h2>" + "\n";
  } else {
    text = "Account: : " + name + "\n";
  }

  data = data + text

  var folders = account.folders();
  folders.forEach(dumpFolder);

}

var output = function() {

  if(html) {
    name = file + ".html";
  } else {
    name = file + ".text";
  }

  var app = Application("TextEdit");
  app.Document().make().name = name;

  doc = app.documents().find(function(el) {
          if(el.name() == name ) { return true }
        })

  doc.text = data;

  doc.close();

}

var main = function() {

  var account = Application("Notes").accounts();
  account.forEach(dumpAccount);

  output();

}

main()
