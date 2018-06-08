unit login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sSkinProvider, sSkinManager, StdCtrls, sButton, sEdit, sLabel;

type
  TFlogin = class(TForm)
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    sLabel3: TsLabel;
    eusername: TsEdit;
    epassword: TsEdit;
    btnlogin: TsButton;
    btnguest: TsButton;
    sSkinManager1: TsSkinManager;
    sSkinProvider1: TsSkinProvider;
    procedure btnloginClick(Sender: TObject);
    procedure btnguestClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Flogin: TFlogin;

implementation

uses databarang, datamodul, caribarangpembelian, caribarangpenjualan,
  datapelanggan, datapembelian, datapengguna, datapenjualan,
  detailpenjualan, mainmenu;

{$R *.dfm}

procedure TFlogin.btnloginClick(Sender: TObject);
begin
fmainmenu.ShowModal;
end;

procedure TFlogin.btnguestClick(Sender: TObject);
begin
Fdatapenjualan.ShowModal;
end;

end.
