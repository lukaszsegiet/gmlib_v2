object MainFrm: TMainFrm
  Left = 0
  Top = 0
  Caption = 'MegaDemo GMLib'
  ClientHeight = 370
  ClientWidth = 627
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    627
    370)
  PixelsPerInch = 96
  TextHeight = 13
  object WebBrowser1: TWebBrowser
    Left = 3
    Top = 43
    Width = 616
    Height = 319
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    ControlData = {
      4C000000AA3F0000F82000000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'De/Activate'
    TabOrder = 1
    OnClick = Button1Click
  end
  object GMMap1: TGMMap
    MapOptions.MapTypeControlOptions.Position = cpTOP_LEFT
    MapOptions.Styles = <
      item
        Name = 'TGMMapTypeStyle'
        Stylers = <
          item
            Name = 'TGMMapTypeStyler'
            Gamma = 1.000000000000000000
          end
          item
            Name = 'TGMMapTypeStyler'
            Gamma = 1.000000000000000000
          end>
      end
      item
        Name = 'TGMMapTypeStyle'
        Stylers = <
          item
            Name = 'TGMMapTypeStyler'
            Gamma = 1.000000000000000000
          end
          item
            Name = 'TGMMapTypeStyler'
            Gamma = 1.000000000000000000
          end
          item
            Name = 'TGMMapTypeStyler'
            Gamma = 1.000000000000000000
          end>
      end>
    WebBrowser = WebBrowser1
    Left = 200
    Top = 104
  end
end
