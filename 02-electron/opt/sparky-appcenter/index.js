const { app, BrowserWindow, Menu, shell, dialog } = require('electron');

let startScreen;

app.on('ready', () => {
    startScreen = new BrowserWindow({
        width: 880,
        height: 630
    });

    startScreen.on('closed', () => {
        startScreen = null;
    });

    startScreen.loadURL('file://' + __dirname + '/index.html');
});

app.on('window-all-closed', () => {
    if (process.platform !== 'darwin') {
        app.quit();
    }
});

let template = [{
  label: 'Main',
  submenu: [{
    label: 'Full Screen',
    accelerator: (() => {
      if (process.platform === 'darwin') {
        return 'Ctrl+Command+F'
      } else {
        return 'F11'
      }
    })(),
    click: (item, focusedWindow) => {
      if (focusedWindow) {
        focusedWindow.setFullScreen(!focusedWindow.isFullScreen())
      }
    }
  }, {
    type: 'separator'
  }, {
    label: 'Exit',
    accelerator: 'CmdOrCtrl+W',
    role: 'close'
  }]
}]

const menu = Menu.buildFromTemplate(template)
Menu.setApplicationMenu(menu)
