object onscreenkeyboard1: Tonscreenkeyboard1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Delphi Touch Keyboard'
  ClientHeight = 368
  ClientWidth = 725
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RichEdit1: TRichEdit
    Left = 8
    Top = 8
    Width = 709
    Height = 88
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'RichEdit1')
    ParentFont = False
    TabOrder = 0
    Zoom = 100
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 102
    Width = 709
    Height = 258
    Color = clMaroon
    ParentBackground = False
    ParentColor = False
    TabOrder = 1
    object TouchKeyboard1: TTouchKeyboard
      Left = 4
      Top = 11
      Width = 702
      Height = 244
      GradientEnd = clSilver
      GradientStart = clGray
      Layout = 'Standard'
    end
  end
end
