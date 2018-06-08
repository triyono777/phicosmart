object fcaribarangpembelian: Tfcaribarangpembelian
  Left = 453
  Top = 175
  Width = 1088
  Height = 563
  Caption = 'fcaribarangpembelian'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ckode: TsLabel
    Left = 88
    Top = 32
    Width = 125
    Height = 22
    AutoSize = False
    Caption = 'Nama Barang'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial Rounded MT Bold'
    Font.Style = []
  end
  object ecari: TsEdit
    Left = 248
    Top = 32
    Width = 241
    Height = 21
    TabOrder = 0
    OnKeyUp = ecariKeyUp
  end
  object DBGrid1: TDBGrid
    Left = 96
    Top = 80
    Width = 393
    Height = 281
    DataSource = DM.dbarang
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
end
