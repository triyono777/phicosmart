unit datapengguna;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, sBitBtn, sEdit, sLabel;

type
  Tfdatapengguna = class(TForm)
    ckode: TsLabel;
    sLabel1: TsLabel;
    sLabel5: TsLabel;
    sLabel2: TsLabel;
    ekodepengguna: TsEdit;
    enamapengguna: TsEdit;
    Epassword: TsEdit;
    enomertelepon: TsEdit;
    btnsimpan: TsBitBtn;
    btntutup: TsBitBtn;
    btnhapus: TsBitBtn;
    btntambah: TsBitBtn;
    btnubah: TsBitBtn;
    DBGrid1: TDBGrid;
    procedure btntambahClick(Sender: TObject);
    procedure btnsimpanClick(Sender: TObject);
    procedure btntutupClick(Sender: TObject);
    procedure btnubahClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btnhapusClick(Sender: TObject);
  private
    { Private declarations }
  procedure AutoNumber;
  procedure Reset;
  public
    { Public declarations }
  end;

var
  fdatapengguna: Tfdatapengguna;

implementation

uses caribarangpembelian, caribarangpenjualan, databarang, datamodul,
  datapelanggan, datapembelian, datapenjualan, detailpenjualan, login,
  mainmenu;

{$R *.dfm}

procedure TFDataPengguna.AutoNumber;
var
  kode:String;
  urut:integer;
begin
  with dm.Q1 do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select * from tbpengguna';
    Open;
  end;
  if dm.Q1.RecordCount = 0 then urut :=1 else
  if dm.Q1.RecordCount > 0 then
  begin
    with Dm.Q1 do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='select max(right(kodepengguna,5)) as kode from tbpengguna';
      Open;
    end;
    urut:=dm.Q1.FieldByName('kode').AsInteger +1;
  end;
  kode:=inttostr(urut);
  kode:=Copy('00000'+kode,length('00000'+kode)-4,5);
  Ekodepengguna.Text:='US.'+kode;
end;

procedure TFDataPengguna.Reset;
var
  i:integer;
begin
  for i := 0 to ComponentCount -1 do
    begin
      if Components[i] is TEdit then
       Tedit(Components[i]).Text :=''
    end;
    btntambah.Caption:='Tambah';
end;
procedure Tfdatapengguna.btntambahClick(Sender: TObject);
begin
if btntambah.Caption ='Tambah' then
  begin
    Reset;
    AutoNumber;
    btntambah.Caption:='Batal';
  end else
  begin
    Reset;
    AutoNumber;
  end;
end;

procedure Tfdatapengguna.btnsimpanClick(Sender: TObject);
begin
    with dm.QPengguna do
    begin
      Append;
      FieldByName('kodepengguna').AsString:=Ekodepengguna.Text;
      FieldByName('namapengguna').AsString:=Enamapengguna.Text;
      FieldByName('notelepon').AsString:=eNomertelepon.Text;
      FieldByName('password').AsString:=Epassword.text;
      Post;
    end;
    Reset;
    AutoNumber;
  end;


procedure Tfdatapengguna.btntutupClick(Sender: TObject);
begin
close;
end;

procedure Tfdatapengguna.btnubahClick(Sender: TObject);
begin
    with dm.QPengguna do
    begin
      Edit;
      FieldByName('kodepengguna').AsString:=Ekodepengguna.Text;
      FieldByName('namapengguna').AsString:=Enamapengguna.Text;
      FieldByName('notelepon').AsString:=Enomertelepon.Text;
      FieldByName('password').AsString:=Epassword.text;
      Post;
    end;
    Reset;
    AutoNumber;
end;

procedure Tfdatapengguna.DBGrid1CellClick(Column: TColumn);
begin
EKodepengguna.Text:=dm.QPengguna.FieldByName('kodepengguna').AsString;
  Enamapengguna.Text:=dm.QPengguna.FieldByName('namapengguna').AsString;
  Enomertelepon.Text:=dm.QPengguna.FieldByName('notelepon').AsString;
  Epassword.text:=dm.qpengguna.FieldByName('password').AsString;
end;

procedure Tfdatapengguna.btnhapusClick(Sender: TObject);
begin
 if messageDlg('Apakah yakin data " '+
  ''+dm.QPengguna.FieldByName('namapengguna').AsString+' " akan dihapus?',MTConfirmation,[MByes,MBno],0)=mrYes then
  begin
    dm.QPengguna.Delete;
    Reset;
    AutoNumber;
  end;
end;

end.
