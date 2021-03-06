unit datapenjualan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, sButton, StdCtrls, sComboBox, sEdit, Grids, Buttons,
  sBitBtn, sLabel, DBCtrls;

type
  TFdatapenjualan = class(TForm)
    sLabel6: TsLabel;
    sLabel8: TsLabel;
    sLabel9: TsLabel;
    sLabel10: TsLabel;
    btntutup: TsBitBtn;
    bttnbatal: TsBitBtn;
    btntambah: TsBitBtn;
    ebayar: TsEdit;
    ekembalian: TsEdit;
    etotalbayar: TsEdit;
    ckode: TsLabel;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    sLabel3: TsLabel;
    sLabel4: TsLabel;
    sLabel5: TsLabel;
    sLabel11: TsLabel;
    LRp: TsLabel;
    lin: TsLabel;
    tedit1: TsEdit;
    ejumlah: TsEdit;
    Ekodebarang: TsEdit;
    ehargajual: TsEdit;
    esatuan: TsEdit;
    btncari: TsButton;
    enamabarang: TsEdit;
    DateTimePicker1: TDateTimePicker;
    sg: TStringGrid;
    btnsimpan: TsBitBtn;
    cbpelanggan: TsComboBox;
    procedure btncariClick(Sender: TObject);
    procedure btntambahClick(Sender: TObject);
    procedure ejumlahKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ejumlahKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure bttnbatalClick(Sender: TObject);
    procedure ebayarChange(Sender: TObject);
    procedure btnsimpanClick(Sender: TObject);
    procedure btntutupClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
   procedure NoAuto;
   procedure Reset;
   procedure CreateGrid;
  end;

var
  Fdatapenjualan: TFdatapenjualan;

implementation

uses mainmenu, caribarangpembelian, caribarangpenjualan, databarang,
  datamodul, datapelanggan, datapembelian, datapengguna, login, ADODB;

{$R *.dfm}

procedure TFdatapenjualan.btncariClick(Sender: TObject);
begin

if tedit1.Text= '' then
    ShowMessage('silahkan klik tombol "tambah" dahulu')
    else
  begin
    Fcaribarangpenjualan.ShowModal;
  end;
end;

procedure TFdatapenjualan.reset;
var
  i:integer;
begin
  for i := 0 to ComponentCount -1 do
    begin
      if (Components[i] is TEdit) and (TEdit(Components[i]).Tag = 0) then
       Tedit(Components[i]).Text :=''
    end;
    btntambah.Caption:='Tambah';
    Lrp.Caption:='Rp.';
      NoAuto;
end;

procedure Tfdatapenjualan.NoAuto;
var
  kode:String;
  urut:integer;
begin
  with dm.Q1 do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select * from tb_penjualan';
    Open;
  end;
  if dm.Q1.RecordCount = 0 then urut := 1 else
  if dm.Q1.RecordCount > 0 then
  begin
    with Dm.Q1 do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='select max(right(kodepenjualan,5)) as kode from tb_penjualan';
      Open;
    end;
    urut:=dm.Q1.FieldByName('kode').AsInteger +1;
  end;
  kode:=inttostr(urut);
  kode:=Copy('00000'+kode,length('00000'+kode)-4,5);
  tedit1.Text:='PJ.'+kode;
end;
procedure TFdatapenjualan.CreateGrid;
var
  i,j:integer;
begin
  with Sg do
    begin
      for i := 0 to colCount-1 do
        for j := 0 to rowCount-1 do
          Cells[i,j]:='';

      ColCount:=6;
      RowCount:=2;
      Cells[0,0]:='Kode Barang';
      Cells[1,0]:='Nama Barang';
      Cells[2,0]:='Satuan';
      Cells[3,0]:='Harga';
      Cells[4,0]:='Jumlah';
      Cells[5,0]:='Subtotal';
      ColWidths[0]:=200;
      ColWidths[1]:=300;
      ColWidths[2]:=130;
      ColWidths[3]:=100;
      ColWidths[4]:=100;
      ColWidths[5]:=150;
    end;
end;
procedure TFdatapenjualan.btntambahClick(Sender: TObject);
begin
  reset;
  CreateGrid;
  NoAuto;
