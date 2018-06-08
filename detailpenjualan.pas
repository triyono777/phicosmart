unit detailpenjualan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids;

type
  TFdetailpenjualan = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fdetailpenjualan: TFdetailpenjualan;

implementation

uses caribarangpembelian, caribarangpenjualan, databarang, datamodul,
  datapelanggan, datapembelian, datapengguna, datapenjualan, login,
  mainmenu;

{$R *.dfm}

end.
