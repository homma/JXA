
// Files will be saved under ~/Library/Containers/com.apple.TextEdit/Data .
var name = "FOO";
var text = "FOOBAR\n";

var main = function() {

  var app = Application("TextEdit");

  // Create a file and set a name on it.
  app.Document().make().name = name;

  // Find the file created.
  doc = app.documents().find(function(el) {
          if(el.name() == name ) { return true }
        })

  // Modify contents.
  // Contantes are aved automatically.
  doc.text = text;

  // Close the file.
  doc.close();

}

main();
