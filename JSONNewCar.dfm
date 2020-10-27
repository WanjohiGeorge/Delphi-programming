object fNewCar: TfNewCar
  Left = 0
  Top = 0
  Caption = 'New Car'
  ClientHeight = 429
  ClientWidth = 430
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblEnterNewCar: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 12
    Width = 424
    Height = 50
    Margins.Top = 12
    Align = alClient
    Alignment = taCenter
    Caption = 'Enter New Car'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 390
    ExplicitHeight = 53
  end
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 65
    Width = 424
    Height = 73
    Align = alBottom
    Caption = 'Manufacturer'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitTop = 89
    ExplicitWidth = 390
    object edtManufacturer: TEdit
      Left = 2
      Top = 25
      Width = 420
      Height = 46
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitLeft = 1
      ExplicitTop = 27
    end
  end
  object GroupBox2: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 223
    Width = 424
    Height = 80
    Align = alBottom
    Caption = 'Price'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ExplicitLeft = -2
    ExplicitTop = 231
    ExplicitWidth = 365
    object edtPrice: TEdit
      Left = 2
      Top = 25
      Width = 420
      Height = 53
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 1
      ExplicitTop = 27
    end
  end
  object GroupBox3: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 309
    Width = 424
    Height = 72
    Margins.Bottom = 7
    Align = alBottom
    Caption = 'Currency'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitLeft = 8
    ExplicitTop = 299
    ExplicitWidth = 384
    object edtCurrency: TEdit
      Left = 2
      Top = 25
      Width = 420
      Height = 45
      Align = alClient
      TabOrder = 0
      ExplicitTop = 15
      ExplicitWidth = 361
      ExplicitHeight = 31
    end
  end
  object GroupBox4: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 144
    Width = 424
    Height = 73
    Align = alBottom
    Caption = 'Name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    ExplicitLeft = 0
    ExplicitTop = 112
    ExplicitWidth = 390
    object edtName: TEdit
      Left = 2
      Top = 25
      Width = 420
      Height = 46
      Align = alClient
      TabOrder = 0
      ExplicitTop = 15
      ExplicitWidth = 361
      ExplicitHeight = 31
    end
  end
  object GridPanel1: TGridPanel
    Left = 0
    Top = 388
    Width = 430
    Height = 41
    Align = alBottom
    ColumnCollection = <
      item
        Value = 47.368421052631580000
      end
      item
        Value = 52.631578947368420000
      end>
    ControlCollection = <
      item
        Column = 0
        Control = btnCancel
        Row = 0
      end
      item
        Column = 1
        Control = btnSave
        Row = 0
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    RowCollection = <
      item
        Value = 100.000000000000000000
      end>
    TabOrder = 4
    ExplicitLeft = -8
    ExplicitTop = 405
    object btnCancel: TButton
      Left = 1
      Top = 1
      Width = 202
      Height = 39
      Align = alClient
      Caption = 'Cancel'
      TabOrder = 0
      OnClick = btnCancelClick
      ExplicitWidth = 112
    end
    object btnSave: TButton
      Left = 203
      Top = 1
      Width = 226
      Height = 39
      Align = alClient
      Caption = 'Save'
      TabOrder = 1
      OnClick = btnSaveClick
      ExplicitLeft = 201
      ExplicitTop = 3
    end
  end
end