end;

procedure TFdatapenjualan.ejumlahKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = 13 then
  begin
    if (Ejumlah.Text <> '') and (ejumlah.Text <>'0') then
    begin
      Sg.Cells[0,sg.RowCount -1]:=Ekodebarang.Text;
      Sg.Cells[1,sg.RowCount -1]:=Enamabarang.Text;
      Sg.Cells[2,sg.RowCount -1]:=Esatuan.Text;
      Sg.Cells[3,sg.RowCount -1]:=Ehargajual.Text;
      Sg.Cells[4,sg.RowCount -1]:=Ejumlah.Text;
      Sg.Cells[5,sg.RowCount -1]:=inttostr(strtoint(Ejumlah.Text)* strtoint(Ehargajual.Text));
      sg.RowCount := sg.RowCount +1;
      sg.Row := sg.RowCount -1;
      Lin.Caption:=inttostr(strtoint(Lin.Caption)+(strtoint(Ejumlah.Text)*strtoint(ehargajual.Text)));
      Etotalbayar.Text:=Lin.Caption;
     // reset;
      if MessageDlg('Apakah ingin menambah barang?',mtConfirmation,[mbyes,mbno],0)=mrYes then
      Fcaribarangpenjualan.ShowModal;
    end else
    Showmessage('Jumlah Belum dimasukan');
  end;
end;

procedure TFdatapenjualan.ejumlahKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in['0'..'9',#8,#10,#13]) then
  Key:=#0;
end;

procedure TFdatapenjualan.FormShow(Sender: TObject);
begin
Reset;
  NoAuto;
  CreateGrid;
  cbpelanggan.Clear;
  dm.QPelanggan.First;
  while dm.QPelanggan.Eof = False do
  begin
    cbpelanggan.Items.Add(dm.QPelanggan.FieldByName('namapelanggan').AsString );
    dm.QPelanggan.Next;
  end;
  cbpelanggan.Text:='';
end;

procedure TFdatapenjualan.bttnbatalClick(Sender: TObject);
begin
if messageDLg('Yakin item akan dihapus?',mtConfirmation,[Mbyes,MBno],0)=Mryes then
  begin
    lin.Caption:=inttostr(strtoint(lin.Caption)-strtoint(sg.Cells [5,sg.Row]));
    sg.RowCount := sg.RowCount -1;
  end;
end;
procedure TFdatapenjualan.ebayarChange(Sender: TObject);
begin
  ekembalian.Text:=inttostr(strtoint(ebayar.Text) -  strtoint(etotalbayar.Text));
end;

procedure TFdatapenjualan.btnsimpanClick(Sender: TObject);
var i:integer;
begin
      for i := 1 to sg.RowCount -1 do
        begin
          if sg.Cells[0,i]<>'' then
          begin
            with dm.Q1 do
              begin
              close;
             SQL.Clear;
             sql.Text:= ' insert into tb_detailpenjualan (kodepenjualan,kodebarang,hargajual ,jumlah, subtotal)'+
             'values ("'+tedit1.Text+'","'+sg.Cells[0,i]+'","'+sg.Cells[3,i]+'","'+sg.Cells[4,i]+'","'+sg.Cells[5,i]+'")';
               ExecSQL;

             Close;
            SQL.Clear;
            SQL.Text:='update tbbarang set stok=stok-"'+sg.Cells[4,i]+'" where kodebarang="'+sg.Cells[0,i]+'"';
            ExecSQL;
              end;
          end;
          with dm.Q1 do
          begin
          Close;
          SQL.Clear;
          SQL.Text:='insert into tb_penjualan values("'+tedit1.Text+'","'+FormatDatetime('yyyy-mm-dd',now)+'","'+lin.Caption+'","'
          +cbpelanggan.Text+'","'+fmainmenu.StatusBar1.Panels[0].Text+'")';
          ExecSQL;
          end;
        end;
       Reset;
        NoAuto;
        CreateGrid;
        lin.Caption:='';
end;
procedure TFdatapenjualan.btntutupClick(Sender: TObject);
begin
close;
end;

end.
