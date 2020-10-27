unit listboxdrawing;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.ImageList,
  Vcl.ImgList;

type
  TlbDrawing = class(TForm)
    ListBox1: TListBox;
    ImageList1: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure ListBox1DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TlbDrawing.FormCreate(Sender: TObject);
begin
  ListBox1.Items.Add('10% discount');
  ListBox1.Items.Add('20% discount');
  ListBox1.Items.Add('30% discount');
  ListBox1.Items.Add('40% discount');
  ListBox1.Items.Add('50% discount');
  ListBox1.Items.Add('60% discount');
  ListBox1.Items.Add('70% discount');
end;

procedure TlbDrawing.ListBox1DrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
  lBox: TListBox;
  R: TRect;
  S: string;
  TextTopPos, TextleftPos, TextHeight: integer;
const
  IMG_TEXT_SPAC = 5;
begin
  lBox := Control as TListBox;
  R := Rect;
  LBox.Canvas.FillRect(R);
  ImageList1.Draw(lBox.Canvas, R.Left, R.Top, index);
  s := lBox.Items[index];
  TextHeight := lBox.Canvas.TextHeight(S);
  TextleftPos := R.Left + ImageList1.Width + IMG_TEXT_SPAC;
  TextTopPos := R.Top+R.Height div 2 - TextHeight div 2;
  Lbox.Canvas.TextOut(TextleftPos, TextTopPos,S);
end;

end.


