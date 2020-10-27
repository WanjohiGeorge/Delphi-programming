unit directorybrowser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.FileCtrl, Vcl.Menus,
  Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ActnMenus, Vcl.ComCtrls,
  Vcl.BaseImageCollection, Vcl.ImageCollection, Vcl.ExtCtrls, Vcl.ActnPopup,
  System.Actions, Vcl.ActnList, Vcl.StdActns, System.ImageList, Vcl.ImgList,
  Vcl.Buttons, Vcl.Grids, Vcl.Outline, Vcl.Samples.DirOutln;

type
  Tdir_browser = class(TForm)
    FileListBox1: TFileListBox;
    ActionMainMenuBar1: TActionMainMenuBar;
    MainMenu1: TMainMenu;
    file1: TMenuItem;
    save1: TMenuItem;
    saveas1: TMenuItem;
    N1: TMenuItem;
    exit1: TMenuItem;
    edit1: TMenuItem;
    undo1: TMenuItem;
    redo1: TMenuItem;
    copy1: TMenuItem;
    cut1: TMenuItem;
    paste1: TMenuItem;
    view1: TMenuItem;
    layout1: TMenuItem;
    toolbars1: TMenuItem;
    tools1: TMenuItem;
    options1: TMenuItem;
    help1: TMenuItem;
    about1: TMenuItem;
    help2: TMenuItem;
    activate1: TMenuItem;
    ImageCollection1: TImageCollection;
    ImageList1: TImageList;
    DriveComboBox1: TDriveComboBox;
    DirectoryListBox1: TDirectoryListBox;
    ProgressBar1: TProgressBar;
    Timer1: TTimer;
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    procedure exit1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DirectoryListBox1Change(Sender: TObject);
    procedure DriveComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  Vcl.XPStyleActnCtrls;

{$R *.dfm}

procedure Tdir_browser.DirectoryListBox1Change(Sender: TObject);
begin
  //FileListBox1.FileName :=
  FileListBox1.Directory := DirectoryListBox1.Directory;
end;

procedure Tdir_browser.DriveComboBox1Change(Sender: TObject);
begin
  DirectoryListBox1.Drive := DriveComboBox1.Drive;
  FileListBox1.Drive := DriveComboBox1.Drive;
  FileListBox1.Directory := DirectoryListBox1.Directory;
end;

procedure Tdir_browser.exit1Click(Sender: TObject);
var
  i: integer;
begin
  ProgressBar1.Create(nil);
  ProgressBar1.Min := 0;
  ProgressBar1.Max := 100000;
  for I := 0 to 100000 do
  begin
    ProgressBar1.StepIt;
  end;
  Application.Terminate;
end;

procedure Tdir_browser.SpeedButton1Click(Sender: TObject);
begin
  exit1Click(sender);
end;

end.



