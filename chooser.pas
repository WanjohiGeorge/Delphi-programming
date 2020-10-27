unit chooser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.WinXCtrls,
  Vcl.StdCtrls, Vcl.ToolWin, Vcl.ComCtrls;

type
  Tproject_choser = class(TForm)
    RelativePanel1: TRelativePanel;
    btnStylechoser: TButton;
    Button2: TButton;
    btnQWRTYKeyboard: TButton;
    Button5: TButton;
    Button6: TButton;
    btnDirBrowser: TButton;
    Button8: TButton;
    Button9: TButton;
    btnNMRCKeyboard: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    btnJSONManipulation: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    btnGraphs: TButton;
    Button19: TButton;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    btnXML: TButton;
    btnDBGrid1: TButton;
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    procedure btnDBGrid1Click(Sender: TObject);
    procedure btnStylechoserClick(Sender: TObject);
    procedure btnNMRCKeyboardClick(Sender: TObject);
    procedure btnQWRTYKeyboardClick(Sender: TObject);
    procedure btnDirBrowserClick(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure btnJSONManipulationClick(Sender: TObject);
    procedure btnGraphsClick(Sender: TObject);
    procedure btnXMLClick(Sender: TObject);
    procedure Button22Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  project_choser: Tproject_choser;

implementation

uses
  tdbgrid_work, DelphiONScreenKeyboard, directorybrowser, numericKeyBoard,
  stylechooser, listboxdrawing, drawgridcustom, parsingJSONExample, parsingXML,
  Dffie_Hellman;

{$R *.dfm}

procedure Tproject_choser.btnDBGrid1Click(Sender: TObject);

var
  grid_custom: Tgrid_custom;
begin
  grid_custom := tdbgrid_work.tgrid_custom.Create(self);
  grid_custom.ShowModal;
end;

procedure Tproject_choser.btnDirBrowserClick(Sender: TObject);
var
  dir_browser: Tdir_browser;
begin
  dir_browser := directorybrowser.tdir_browser.Create(self);
  dir_browser.ShowModal;
end;

procedure Tproject_choser.btnGraphsClick(Sender: TObject);
begin
  //
end;

procedure Tproject_choser.btnJSONManipulationClick(Sender: TObject);
var
  lParser: TparsingJSON;
begin
  // JSON
  lParser := TparsingJSON.Create(self);
  lParser.ShowModal();
end;

procedure Tproject_choser.btnNMRCKeyboardClick(Sender: TObject);
var
  numeric_keyboard: Tnumeric_keyboard;
begin
  numeric_keyboard := numericKeyBoard.tnumeric_keyboard.create(self);
  numeric_keyboard.ShowModal;
end;

procedure Tproject_choser.btnQWRTYKeyboardClick(Sender: TObject);
var
  onscreenkeyboard1: Tonscreenkeyboard1;
begin
  onscreenkeyboard1 := DelphiONScreenKeyboard.Tonscreenkeyboard1.Create(self);
  onscreenkeyboard1.ShowModal;
end;

procedure Tproject_choser.btnStylechoserClick(Sender: TObject);
var
  style_form: Tstyle_form;
begin
  style_form := stylechooser.tstyle_form.Create(self);
  style_form.ShowModal;
end;

procedure Tproject_choser.btnXMLClick(Sender: TObject);
var
  lXML: TfParseXML;
begin
  lXML := TfParseXML.Create(self);
  lXML.ShowModal;
end;

procedure Tproject_choser.Button15Click(Sender: TObject);
//var
  // ldrawgrid: tdrawgrid;
begin
  //  ldrawgrid := drawgridcustom.Tdrawgrid.Create(Self);
  //  ldrawgrid.showmodal;
end;

procedure Tproject_choser.Button21Click(Sender: TObject);
var
  lLbForm: TlbDrawing;
begin
  lLbForm := listboxdrawing.TlbDrawing.Create(self);
  lLbForm.ShowModal;
end;

procedure Tproject_choser.Button22Click(Sender: TObject);
var
  lDiffie: TfrDiffie;
begin
  lDiffie := TfrDiffie.Create(self);
  lDiffie.ShowModal;
end;

end.



