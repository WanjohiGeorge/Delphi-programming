unit drawgridcustom;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList;

type
  Tx = class(TForm)
    RadioGroup1: TRadioGroup;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  Vcl.Themes;

{$R *.dfm}

procedure Tx.FormShow(Sender: TObject);
var
  lStylename: string;
begin
  RadioGroup1.Items.Clear;
  RadioGroup1.Columns := Length(TStyleManager.StyleNames);
  for lStyleName in Tstylemanager.StyleNames  do
  begin
    RadioGroup1.Items.Add(lStylename);
  end;

end;

end.
