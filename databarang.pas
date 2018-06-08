unit databarang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, sBitBtn, sComboBox, sEdit,
  sLabel, ExtCtrls;

type
  Tfdatabarang = class(TForm)
    ckode: TsLabel;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    sLabel3: TsLabel;
    sLabel4: TsLabel;
    sLabel5: TsLabel;
    Ekodebarang: TsEdit;
    Enamabarang: TsEdit;
    Ehargajual: TsEdit;
    Estok: TsEdit;
    Ehargabeli: TsEdit;
    cmbsatuan: TsComboBox;
    btnsimpan: TsBitBtn;
    btntutup: TsBitBtn;
    btnhapus: TsBitBtn;
    DBGrid1: TDBGrid;
    btntambah: TsBitBtn;
    btnubah: TsBitBtn;
    Panel1: TPanel;
    procedure btntambahClick(Sender: TObject);
    procedure btnsimpanClick(Sender: TObject);
    procedure EhargabeliKeyPress(Sender: TObject; var Key: Char);
    procedure EhargajualKeyPress(Sender: TObject; var Key: Char);
    procedure EstokKeyPress(Sender: TObject; var Key: Char);
    procedure btnubahClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btnhapusClick(Sender: TObject);
    procedure btntutupClick(Sender: TObject);
  private
   procedure AutoKode;
   procedure Reset;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fdatabarang: Tfdatabarang;

implementation

uses datamodul;

{$R *.dfm}

procedure TFDataBarang.AutoKode;
var
  kode:String;
  urut:integer;
begin
  with dm.Q1 do
  begin
    close;
    SQL.Clear;
    SQL.Text:='select * from tbbarang';
    Open;
  end;
  if dm.Q1.RecordCount = 0 then urut :=1 else
  if dm.Q1.RecordCount > 0 then
  Begin
    with dm.Q1 do
    begin
      close;
      SQL.Clear ;
      SQL.Text:= 'select max(right(kodebarang,5)) as kode from tbbarang';
      open;
    end;
    urut:= DM.Q1.FieldByName('kode').AsInteger +1;
  end;
  kode:=inttostr (urut);
  kode:=copy ('00000' +kode,length('00000'+kode)-4,5);
  Ekodebarang.text:='BR.'+kode;
end;

procedure TFDataBarang.Reset;
var
  i:integer;
begin
  for i := 0 to ComponentCount -1 do
    begin
      if Components[i] is TEdit then
       Tedit(Components[i]).Text :=''
    end;
    cmbsatuan.Text:='';
    btntambah.Caption:='Tambah';
    dm.QBarang.Active:=False;
    Dm.QBarang.Active:=True;
end;

procedure Tfdatabarang.btntambahClick(Sender: TObject);
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

procedure Tfdatabarang.btnsimpanClick(Sender: TObject);
begin
with dm.QBarang do
    begin
      Append;
      FieldByName('kodebarang').AsString:=ekodebarang.Text;
      FieldByName('namabarang').AsString:=Enamabarang.Text;
      FieldByName('satuan').AsString:=cmbsatuan.Text;
      FieldByName('hargabeli').AsInteger:=Strtoint(Ehargabeli.text);
      FieldByName('hargajual').AsInteger :=Strtoint(Ehargajual.Text);
      FieldByName('stok').AsInteger :=Strtoint(estok.Text);
      Post;
      ShowMessage('data "'+dm.Qbarang.FieldByName('namabarang').AsString+'" berhasil disimpan' ) ;
    end;
    Reset;
    AutoKode;
end;

procedure Tfdatabarang.EhargabeliKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in['0'..'9',#13,#8,#10]) then
  key :=#0;
end;

procedure Tfdatabarang.EhargajualKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in['0'..'9',#13,#8,#10]) then
  key :=#0;
end;

procedure Tfdatabarang.EstokKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in['0'..'9',#13,#8,#10]) then
  key :=#0;
end;

procedure Tfdatabarang.btnubahClick(Sender: TObject);
begin
with dm.QBarang do
    begin
      edit;
      FieldByName('kodebarang').AsString:=ekodebarang.Text;
      FieldByName('namabarang').AsString:=Enamabarang.Text;
      FieldByName('satuan').AsString:=cmbsatuan.Text;
      FieldByName('hargabeli').AsInteger:=Strtoint(Ehargabeli.text);
      FieldByName('hargajual').AsInteger :=Strtoint(Ehargajual.Text);
      FieldByName('stok').AsInteger :=Strtoint(estok.Text);
      Post;
      ShowMessage('data "'+dm.Qbarang.FieldByName('namabarang').AsString+'" berhasil diubah' ) ;
end;
end;
procedure Tfdatabarang.DBGrid1CellClick(Column: TColumn);
begin
with dm.QBarang do
    begin
ekodebarang.Text:=  FieldByName('kodebarang').AsString;
Enamabarang.Text:=  FieldByName('namabarang').AsString;
cmbsatuan.Text:=    FieldByName('satuan').AsString;
Ehargabeli.text:= FieldByName('hargabeli').AsString;
Ehargajual.Text:=      FieldByName('hargajual').AsString ;
estok.Text:=      FieldByName('stok').AsString ;
end;
end;
procedure Tfdatabarang.btnhapusClick(Sender: TObject);
begin
if messageDlg('Apakah yakin data "'+
  ''+dm.Qbarang.FieldByName('namabarang').AsString+'" akan dihapus?',MTConfirmation,[MByes,MBno],0)=mrYes then
  begin
    dm.Qbarang.Delete;
    Reset;
    AutoKode;
  end;
end;

procedure Tfdatabarang.btntutupClick(Sender: TObject);
begin
close;
end;

end.
