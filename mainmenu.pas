unit mainmenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, Menus, ComCtrls, ToolWin;

type
  Tfmainmenu = class(TForm)
    Umainmenu: TToolBar;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    f1: TMenuItem;
    L1: TMenuItem;
    l2: TMenuItem;
    e1: TMenuItem;
    m1: TMenuItem;
    T1: TMenuItem;
    D3: TMenuItem;
    T2: TMenuItem;
    T3: TMenuItem;
    T4: TMenuItem;
    L3: TMenuItem;
    L4: TMenuItem;
    L6: TMenuItem;
    L7: TMenuItem;
    L8: TMenuItem;
    B1: TMenuItem;
    B2: TMenuItem;
    R1: TMenuItem;
    ImageList1: TImageList;
    d1: TMenuItem;
    ToolButton2: TToolButton;
    procedure L1Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure T1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure D3Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure d1Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure T4Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure T3Click(Sender: TObject);
    procedure L8Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmainmenu: Tfmainmenu;

implementation

uses caribarangpembelian, caribarangpenjualan, databarang, datamodul,
  datapembelian, datapengguna, datapenjualan, login, datapelanggan,
  detailpenjualan;

{$R *.dfm}

procedure Tfmainmenu.L1Click(Sender: TObject);
begin
Flogin.ShowModal;
end;

procedure Tfmainmenu.ToolButton1Click(Sender: TObject);
begin
fdatabarang.ShowModal;
end;

procedure Tfmainmenu.T1Click(Sender: TObject);
begin
fdatabarang.ShowModal;
end;

procedure Tfmainmenu.ToolButton3Click(Sender: TObject);
begin
fdatapengguna.ShowModal;
end;

procedure Tfmainmenu.D3Click(Sender: TObject);
begin
fdatapengguna.ShowModal;
end;

procedure Tfmainmenu.ToolButton2Click(Sender: TObject);
begin
fdatapelanggan.ShowModal;
end;

procedure Tfmainmenu.d1Click(Sender: TObject);
begin
fdatapelanggan.ShowModal;
end;

procedure Tfmainmenu.ToolButton6Click(Sender: TObject);
begin
Fdatapenjualan.ShowModal;
end;

procedure Tfmainmenu.T4Click(Sender: TObject);
begin
Fdatapenjualan.ShowModal;
end;

procedure Tfmainmenu.ToolButton5Click(Sender: TObject);
begin
Fdatapembelian.ShowModal;
end;

procedure Tfmainmenu.T3Click(Sender: TObject);
begin
Fdatapembelian.ShowModal;
end;

procedure Tfmainmenu.L8Click(Sender: TObject);
begin
Fdetailpenjualan.ShowModal;
end;



procedure Tfmainmenu.FormShow(Sender: TObject);
begin
StatusBar1.Panels[0].Text:='guest';
end;

end.
