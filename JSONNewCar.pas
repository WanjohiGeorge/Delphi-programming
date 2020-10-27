unit JSONNewCar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfNewCar = class(TForm)
    GroupBox1: TGroupBox;
    edtManufacturer: TEdit;
    GroupBox2: TGroupBox;
    edtPrice: TEdit;
    GroupBox3: TGroupBox;
    edtCurrency: TEdit;
    GroupBox4: TGroupBox;
    edtName: TEdit;
    lblEnterNewCar: TLabel;
    GridPanel1: TGridPanel;
    btnCancel: TButton;
    btnSave: TButton;
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    FManufacturer, FCurrency, FName: string;
    Fprice: double;
    FCancelled: boolean;
    { Private declarations }
  public
    property manufacturer: string read FManufacturer;
    property currency: string read FCurrency;
    property name: string read FName;
    property price: double read FPrice;
    property cancelled: boolean read FCancelled write Fcancelled;
    { Public declarations }
  end;

var
  fNewCar: TfNewCar;

implementation

uses
  IdStrings;

{$R *.dfm}

procedure TfNewCar.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfNewCar.btnSaveClick(Sender: TObject);
begin
  // set all
  if (edtManufacturer.Text <> '') and (edtPrice.Text <> '') and (edtCurrency.Text
    <> '') and (edtName.Text <> '') then
  begin
    Fmanufacturer := edtManufacturer.Text;
    Fname := edtName.Text;
    Fprice := StrToFloat(edtPrice.Text);
    Fcurrency := edtCurrency.Text;
    FCancelled := False;
  end
  else
    FCancelled := true;
  Close;
end;

end.



