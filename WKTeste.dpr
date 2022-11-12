program WKTeste;

uses
  Vcl.Forms,
  uFrmMain in 'view\uFrmMain.pas' {FrmMain},
  uPedVendas in 'view\uPedVendas.pas' {frmPedVendas},
  uControllerConn in 'controller\uControllerConn.pas',
  uDAOConn in 'dao\uDAOConn.pas',
  uMPedido in 'model\uMPedido.pas',
  uDAOPedido in 'DAO\uDAOPedido.pas',
  uControllerPedido in 'controller\uControllerPedido.pas',
  uMItemPedido in 'model\uMItemPedido.pas',
  uDAOItemPedido in 'DAO\uDAOItemPedido.pas',
  uControllerItemPedido in 'controller\uControllerItemPedido.pas',
  uEnumerador in 'model\uEnumerador.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TfrmPedVendas, frmPedVendas);
  Application.Run;
end.
