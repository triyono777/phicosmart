unit caribarangpembelian;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, sEdit, sLabel;

type
  Tfcaribarangpembelian = class(TForm)
    ckode: TsLabel;
    ecari: TsEdit;
    DBGrid1: TDBGrid;
    procedure ecariKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fcaribarangpembelian: Tfcaribarangpembelian;

implementation

uses caribarangpenjualan, databarang, datamodul, datapelanggan,
  datapembelian, datapengguna, datapenjualan, detailpenjualan, login,
  mainmenu;

{$R *.dfm}

procedure Tfcaribarangpembelian.ecariKeyUp(Sender: TObject; var Key: Word;
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

end.
