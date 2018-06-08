unit datapelanggan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, sEdit, Buttons, sBitBtn, sLabel;

type
  Tfdatapelanggan = class(TForm)
    ckode: TsLabel;
    sLabel1: TsLabel;
    sLabel5: TsLabel;
    sLabel2: TsLabel;
    btnsimpan: TsBitBtn;
    btntutup: TsBitBtn;
    btnhapus: TsBitBtn;
    btntambah: TsBitBtn;
    ekodepelanggan: TsEdit;
    enamapelanggan: TsEdit;
    ealamat: TsEdit;
    enomertelepon: TsEdit;
    DBGrid1: TDBGrid;
    btnubah: TsBitBtn;
    procedure btntambahClick(Sender: TObject);
    procedure btnsimpanClick(Sender: TObject);
    procedure btnubahClick(Sender: TObject);
    procedure enomerteleponKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btnhapusClick(Sender: TObject);
  private
   procedure AutoKode;
   procedure Reset;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fdatapelanggan: Tfdatapelanggan;

implementation

uses datamodul, caribarangpembelian, caribarangpenjualan, databarang,
  datapembelian, datapengguna, datapenjualan, login, mainmenu, DB, ADODB;

{$R *.dfm}

procedure Tfdatapelanggan.btntambahClick(Sender: TObject);
begin
 if btntambah.Caption ='Tambah' then
  begin
    Reset;
    AutoKode;
    btntambah.Caption:='Batal';
  end else
  begin
    Reset;
    AutoKode;
  end;
end;

procedure Tfdatapelanggan.AutoKode;
var
  kode:String;
  urut:integer;
begin
  with dm.Q1 do
  begin
    close;
    SQL.Clear;
    SQL.Text:='select * from tbpelanggan';
    Open;
  end;
  if dm.Q1.RecordCount = 0 then urut :=1 else
  if dm.Q1.RecordCount > 0 then
  Begin
    with dm.Q1 do
    begin
      close;
      SQL.Clear ;
      SQL.Text:= 'select max(right(kodepelanggan,5)) as kode from tbpelanggan';
      open;
    end;
    urut:= DM.Q1.FieldByName('kode').AsInteger +1;
  end;
  kode:=inttostr (urut);
  kode:=copy ('00000' +kode,length('00000'+kode)-4,5);
  Ekodepelanggan.text:='CS.'+kode;
end;

procedure Tfdatapelanggan.Reset;
var
  i:integer;
begin
  for i := 0 to ComponentCount -1 do
    begin
      if Components[i] is TEdit then
       Tedit(Components[i]).Text :=''
    end;
    btntambah.Caption:='Tambah';
    dm.Qpelanggan.Active:=False;
    Dm.Qpelanggan.Active:=True;
end;
procedure Tfdatapelanggan.btnsimpanClick(Sender: TObject);
begin
with dm.qpelanggan do
  begin
    Append;
    FieldByName('kodepelanggan').AsString:=ekodepelanggan.Text;
    FieldByName('namapelanggan').AsString:=enamapelanggan.Text;
    FieldByName('alamat').AsString:=ealamat.Text;
    FieldByName('nomertelepon').AsString:=enomertelepon.Text;
    Post;
    ShowMessage('data "'+dm.Qpelanggan.FieldByName('namapelanggan').AsString+'" berhasil disimpan' ) ;
   end;
    Reset;
    AutoKode;
end;

procedure Tfdatapelanggan.btnubahClick(Sender: TObject);
begin
with dm.qpelanggan do
  begin
    edit;
    FieldByName('kodepelanggan').AsString:=ekodepelanggan.Text;
    FieldByName('namapelanggan').AsString:=enamapelanggan.Text;
    FieldByName('alamat').AsString:=ealamat.Text;
    FieldByName('nomertelepon').AsString:=enomertelepon.Text;
    Post;
    ShowMessage('data "'+dm.Qpelanggan.FieldByName('namapelanggan').AsString+'" berhasil diubah' ) ;
end;
 end;
procedure Tfdatapelanggan.enomerteleponKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in['0'..'9',#13,#8,#10]) then
  key :=#0;
end;

procedure Tfdatapelanggan.DBGrid1CellClick(Column: TColumn);
begin
with dm.qpelanggan do
  begin
ekodepelanggan.Text:=    FieldByName('kodepelanggan').AsString;
enamapelanggan.Text:=    FieldByName('namapelanggan').AsString;
ealamat.Text:=    FieldByName('alamat').AsString;
enomertelepon.Text:=    FieldByName('nomertelepon').AsString;
end;
end;
procedure Tfdatapelanggan.btnhapusClick(Sender: TObject);
begin
if messageDlg('Apakah yakin data "'+
  ''+dm.Qpelanggan.FieldByName('namapelanggan').AsString+'" akan dihapus?',MTConfirmation,[MByes,MBno],0)=mrYes then
  begin
    dm.Qpelanggan.Delete;
    Reset;
    AutoKode;
  end;
end;

end.
