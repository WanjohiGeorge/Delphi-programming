unit DelphiONScreenKeyboard;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Touch.Keyboard, Vcl.StdCtrls,
  Vcl.ComCtrls;

type
  Tonscreenkeyboard1 = class(TForm)
    RichEdit1: TRichEdit;
    GroupBox1: TGroupBox;
    TouchKeyboard1: TTouchKeyboard;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure Tonscreenkeyboard1.FormCreate(Sender: TObject);
begin
  RichEdit1.Text := '';
end;

end.

