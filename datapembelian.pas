unit datapembelian;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ComCtrls, Buttons, sBitBtn, StdCtrls, sButton, sComboBox,
  sEdit, sLabel;

type
  TFdatapembelian = class(TForm)
    ckode: TsLabel;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    sLabel3: TsLabel;
    sLabel4: TsLabel;
    sLabel5: TsLabel;
    sLabel6: TsLabel;
    sLabel7: TsLabel;
    LRp: TsLabel;
    lin: TsLabel;
    ekodepembelian: TsEdit;
    ejumlah: TsEdit;
    Ekodebarang: TsEdit;
    ehargabeli: TsEdit;
    esatuan: TsEdit;
    cbsupplier: TsComboBox;
    sButton1: TsButton;
    enamabarang: TsEdit;
    sBitBtn2: TsBitBtn;
    sBitBtn4: TsBitBtn;
    bttnbatal: TsBitBtn;
    sBitBtn1: TsBitBtn;
    DateTimePicker1: TDateTimePicker;
    StringGrid1: TStringGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fdatapembelian: TFdatapembelian;

implementation

{$R *.dfm}

end.
