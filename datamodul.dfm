object DM: TDM
  OldCreateOrder = False
  Left = 271
  Top = 131
  Height = 365
  Width = 678
  object koneksi: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=H:\ku' +
      'liah\delphi\aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\DbPhico' +
      'smart.mdb;Mode=Share Deny None;Persist Security Info=False;Jet O' +
      'LEDB:System database="";Jet OLEDB:Registry Path="";Jet OLEDB:Dat' +
      'abase Password="";Jet OLEDB:Engine Type=5;Jet OLEDB:Database Loc' +
      'king Mode=1;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Global' +
      ' Bulk Transactions=1;Jet OLEDB:New Database Password="";Jet OLED' +
      'B:Create System Database=False;Jet OLEDB:Encrypt Database=False;' +
      'Jet OLEDB:Don'#39't Copy Locale on Compact=False;Jet OLEDB:Compact W' +
      'ithout Replica Repair=False;Jet OLEDB:SFP=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 48
    Top = 40
  end
  object qpengguna: TADOQuery
    Active = True
    Connection = koneksi
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tbpengguna')
    Left = 48
    Top = 112
  end
  object dpengguna: TDataSource
    DataSet = qpengguna
    Left = 48
    Top = 200
  end
  object qbarang: TADOQuery
    Active = True
    Connection = koneksi
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tbbarang')
    Left = 152
    Top = 112
  end
  object dbarang: TDataSource
    DataSet = qbarang
    Left = 152
    Top = 200
  end
  object Q1: TADOQuery
    Active = True
    Connection = koneksi
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tbbarang')
    Left = 152
    Top = 48
  end
  object qpelanggan: TADOQuery
    Active = True
    Connection = koneksi
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tbpelanggan')
    Left = 240
    Top = 112
  end
  object Dpelanggan: TDataSource
    DataSet = qpelanggan
    Left = 240
    Top = 200
  end
  object qdetailpenjualan: TADOQuery
    Active = True
    Connection = koneksi
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_detailpenjualan left join tbbarang on'
      ' tbbarang.kodebarang=tb_detailpenjualan.kodebarang')
    Left = 368
    Top = 112
  end
  object ddetailpenjualan: TDataSource
    DataSet = qdetailpenjualan
    Left = 368
    Top = 200
  end
  object qpenjualan: TADOQuery
    Active = True
    Connection = koneksi
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_penjualan left join tbpelanggan on '
      'tbpelanggan.kodepelanggan=tb_penjualan.kodepelanggan')
    Left = 488
    Top = 112
  end
  object Dpenjualan: TDataSource
    DataSet = qpenjualan
    Left = 488
    Top = 200
  end
end
