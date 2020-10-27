object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 613
  ClientWidth = 951
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Chart1: TChart
    Left = 0
    Top = 0
    Width = 929
    Height = 597
    PrintProportional = False
    Title.Text.Strings = (
      'TChart')
    ClipPoints = False
    View3D = False
    View3DOptions.Orthogonal = False
    TabOrder = 0
    DefaultCanvas = 'TGDIPlusCanvas'
    PrintMargins = (
      0
      0
      2
      0)
    ColorPaletteIndex = 13
    object Series1: TBarSeries
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
      Data = {
        06060000000000000000C4884000000020FF02000000776500000000008C8940
        00FF4000FF00000000000000000000374000000020FF000000000000000000BC
        8B4000000020FF000000000000000000348C4000FF4000FF0000000000000000
        00888D4000000020FF00000000}
    end
  end
  object TeeGDIPlus1: TTeeGDIPlus
    Left = 696
    Top = 88
  end
end
