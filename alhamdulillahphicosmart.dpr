program alhamdulillahphicosmart;

uses
  Forms,
  login in 'login.pas' {Flogin},
  databarang in 'databarang.pas' {fdatabarang},
  datamodul in 'datamodul.pas' {DM: TDataModule},
  datapengguna in 'datapengguna.pas' {fdatapengguna},
  mainmenu in 'mainmenu.pas' {fmainmenu},
  datapembelian in 'datapembelian.pas' {Fdatapembelian},
  datapenjualan in 'datapenjualan.pas' {Fdatapenjualan},
  caribarangpenjualan in 'caribarangpenjualan.pas' {Fcaribarangpenjualan},
  caribarangpembelian in 'caribarangpembelian.pas' {fcaribarangpembelian},
  datapelanggan in 'datapelanggan.pas' {fdatapelanggan},
  detailpenjualan in 'detailpenjualan.pas' {Fdetailpenjualan};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFlogin, Flogin);
  Application.CreateForm(Tfmainmenu, fmainmenu);
  Application.CreateForm(Tfdatabarang, fdatabarang);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(Tfdatapengguna, fdatapengguna);
  Application.CreateForm(TFdatapembelian, Fdatapembelian);
  Application.CreateForm(TFdatapenjualan, Fdatapenjualan);
  Application.CreateForm(TFcaribarangpenjualan, Fcaribarangpenjualan);
  Application.CreateForm(Tfcaribarangpembelian, fcaribarangpembelian);
  Application.CreateForm(Tfdatapelanggan, fdatapelanggan);
  Application.CreateForm(TFdetailpenjualan, Fdetailpenjualan);
  Application.Run;
end.
