; Inno Setup Script for Hookshot Builder v2.0.9
; Complete, Standalone & Offline Installer

#define MyAppName "Hookshot Builder"
#define MyAppVersion "2.0.9"
#define MyAppPublisher "Hookshot Project"
#define MyAppURL "https://github.com/NotRexed/Hookshot"
#define MyAppExeName "HookshotBuilder.exe"

[Setup]
AppId={{5E7151BD-45E1-4FA4-8E43-E6AA4917C177}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
LicenseFile=C:\Users\Tarig\.gemini\antigravity\scratch\Hookshot\Package-v2.0.9\LICENSE
OutputDir=C:\Users\Tarig\.gemini\antigravity\scratch\Hookshot\Installer-Output
OutputBaseFilename=HookshotBuilder-v2.0.9-Complete-Setup
SetupIconFile=C:\Users\Tarig\.gemini\antigravity\scratch\Hookshot\Package-v2.0.9\tools\work\hookshot.ico
Compression=lzma2/fast
SolidCompression=yes
WizardStyle=modern
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
DisableProgramGroupPage=auto
PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=dialog

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "C:\Users\Tarig\.gemini\antigravity\scratch\Hookshot\Package-v2.0.9\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; IconFilename: "{app}\tools\work\hookshot.ico"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; IconFilename: "{app}\tools\work\hookshot.ico"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent
