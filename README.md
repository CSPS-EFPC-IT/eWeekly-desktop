# E-Weekly Desktop

Software, services and procedure used to bundle the [E-Weekly App](https://github.com/csps-efpc-it/eWeekly) as an installation for an executable desktop application.

## Features

- Sync, load, and display packages with optional expiry date
- Silent installer for packaging and distribution

## Components

You will need the following:
- [E-Weekly App](https://github.com/csps-efpc-it/eWeekly), a modified version of the [E-Briefing App](https://github.com/cds-snc/e-briefing-app)
- [PHP Desktop](https://github.com/cztomczak/phpdesktop) v57.0 for Windows
- [Nullsoft Scriptable Install System](https://nsis.sourceforge.io/Download) v3.04

## Procedure

### Desktop Launcher

Download [PHP Desktop](https://github.com/cztomczak/phpdesktop) and replace the `www` folder with the one generated from your compiled [E-Weekly App](https://github.com/csps-efpc-it/eWeekly). Add the provided `syncpage.php` file in your new `www` folder, as shown by the following structure:

```
- www/
  - assets/
  - build/
    - main.js
  - syncpage.php
```

Modify your `build/main.js` file and edit the `SyncPage.prototype.syncData` function for the following features:

- To allow the Sync functionality to refresh the current Trip:
```
SyncPage.prototype.syncData = function () {
    window.open('syncpage.php?api_key=' + this.globals.api_key + '&trip_id=' + this.globals.trip_id + '&api_url=' + this.globals.api_url);
};
```

- To allow the Sync functionality to let the user choose their Trip:
```
SyncPage.prototype.syncData = function () {
    var trip_id = prompt('Please enter Trip ID:');
    window.open('syncpage.php?api_key=' + this.globals.api_key + '&trip_id=' + trip_id + '&api_url=' + this.globals.api_url);
};
```

You can then use [PHP Desktop](https://github.com/cztomczak/phpdesktop)'s executable to launch the [E-Weekly App](https://github.com/csps-efpc-it/eWeekly) with the relevant features.

Please note that instructions to include an optional expiry date have been commented into `syncpage.php`.

### Installer

Close any open instances of [PHP Desktop](https://github.com/cztomczak/phpdesktop) and run `installerscript.nsi` with [Nullsoft Scriptable Install System](https://nsis.sourceforge.io/Download) to generate your package installer.

Please note that you may need to edit the script to adjust for file differences in your build. A generic installer script can be generated with [HM NIS Edit](http://hmne.sourceforge.net/), as needed.

### Variables

#### `build/main.js`

```
var GlobalsProvider = (function () {
    function GlobalsProvider() {
        this.api_key = '';
        this.trip_id = '';
        this.api_url = '';
    }
}());
```

#### `installerscript.nsi`

```
!define FOLDER_NAME ""
!define FILE_NAME ""

!define PRODUCT_NAME ""
!define PRODUCT_VERSION ""
!define PRODUCT_PUBLISHER ""
!define PRODUCT_WEB_SITE ""
```