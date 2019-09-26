; *** *** *** *** *** *** *** *** *** *** *** *** *** ***
; REQUIRED:
; *** *** *** *** *** *** *** *** *** *** *** *** *** ***

; PHP Desktop folder name
!define FOLDER_NAME ""
; PHP Desktop .exe file name (no extensions)
!define FILE_NAME ""

; *** *** *** *** *** *** *** *** *** *** *** *** *** ***
; OPTIONAL:
; *** *** *** *** *** *** *** *** *** *** *** *** *** ***

; installer information
!define PRODUCT_NAME ""
!define PRODUCT_VERSION ""
!define PRODUCT_PUBLISHER ""
!define PRODUCT_WEB_SITE ""

; *** *** *** *** *** *** *** *** *** *** *** *** *** ***

!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\${FILE_NAME}.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"

SetCompressor lzma

; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "English"

; Reserve files
!insertmacro MUI_RESERVEFILE_INSTALLOPTIONS

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "Setup.exe"
InstallDir "C:\${FOLDER_NAME}"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
SilentInstall silent
ShowUnInstDetails show

Section "MainSection" SEC01
  SetOutPath "C:\${FOLDER_NAME}"
  SetOverwrite try
  File "${FOLDER_NAME}\cef.pak"
  File "${FOLDER_NAME}\cef_100_percent.pak"
  File "${FOLDER_NAME}\cef_200_percent.pak"
  File "${FOLDER_NAME}\cef_extensions.pak"
  File "${FOLDER_NAME}\chrome_elf.dll"
  File "${FOLDER_NAME}\${FILE_NAME}.exe"
  CreateDirectory "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\${FOLDER_NAME}"
  CreateShortCut "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\${FOLDER_NAME}\${FILE_NAME}.lnk" "C:\${FOLDER_NAME}\${FILE_NAME}.exe"
  CreateDirectory "C:\Users\Public\Desktop"
  CreateShortCut "C:\Users\Public\Desktop\${FILE_NAME}.lnk" "C:\${FOLDER_NAME}\${FILE_NAME}.exe"
  File "${FOLDER_NAME}\d3dcompiler_43.dll"
  File "${FOLDER_NAME}\d3dcompiler_47.dll"
  File "${FOLDER_NAME}\debug.log"
  File "${FOLDER_NAME}\devtools_resources.pak"
  File "${FOLDER_NAME}\icudtl.dat"
  File "${FOLDER_NAME}\libcef.dll"
  File "${FOLDER_NAME}\libEGL.dll"
  File "${FOLDER_NAME}\libGLESv2.dll"
  File "${FOLDER_NAME}\license.txt"
  SetOutPath "C:\${FOLDER_NAME}\locales"
  File "${FOLDER_NAME}\locales\am.pak"
  File "${FOLDER_NAME}\locales\ar.pak"
  File "${FOLDER_NAME}\locales\bg.pak"
  File "${FOLDER_NAME}\locales\bn.pak"
  File "${FOLDER_NAME}\locales\ca.pak"
  File "${FOLDER_NAME}\locales\cs.pak"
  File "${FOLDER_NAME}\locales\da.pak"
  File "${FOLDER_NAME}\locales\de.pak"
  File "${FOLDER_NAME}\locales\el.pak"
  File "${FOLDER_NAME}\locales\en-GB.pak"
  File "${FOLDER_NAME}\locales\en-US.pak"
  File "${FOLDER_NAME}\locales\es-419.pak"
  File "${FOLDER_NAME}\locales\es.pak"
  File "${FOLDER_NAME}\locales\et.pak"
  File "${FOLDER_NAME}\locales\fa.pak"
  File "${FOLDER_NAME}\locales\fi.pak"
  File "${FOLDER_NAME}\locales\fil.pak"
  File "${FOLDER_NAME}\locales\fr.pak"
  File "${FOLDER_NAME}\locales\gu.pak"
  File "${FOLDER_NAME}\locales\he.pak"
  File "${FOLDER_NAME}\locales\hi.pak"
  File "${FOLDER_NAME}\locales\hr.pak"
  File "${FOLDER_NAME}\locales\hu.pak"
  File "${FOLDER_NAME}\locales\id.pak"
  File "${FOLDER_NAME}\locales\it.pak"
  File "${FOLDER_NAME}\locales\ja.pak"
  File "${FOLDER_NAME}\locales\kn.pak"
  File "${FOLDER_NAME}\locales\ko.pak"
  File "${FOLDER_NAME}\locales\lt.pak"
  File "${FOLDER_NAME}\locales\lv.pak"
  File "${FOLDER_NAME}\locales\ml.pak"
  File "${FOLDER_NAME}\locales\mr.pak"
  File "${FOLDER_NAME}\locales\ms.pak"
  File "${FOLDER_NAME}\locales\nb.pak"
  File "${FOLDER_NAME}\locales\nl.pak"
  File "${FOLDER_NAME}\locales\pl.pak"
  File "${FOLDER_NAME}\locales\pt-BR.pak"
  File "${FOLDER_NAME}\locales\pt-PT.pak"
  File "${FOLDER_NAME}\locales\ro.pak"
  File "${FOLDER_NAME}\locales\ru.pak"
  File "${FOLDER_NAME}\locales\sk.pak"
  File "${FOLDER_NAME}\locales\sl.pak"
  File "${FOLDER_NAME}\locales\sr.pak"
  File "${FOLDER_NAME}\locales\sv.pak"
  File "${FOLDER_NAME}\locales\sw.pak"
  File "${FOLDER_NAME}\locales\ta.pak"
  File "${FOLDER_NAME}\locales\te.pak"
  File "${FOLDER_NAME}\locales\th.pak"
  File "${FOLDER_NAME}\locales\tr.pak"
  File "${FOLDER_NAME}\locales\uk.pak"
  File "${FOLDER_NAME}\locales\vi.pak"
  File "${FOLDER_NAME}\locales\zh-CN.pak"
  File "${FOLDER_NAME}\locales\zh-TW.pak"
  SetOutPath "C:\${FOLDER_NAME}"
  File "${FOLDER_NAME}\natives_blob.bin"
  SetOutPath "C:\${FOLDER_NAME}\php"
  File "${FOLDER_NAME}\php\!README.txt"
  SetOutPath "C:\${FOLDER_NAME}\php\ext"
  File "${FOLDER_NAME}\php\ext\php_bz2.dll"
  File "${FOLDER_NAME}\php\ext\php_com_dotnet.dll"
  File "${FOLDER_NAME}\php\ext\php_curl.dll"
  File "${FOLDER_NAME}\php\ext\php_enchant.dll"
  File "${FOLDER_NAME}\php\ext\php_exif.dll"
  File "${FOLDER_NAME}\php\ext\php_fileinfo.dll"
  File "${FOLDER_NAME}\php\ext\php_ftp.dll"
  File "${FOLDER_NAME}\php\ext\php_gd2.dll"
  File "${FOLDER_NAME}\php\ext\php_gettext.dll"
  File "${FOLDER_NAME}\php\ext\php_gmp.dll"
  File "${FOLDER_NAME}\php\ext\php_imap.dll"
  File "${FOLDER_NAME}\php\ext\php_interbase.dll"
  File "${FOLDER_NAME}\php\ext\php_intl.dll"
  File "${FOLDER_NAME}\php\ext\php_ldap.dll"
  File "${FOLDER_NAME}\php\ext\php_mbstring.dll"
  File "${FOLDER_NAME}\php\ext\php_mysqli.dll"
  File "${FOLDER_NAME}\php\ext\php_oci8_12c.dll"
  File "${FOLDER_NAME}\php\ext\php_odbc.dll"
  File "${FOLDER_NAME}\php\ext\php_opcache.dll"
  File "${FOLDER_NAME}\php\ext\php_openssl.dll"
  File "${FOLDER_NAME}\php\ext\php_pdo_firebird.dll"
  File "${FOLDER_NAME}\php\ext\php_pdo_mysql.dll"
  File "${FOLDER_NAME}\php\ext\php_pdo_oci.dll"
  File "${FOLDER_NAME}\php\ext\php_pdo_odbc.dll"
  File "${FOLDER_NAME}\php\ext\php_pdo_pgsql.dll"
  File "${FOLDER_NAME}\php\ext\php_pdo_sqlite.dll"
  File "${FOLDER_NAME}\php\ext\php_pgsql.dll"
  File "${FOLDER_NAME}\php\ext\php_phpdbg_webhelper.dll"
  File "${FOLDER_NAME}\php\ext\php_shmop.dll"
  File "${FOLDER_NAME}\php\ext\php_snmp.dll"
  File "${FOLDER_NAME}\php\ext\php_soap.dll"
  File "${FOLDER_NAME}\php\ext\php_sockets.dll"
  File "${FOLDER_NAME}\php\ext\php_sqlite3.dll"
  File "${FOLDER_NAME}\php\ext\php_sysvshm.dll"
  File "${FOLDER_NAME}\php\ext\php_tidy.dll"
  File "${FOLDER_NAME}\php\ext\php_xmlrpc.dll"
  File "${FOLDER_NAME}\php\ext\php_xsl.dll"
  SetOutPath "C:\${FOLDER_NAME}\php"
  File "${FOLDER_NAME}\php\glib-2.dll"
  File "${FOLDER_NAME}\php\gmodule-2.dll"
  File "${FOLDER_NAME}\php\icudt57.dll"
  File "${FOLDER_NAME}\php\icuin57.dll"
  File "${FOLDER_NAME}\php\icuio57.dll"
  File "${FOLDER_NAME}\php\icule57.dll"
  File "${FOLDER_NAME}\php\iculx57.dll"
  File "${FOLDER_NAME}\php\icuuc57.dll"
  SetOutPath "C:\${FOLDER_NAME}\php\lib\enchant"
  File "${FOLDER_NAME}\php\lib\enchant\libenchant_ispell.dll"
  File "${FOLDER_NAME}\php\lib\enchant\libenchant_myspell.dll"
  SetOutPath "C:\${FOLDER_NAME}\php"
  File "${FOLDER_NAME}\php\libeay32.dll"
  File "${FOLDER_NAME}\php\libenchant.dll"
  File "${FOLDER_NAME}\php\libpq.dll"
  File "${FOLDER_NAME}\php\libsasl.dll"
  File "${FOLDER_NAME}\php\libssh2.dll"
  File "${FOLDER_NAME}\php\license.txt"
  File "${FOLDER_NAME}\php\phar.phar.bat"
  File "${FOLDER_NAME}\php\pharcommand.phar"
  File "${FOLDER_NAME}\php\php-cgi.exe"
  File "${FOLDER_NAME}\php\php-win.exe"
  File "${FOLDER_NAME}\php\php.exe"
  File "${FOLDER_NAME}\php\php.gif"
  File "${FOLDER_NAME}\php\php.ini"
  File "${FOLDER_NAME}\php\php7.dll"
  SetOutPath "C:\${FOLDER_NAME}\php\sasl2"
  File "${FOLDER_NAME}\php\sasl2\saslANONYMOUS.dll"
  File "${FOLDER_NAME}\php\sasl2\saslCRAMMD5.dll"
  File "${FOLDER_NAME}\php\sasl2\saslDIGESTMD5.dll"
  File "${FOLDER_NAME}\php\sasl2\saslLOGIN.dll"
  File "${FOLDER_NAME}\php\sasl2\saslNTLM.dll"
  File "${FOLDER_NAME}\php\sasl2\saslOTP.dll"
  File "${FOLDER_NAME}\php\sasl2\saslPLAIN.dll"
  File "${FOLDER_NAME}\php\sasl2\saslSCRAM.dll"
  File "${FOLDER_NAME}\php\sasl2\saslSQLITE.dll"
  File "${FOLDER_NAME}\php\sasl2\saslSRP.dll"
  SetOutPath "C:\${FOLDER_NAME}\php"
  File "${FOLDER_NAME}\php\ssleay32.dll"
  SetOutPath "C:\${FOLDER_NAME}"
  File "${FOLDER_NAME}\settings.json"
  File "${FOLDER_NAME}\snapshot_blob.bin"
  File "${FOLDER_NAME}\widevinecdmadapter.dll"
  SetOutPath "C:\${FOLDER_NAME}\www\assets\fonts"
  File "${FOLDER_NAME}\www\assets\fonts\ionicons.eot"
  File "${FOLDER_NAME}\www\assets\fonts\ionicons.scss"
  File "${FOLDER_NAME}\www\assets\fonts\ionicons.svg"
  File "${FOLDER_NAME}\www\assets\fonts\ionicons.ttf"
  File "${FOLDER_NAME}\www\assets\fonts\ionicons.woff"
  File "${FOLDER_NAME}\www\assets\fonts\ionicons.woff2"
  File "${FOLDER_NAME}\www\assets\fonts\noto-sans-bold.ttf"
  File "${FOLDER_NAME}\www\assets\fonts\noto-sans-bold.woff"
  File "${FOLDER_NAME}\www\assets\fonts\noto-sans-regular.ttf"
  File "${FOLDER_NAME}\www\assets\fonts\noto-sans-regular.woff"
  File "${FOLDER_NAME}\www\assets\fonts\noto-sans.scss"
  File "${FOLDER_NAME}\www\assets\fonts\roboto-bold.ttf"
  File "${FOLDER_NAME}\www\assets\fonts\roboto-bold.woff"
  File "${FOLDER_NAME}\www\assets\fonts\roboto-bold.woff2"
  File "${FOLDER_NAME}\www\assets\fonts\roboto-light.ttf"
  File "${FOLDER_NAME}\www\assets\fonts\roboto-light.woff"
  File "${FOLDER_NAME}\www\assets\fonts\roboto-light.woff2"
  File "${FOLDER_NAME}\www\assets\fonts\roboto-medium.ttf"
  File "${FOLDER_NAME}\www\assets\fonts\roboto-medium.woff"
  File "${FOLDER_NAME}\www\assets\fonts\roboto-medium.woff2"
  File "${FOLDER_NAME}\www\assets\fonts\roboto-regular.ttf"
  File "${FOLDER_NAME}\www\assets\fonts\roboto-regular.woff"
  File "${FOLDER_NAME}\www\assets\fonts\roboto-regular.woff2"
  File "${FOLDER_NAME}\www\assets\fonts\roboto.scss"
  SetOutPath "C:\${FOLDER_NAME}\www\assets\icon"
  File "${FOLDER_NAME}\www\assets\icon\favicon.ico"
  SetOutPath "C:\${FOLDER_NAME}\www\assets\images"
  File "${FOLDER_NAME}\www\assets\images\meeting-bk.png"
  SetOutPath "C:\${FOLDER_NAME}\www\build"
  File "${FOLDER_NAME}\www\build\main.css"
  File "${FOLDER_NAME}\www\build\main.css.map"
  File "${FOLDER_NAME}\www\build\main.js"
  File "${FOLDER_NAME}\www\build\main.js.map"
  File "${FOLDER_NAME}\www\build\polyfills.js"
  File "${FOLDER_NAME}\www\build\sw-toolbox.js"
  File "${FOLDER_NAME}\www\build\vendor.js"
  File "${FOLDER_NAME}\www\build\vendor.js.map"
  SetOutPath "C:\${FOLDER_NAME}\www"
  File "${FOLDER_NAME}\www\index.html"
  File "${FOLDER_NAME}\www\manifest.json"
  File "${FOLDER_NAME}\www\service-worker.js"
  File "${FOLDER_NAME}\www\syncpage.php"
SectionEnd

Section -AdditionalIcons
  SetOutPath $INSTDIR
  CreateShortCut "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\${FOLDER_NAME}\Uninstall.lnk" "$INSTDIR\uninst.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "C:\${FOLDER_NAME}\${FILE_NAME}.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "C:\${FOLDER_NAME}\${FILE_NAME}.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd

Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) was successfully removed from your computer."
FunctionEnd

Function un.onInit
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "Are you sure you want to completely remove $(^Name) and all of its components?" IDYES +2
  Abort
FunctionEnd

Section Uninstall
  Delete "$INSTDIR\uninst.exe"

  Delete "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\${FOLDER_NAME}\Uninstall.lnk"
  Delete "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\${FOLDER_NAME}\${FILE_NAME}.lnk"
  Delete "C:\Users\Public\Desktop\${FILE_NAME}.lnk"

  RMDir "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\${FOLDER_NAME}"
  RMDir "C:\Users\Public\Desktop"
  RMDir /r "C:\${FOLDER_NAME}"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
SectionEnd