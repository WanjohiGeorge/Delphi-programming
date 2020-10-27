object frDiffie: TfrDiffie
  Left = 0
  Top = 0
  Caption = 'Diffie Hellman simulation for Two parties'
  ClientHeight = 772
  ClientWidth = 977
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GridPanel1: TGridPanel
    AlignWithMargins = True
    Left = 0
    Top = 0
    Width = 977
    Height = 664
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    ColumnCollection = <
      item
        Value = 50.000000000000000000
      end
      item
        Value = 50.000000000000000000
      end>
    ControlCollection = <
      item
        Column = 0
        Control = pnlClient1
        Row = 0
      end
      item
        Column = 1
        Control = pnlClient2
        Row = 0
      end>
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    RowCollection = <
      item
        Value = 100.000000000000000000
      end>
    TabOrder = 0
    object pnlClient1: TPanel
      AlignWithMargins = True
      Left = 1
      Top = 1
      Width = 487
      Height = 662
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      Padding.Right = 5
      TabOrder = 0
      object Label1: TLabel
        Left = 1
        Top = 1
        Width = 480
        Height = 32
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = 'Client 1'
        ExplicitWidth = 457
      end
      object mmLogs1: TMemo
        Left = 1
        Top = 153
        Width = 480
        Height = 508
        Margins.Left = 0
        Margins.Top = 0
        Margins.Bottom = 0
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Terminal'
        Font.Style = []
        Lines.Strings = (
          'Logs...')
        ParentFont = False
        TabOrder = 0
      end
      object Panel2: TPanel
        Left = 1
        Top = 33
        Width = 480
        Height = 120
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        TabOrder = 1
        object GridPanel2: TGridPanel
          Left = 1
          Top = 78
          Width = 478
          Height = 41
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alBottom
          ColumnCollection = <
            item
              Value = 60.942077100339790000
            end
            item
              Value = 39.057922899660210000
            end>
          ControlCollection = <
            item
              Column = 1
              Control = btnSend1
              Row = 0
            end>
          RowCollection = <
            item
              Value = 100.000000000000000000
            end>
          TabOrder = 0
          object btnSend1: TButton
            Left = 291
            Top = 1
            Width = 186
            Height = 39
            Margins.Left = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alClient
            Caption = 'Send'
            TabOrder = 0
            OnClick = btnSend1Click
          end
        end
        object edtMsg1: TRichEdit
          Left = 1
          Top = 1
          Width = 478
          Height = 77
          Margins.Left = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alClient
          HideSelection = False
          Lines.Strings = (
            'Type in the message to send')
          TabOrder = 1
          Zoom = 100
          OnEnter = edtMsg1Enter
          OnExit = edtMsg1Exit
        end
      end
    end
    object pnlClient2: TPanel
      AlignWithMargins = True
      Left = 491
      Top = 7
      Width = 485
      Height = 656
      Margins.Top = 6
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      Padding.Right = 4
      TabOrder = 1
      object lblClient2: TLabel
        Left = 1
        Top = 1
        Width = 479
        Height = 26
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = 'Client 2'
        ExplicitWidth = 483
      end
      object mmLogs2: TMemo
        Left = 1
        Top = 146
        Width = 479
        Height = 509
        Margins.Left = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Terminal'
        Font.Style = []
        Lines.Strings = (
          'Logs...')
        ParentFont = False
        TabOrder = 0
      end
      object Panel3: TPanel
        Left = 1
        Top = 27
        Width = 479
        Height = 119
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        TabOrder = 1
        object GridPanel3: TGridPanel
          Left = 1
          Top = 77
          Width = 477
          Height = 41
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alBottom
          ColumnCollection = <
            item
              Value = 62.686567164179100000
            end
            item
              Value = 37.313432835820890000
            end>
          ControlCollection = <
            item
              Column = 1
              Control = btnSend2
              Row = 0
            end>
          RowCollection = <
            item
              Value = 100.000000000000000000
            end>
          TabOrder = 0
          object btnSend2: TButton
            Left = 298
            Top = 1
            Width = 178
            Height = 39
            Align = alClient
            Caption = 'Send'
            TabOrder = 0
            OnClick = btnSend2Click
          end
        end
        object edtMsg2: TRichEdit
          Left = 1
          Top = 1
          Width = 477
          Height = 76
          Margins.Left = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alClient
          HideSelection = False
          Lines.Strings = (
            'Type in the message to send')
          TabOrder = 1
          Zoom = 100
          OnEnter = edtMsg2Enter
          OnExit = edtMsg2Exit
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 664
    Width = 977
    Height = 108
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 249
      Top = 1
      Width = 727
      Height = 106
      Align = alClient
      Caption = 'Initialize clients'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 248
      Height = 106
      Align = alLeft
      TabOrder = 1
      object Label2: TLabel
        Left = 1
        Top = 1
        Width = 246
        Height = 19
        Align = alTop
        Caption = 'Prime numbers upto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 145
      end
      object Panel5: TPanel
        Left = 1
        Top = 20
        Width = 246
        Height = 85
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object rb1000: TRadioButton
          Left = 1
          Top = 18
          Width = 244
          Height = 17
          Align = alTop
          Caption = '1000'
          TabOrder = 0
        end
        object rb10000: TRadioButton
          Left = 1
          Top = 35
          Width = 244
          Height = 17
          Align = alTop
          Caption = '10000'
          TabOrder = 1
        end
        object rb100: TRadioButton
          Left = 1
          Top = 1
          Width = 244
          Height = 17
          Align = alTop
          Caption = '100'
          TabOrder = 2
        end
        object rb100000: TRadioButton
          Left = 1
          Top = 52
          Width = 244
          Height = 18
          Align = alTop
          Caption = '100000'
          TabOrder = 3
        end
      end
    end
  end
end
