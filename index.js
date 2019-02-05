// eslint-disable-next-line import/no-extraneous-dependencies
const { app, BrowserWindow } = require('electron');
const { windowConfig } = require('./config');

// Keep a global reference of the window object, if you don't, the window will
// be closed automatically when the JavaScript object is garbage collected.
let mainWindow;

function createWindow() {
  mainWindow = new BrowserWindow({ ...windowConfig });
  mainWindow.loadFile('index.html');
  mainWindow.setMenu(null);
  // mainWindow.webContents.openDevTools();
  mainWindow.on('closed', () => {
    mainWindow = null;
  });
}
app.on('ready', createWindow);
app.on('window-all-closed', () => {
  // On macOS it's common for applications and their menu bar
  // to stay active until the user quits explicitly with Cmd + Q
  if (process.platform !== 'darwin') app.quit();
});

app.on('activate', () => {
  // On macOS it's common to re-create a window in the app when the
  // dock icon is clicked and there are no other windows open.
  if (mainWindow === null) createWindow();
});
