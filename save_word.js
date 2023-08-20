const app = Application.currentApplication();
app.includeStandardAdditions = true;

function appendToFile(text, file) {
  try {
    const fd = app.openForAccess(Path(file), { writePermission: true });

    app.write(text, { to: fd, startingAt: app.getEof(fd), as: "string" });
    app.closeAccess(fd);
    return true;
  } catch (e) {
    app.closeAccess(file);
    return false;
  }
}

function run(input, parameters) {
  // Automator ignores '\n' but '\n\0'
  const text = `${input[0]}\n\0`;

  // const output_dir = app.doShellScript("getconf DARWIN_USER_DIR");
  const output_dir = app.pathTo("home folder");
  const file = `${output_dir}/words.txt`;

  appendToFile(text, file);
}
