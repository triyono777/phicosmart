unit caribarangpenjualan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, sEdit, sLabel;

type
  TFcaribarangpenjualan = class(TForm)
    ckode: TsLabel;
    ecari: TsEdit;
    DBGrid1: TDBGrid;
    procedure ecariKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fcaribarangpenjualan: TFcaribarangpenjualan;

implementation

uses datamodul, caribarangpembelian, databarang, datapelanggan,
  datapembelian, datapengguna, datapenjualan, login, mainmenu;

{$R *.dfm}

procedure TFcaribarangpenjualan.ecariKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
with Dm.QBarang do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select * from tbbarang where namabarang like"%'+ecari.Text+'%"';
    Open;
  end;
end;

procedure TFcaribarangpenjualan.DBGrid1DblClick(Sender: TObject);
begin
with Fdatapenjualan do
  begin
      Ekodebarang.Text:=dm.QBarang.FieldValues['kodebarang'];
      Enamabarang.Text:=dm.QBarang.FieldValues['namabarang'];
      Esatuan.Text:=dm.QBarang.FieldValues['satuan'];
      Ehargajual.Text:=dm.QBarang.FieldValues['hargajual'];
      Fcaribarangpenjualan.Close;
      Ejumlah.SetFocus ;
  end;
end;
end.
