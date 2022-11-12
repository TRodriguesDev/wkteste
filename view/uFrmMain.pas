unit uFrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  Vcl.Buttons, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.NumberBox, Vcl.Mask, uControllerConn, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, Vcl.DBCtrls;

type
  TFrmMain = class(TForm)
    PctPedidos: TPageControl;
    TabListaPeds: TTabSheet;
    Pedido: TTabSheet;
    pnlRegPeds: TPanel;
    pnlResumo: TPanel;
    btnSalvar: TSpeedButton;
    btnExcluir: TSpeedButton;
    pnlAddItem: TPanel;
    DBGItens: TDBGrid;
    Panel1: TPanel;
    lblTotal: TLabel;
    Panel2: TPanel;
    lblQtd: TLabel;
    Label3: TLabel;
    label4: TLabel;
    Label1: TLabel;
    mskDataHora: TMaskEdit;
    Label2: TLabel;
    Label5: TLabel;
    edtCliente: TNumberBox;
    edtNumProd: TNumberBox;
    Label6: TLabel;
    edtQuant: TNumberBox;
    Label7: TLabel;
    edtValUnit: TNumberBox;
    Label8: TLabel;
    edtValTotal: TNumberBox;
    Label9: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    btnAddItem: TSpeedButton;
    btnDelItem: TSpeedButton;
    DSItens: TDataSource;
    FDMemTabItens: TFDMemTable;
    FDMemTabItensCODPROD_ITEM: TIntegerField;
    FDMemTabItensDESCR_PROD: TStringField;
    edtNumPedido: TNumberBox;
    btnPesq: TSpeedButton;
    pnlRodLista: TPanel;
    DBGPeds: TDBGrid;
    SpeedButton1: TSpeedButton;
    DSTabPeds: TDataSource;
    FDMemTabPeds: TFDMemTable;
    Panel5: TPanel;
    lblTotPeds: TLabel;
    Label11: TLabel;
    FDMemTabCliente: TFDMemTable;
    DSCliente: TDataSource;
    FDMemTabProds: TFDMemTable;
    DSProds: TDataSource;
    cbNomCli: TDBLookupComboBox;
    cbNomProd: TDBLookupComboBox;
    FDMemTabClienteIDCLIENTE: TIntegerField;
    FDMemTabClienteNOME_CLI: TStringField;
    FDMemTabProdsIDPRODUTO: TIntegerField;
    FDMemTabProdsDESCR_PROD: TStringField;
    FDMemTabProdsPVENDA_PROD: TBCDField;
    FDMemTabItensIDITEM: TIntegerField;
    FDMemTabItensNUMPED_ITEM: TIntegerField;
    FDMemTabItensQTD_ITEM: TBCDField;
    FDMemTabItensVLUNIT_ITEM: TBCDField;
    FDMemTabItensVLTOT_ITEM: TBCDField;
    FDMemTabItensSIT_ITEM: TStringField;
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtQuantChange(Sender: TObject);
    procedure btnAddItemClick(Sender: TObject);
    procedure btnDelItemClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtNumProdExit(Sender: TObject);
    procedure edtNumPedidoExit(Sender: TObject);
    procedure edtValTotalKeyPress(Sender: TObject; var Key: Char);
    procedure btnExcluirClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure cbNomProdExit(Sender: TObject);
    procedure cbNomCliExit(Sender: TObject);
    procedure edtClienteExit(Sender: TObject);
    procedure btnPesqClick(Sender: TObject);
  private
    procedure validaReg;
    procedure ValidaItens;
    procedure addItem;
    procedure altItem(Id : Integer);
    procedure delItem(Id : Integer);
    procedure limpaCamposItem;
    procedure limpaCamposReg;
    procedure limpaTabTemps;
    procedure carregaitens;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;
  vVlTotal  : Double = 0;
  vTotItens : Double = 0;
  vNItem    : Integer = 0;
  vNewreg   : Boolean = True;

implementation


{$R *.dfm}

uses uMPedido, uEnumerador, uControllerPedido, uControllerItemPedido;

//Inclui Produtos na MemoTable
procedure TFrmMain.addItem;
begin
  if FDMemTabItens.Active = False then  FDMemTabItens.Active := True;

  FDMemTabItens.Append;
  FDMemTabItens.FieldByName('SIT_ITEM').Asstring        := 'I';
  FDMemTabItens.FieldByName('IDITEM').AsInteger         := 0;
  FDMemTabItens.FieldByName('CODPROD_ITEM').AsInteger   := strtoint(edtNumProd.Text);
  FDMemTabItens.FieldByName('DESCR_PROD').AsString      := cbNomProd.Text;
  FDMemTabItens.FieldByName('QTD_ITEM').AsFloat         := edtQuant.Value;
  FDMemTabItens.FieldByName('VLUNIT_ITEM').AsFloat      := edtValUnit.Value;
  FDMemTabItens.FieldByName('VLTOT_ITEM').AsFloat       := edtValTotal.Value;
  FDMemTabItens.Post;

  btnDelItem.Enabled := FDMemTabItens.RecordCount > 0;

  vVlTotal := vVlTotal  + edtValTotal.Value;
  vTotItens:= FDMemTabItens.RecordCount;
end;

//Exclui Produtos na MemoTable
procedure TFrmMain.delItem(id: Integer);
begin
  if MessageBox(application.Handle,'Tem Certeza que deseja excluir o Produto?','EXCLUIR',mb_yesno+MB_ICONQUESTION+MB_SYSTEMMODAL) = mryes then
  Begin
    vVlTotal  := vVlTotal - FDMemTabItens.FieldByName('VLTOT_ITEM').AsFloat;

    if id > 0 then
    begin
      FDMemTabItens.edit;
      FDMemTabItens.FieldByName('SIT_ITEM').AsString := 'D';
      FDMemTabItens.Post;
    end
    else
     FDMemTabItens.Delete;

    vTotItens := FDMemTabItens.RecordCount;
  End;
end;

procedure TFrmMain.altItem(Id: Integer);
begin
  //If FDMemTabItens.Locate('IDITEM',id,[]) then
  //begin
  vVlTotal := vVlTotal  - FDMemTabItens.FieldByName('VLTOT_ITEM').AsFloat;


  FDMemTabItens.Edit;
  FDMemTabItens.FieldByName('QTD_ITEM').AsFloat    := edtQuant.Value;
  FDMemTabItens.FieldByName('VLUNIT_ITEM').AsFloat := edtValUnit.Value;
  FDMemTabItens.FieldByName('VLTOT_ITEM').AsFloat  := edtValTotal.Value;
  if id > 0 then
    FDMemTabItens.FieldByName('SIT_ITEM').AsString   := 'E';
  FDMemTabItens.Post;

  vVlTotal := vVlTotal  + edtValTotal.Value;
  vTotItens:= FDMemTabItens.RecordCount;
end;

procedure TFrmMain.btnAddItemClick(Sender: TObject);
begin
  if (edtNumProd.Value > 0) and (cbNomProd.KeyValue  > 0) and (edtValUnit.Value > 0) then
  begin
    if vNItem = 0 then
      addItem
    else
      altItem(vNItem);

    vNItem := 0;
    limpaCamposItem;
    edtNumProd.SetFocus;
  end
  else
    messagebox(application.Handle,'Por favor, preeencha todos os campos!','ITENS PEDIDO',mb_ok+MB_SYSTEMMODAL);
end;

procedure TFrmMain.btnDelItemClick(Sender: TObject);
begin
  //delItem(vNItem);
  if FDMemTabItens.FieldByName('SIT_ITEM').Asstring <> 'D' then
    delItem(FDMemTabItens.FieldByName('IDITEM').AsInteger);
  vNItem := 0;
  limpaCamposItem;
end;

procedure TFrmMain.btnExcluirClick(Sender: TObject);
Var
  controllerpedido  : TControllerPedido;
begin
  controllerpedido := TControllerPedido.Create;
  try
    controllerpedido.MPedido.Enumtp := uEnumerador.tpExcluir;
    controllerpedido.MPedido.IDPedido := strtoint(edtNumPedido.Text);

    if controllerpedido.persistir then
      messagebox(application.Handle,'Pedido excluido com sucesso!', 'SUCESSO', mb_ok+MB_SYSTEMMODAL)
    else
      messagebox(application.Handle,'Falha ao tentar excluir o Pedido!', 'ERRO', mb_ok+MB_SYSTEMMODAL);
    limpaTabTemps;
  finally
    freeandnil(controllerpedido);
  end;
end;

procedure TFrmMain.btnPesqClick(Sender: TObject);
Var
  ControllerPedido    : TControllerPedido;
  controllerItensPed  : TControllerItemPedido;
  qryPedidos          : TFDQuery;
  qryItensPed         : TFDQuery;
begin
  controllerPedido  := TControllerPedido.Create;
  controllerItensPed:= TControllerItemPedido.Create;
  qryPedidos        := TFDQuery.Create(nil);
  qryItensPed       := TFDQuery.Create(nil);

  try
    qryPedidos    := ControllerPedido.selecionar(strtoint(edtNumPedido.Text));
    try
      if qryPedidos.RecordCount > 0 then
      Begin
        mskDataHora.Text  := FormatDateTime('dd:mm:yyyy hh:mm:ss',qryPedidos.FieldByName('DTE_PED').AsDateTime);
        edtCliente.Value  := qryPedidos.FieldByName('CLI_PED').AsInteger;
        cbNomCli.KeyValue := edtCliente.Value;
        vVlTotal          := qryPedidos.FieldByName('VLTOT_PED').AsFloat;
        vNewreg           := False;
        pnlAddItem.Enabled:= True;
        qryItensPed    := ControllerItensPed.selecionar(strtoint(edtNumPedido.Text));
        try
          qryItensPed.FetchAll;
          FDMemTabItens.Close;
          FDMemTabItens.Data    := qryItensPed.Data;
          vTotItens             := FDMemTabItens.RecordCount;
          btnExcluir.Visible    := True;
          btnExcluir.Enabled    := True;
          btnSalvar.Visible     := True;
          btnSalvar.Enabled     := True;
          limpaCamposItem;

        finally
          qryItensPed.close;
          Freeandnil(qryItensPed);
        end;
      end
      else begin
        vNewreg := True;
        pnlAddItem.Enabled:= False;
        limpaCamposReg;
        limpaCamposItem;
        limpaTabTemps;
      end;
    finally
      qryPedidos.Close;
      Freeandnil(qryPedidos);
      FreeAndNil(controllerItensPed);
    end;
  finally
    FreeAndNil(controllerPedido);
  end;

end;

procedure TFrmMain.btnSalvarClick(Sender: TObject);
Var
  controllerpedido  : TControllerPedido;
  controllerItem    : TControllerItemPedido;
  vGravoureg        : Boolean;
  vGravouItem       : Boolean;
  vNumPedido        : Integer;

  procedure gravadadosgeraispedidos;
  begin
    controllerpedido := TControllerPedido.Create;
    try
      controllerpedido.MPedido.Enumtp := uEnumerador.tpIncluir;
      controllerpedido.MPedido.Dte_Ped := now;
      controllerpedido.MPedido.Cli_Ped := strtoint(edtCliente.Text);

      if controllerpedido.persistir then
      begin
        vGravoureg := True;
        vNumPedido := controllerpedido.MPedido.IDPedido;
        //messagebox(application.Handle,'Por favor, preeencha todos os campos!','PEDIDO',mb_ok+MB_SYSTEMMODAL);
      end
      else begin
        vGravoureg := False;
      end;

    finally
      freeandnil(controllerpedido);
    end;
  end;

  procedure gravaprodutosdopedido(tp: string);
  begin
    controllerItem := TControllerItemPedido.Create;
    try
      if tp = 'I' then
        controllerItem.MItemPedido.Enumtp       := uEnumerador.tpIncluir
      else If tp = 'E' then
        controllerItem.MItemPedido.Enumtp       := uEnumerador.tpAlterar
      else If tp = 'D' then
        controllerItem.MItemPedido.Enumtp       := uEnumerador.tpExcluir
      else
        controllerItem.MItemPedido.Enumtp       := uEnumerador.tpNada;

      controllerItem.MItemPedido.IDItem       := FDMemTabItens.fieldbyname('IDITEM').AsInteger;;
      controllerItem.MItemPedido.NumPed_Item  := vNumPedido;
      controllerItem.MItemPedido.CodProd_Item := FDMemTabItens.fieldbyname('CODPROD_ITEM').AsInteger;
      controllerItem.MItemPedido.QtdProd_Item := FDMemTabItens.fieldbyname('QTD_ITEM').Asfloat;
      controllerItem.MItemPedido.VlUnit_Item  := FDMemTabItens.fieldbyname('VLUNIT_ITEM').Asfloat;
      controllerItem.MItemPedido.Vltot_Item   := FDMemTabItens.fieldbyname('VLTOT_ITEM').Asfloat;

    finally
      if controllerItem.persistir then
        vGravouItem := True
      else
        vGravouItem := False;
    end;
  end;

begin
  if vNewreg = False then
  begin
    vGravoureg := True;
    vNumPedido := strtoint(edtNumPedido.Text);
  end
  else
    gravadadosgeraispedidos;

  if vGravoureg then
  begin
    FDMemTabItens.First;

    while not(FDMemTabItens.eof) do
    begin
      gravaprodutosdopedido(FDMemTabItens.fieldbyname('SIT_ITEM').AsString);
      if vGravouItem then
      begin
        FDMemTabItens.next;
      end
      else begin
        messagebox(application.Handle,Pchar('Ocorreu um erro ao tentar gravar ' + FDMemTabItens.FieldByName('NomProd').asstring), 'ERRO', mb_ok+MB_SYSTEMMODAL);
        break;
      end;
    end;
    messagebox(application.Handle,'Pedido gravado com sucesso!', 'SUCESSO', mb_ok+MB_SYSTEMMODAL);
    limpaTabTemps;
  end;
end;

procedure TFrmMain.carregaitens;
begin
  vNItem            := FDMemTabItens.FieldByName('IDITEM').AsInteger;
  if vNItem = 0 then vNItem := -1;
  edtNumProd.Value  := FDMemTabItens.FieldByName('CODPROD_ITEM').AsInteger;
  edtQuant.Value    := FDMemTabItens.FieldByName('QTD_ITEM').AsFloat;
  edtValUnit.Value  := FDMemTabItens.FieldByName('VLUNIT_ITEM').AsFloat;
  edtValTotal.Value := FDMemTabItens.FieldByName('VLTOT_ITEM').AsFloat;
end;

procedure TFrmMain.cbNomCliExit(Sender: TObject);
begin
  edtCliente.Value := cbNomCli.KeyValue;
end;

procedure TFrmMain.cbNomProdExit(Sender: TObject);
begin
  edtNumProd.value := cbNomProd.KeyValue;
  edtValUnit.Value := FDMemTabProds.FieldByName('PVENDA_PROD').AsFloat;
end;

procedure TFrmMain.edtClienteExit(Sender: TObject);
begin
  if edtCliente.Value > 0 then
  Begin
    cbNomCli.KeyValue := edtCliente.Value;

    If trim(cbNomCli.Text) = '' then
    Begin
      messagebox(application.Handle,'Cliente não encontrado', 'CLIENTE', mb_ok+MB_SYSTEMMODAL);
      edtCliente.SetFocus;
    end;


    btnPesq.Visible := False;
    btnPesq.Enabled := False;

    btnExcluir.Visible := False;
    btnExcluir.Enabled := False;
    //btnExcluir.Visible := False;

  end
  else begin
    if Trim(edtCliente.Text) = '' then
    begin
      btnPesq.Enabled := True;
      btnPesq.Visible := True;


      //btnExcluir.Visible := False;
    end

  end;

  validaReg;

end;

procedure TFrmMain.edtNumPedidoExit(Sender: TObject);
begin
  if edtNumPedido.Value > 0 then
  Begin
    edtCliente.Text := '' ;
    edtCliente.SetFocus;
    //btnSalvar.Enabled := False;
  end;

  validaReg;
end;

procedure TFrmMain.edtNumProdExit(Sender: TObject);
begin
  cbNomProd.KeyValue := edtNumProd.value;
  If trim(cbNomProd.Text) = '' then
  Begin
    messagebox(application.Handle,'Produto não encontrado', 'PRODUTO', mb_ok+MB_SYSTEMMODAL);
    edtNumProd.SetFocus;
  end;

  ValidaItens;
end;

procedure TFrmMain.edtQuantChange(Sender: TObject);
begin
  if (edtQuant.Text <> '') and (edtValUnit.Text <> '') then
    edtValTotal.Value := edtQuant.Value * edtValUnit.Value;
end;

procedure TFrmMain.edtValTotalKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TFrmMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_DELETE :
    Begin
      //If btnAddItem.Enabled then btnAddItem.click;
      if ((btndelItem.Enabled) and (DBGItens.Focused)) then btnDelItem.click;

    End;
    VK_RETURN :
    Begin
      If ((btnAddItem.Enabled) and not(DBGItens.Focused)) then btnAddItem.click;
      if  DBGItens.Focused then
      begin
        carregaitens;

        edtQuant.SetFocus;
        edtNumProd.Enabled := False;
        cbNomProd.Enabled  := False;
      end;
    End;
  end;
end;

procedure TFrmMain.FormShow(Sender: TObject);
Var
  ControllerPedido    : TControllerPedido;
  qryProdutos         : TFDQuery;
  qryClientes         : TFDQuery;

begin
  Try
    TControllerConn.getInstance().daoConn.getConexao.Connected := True;

    If TControllerConn.getInstance().daoConn.getConexao.Connected then
    else begin
      messagebox(application.Handle,'Impossivel Conectar ao Banco', 'Erro Banco', mb_ok+MB_SYSTEMMODAL);
      Application.Terminate;
    end;

  except on e:exception do
    begin
      messagebox(application.Handle,'Erro Banco',Pchar('Impossivel Conectar ao Banco' + e.message),mb_ok+MB_SYSTEMMODAL);
      Application.Terminate;
    end;

  End;

  PctPedidos.TabIndex := 0;

  btnPesq.Visible       := False;
  btnPesq.Enabled       := False;

  btnExcluir.Visible    := False;
  btnExcluir.Enabled    := False;
  btnSalvar.Visible     := False;
  btnSalvar.Enabled     := False;


  {
  }

  controllerPedido  := TControllerPedido.Create;
  qryProdutos       := TFDQuery.Create(nil);
  qryClientes       := TFDQuery.Create(nil);
  try
    qryProdutos    := ControllerPedido.selecionaProdutos;
    qryClientes    := ControllerPedido.selecionaCliente;
    try

      qryClientes.Fetchall;
      FDMemTabCliente.Close;
      FDMemTabCliente.Data := qryClientes.Data;

      qryProdutos.FetchAll;
      FDMemTabProds.Close;
      FDMemTabProds.Data := qryProdutos.Data;
      //FDMemTabPeds.Close;
    finally
      qryProdutos.Close;
      qryClientes.Close;
      Freeandnil(qryProdutos);
      Freeandnil(qryClientes);
    end;
  finally
    FreeAndNil(controllerPedido);
  end;



end;

procedure TFrmMain.limpaCamposItem;
begin
  edtNumProd.Value  := 0;
  cbNomProd.KeyValue:= 0;
  edtQuant.Value    := 0;
  edtValUnit.Value  := 0;
  edtValTotal.Value := 0;
  lblQtd.Caption  := floattostr(vTotItens);
  lblTotal.Caption:= formatfloat('0.00,', vVlTotal);


  btnAddItem.Enabled  := False;
  edtNumProd.Enabled  := True;
  cbNomProd.Enabled   := True;
  btnSalvar.Enabled   := FDMemTabItens.RecordCount > 0;
  btnSalvar.Visible   := FDMemTabItens.RecordCount > 0;

  btnDelItem.Enabled  := FDMemTabItens.RecordCount > 0;
end;

procedure TFrmMain.limpaCamposReg;
begin
  edtNumPedido.value  := 0;
  mskDataHora.Text    := '';
  edtCliente.Value    := 0;
  cbNomCli.KeyValue   := 0;
  vVlTotal            := 0;
  vTotItens           := 0;
  btnSalvar.Visible   := False;
  btnExcluir.Visible  := False;
  btnAddItem.Enabled  := False;
  btnExcluir.Enabled  := False;
end;

procedure TFrmMain.limpaTabTemps;
begin
  FDMemTabItens.close;
  limpaCamposReg;
  limpaCamposItem;
end;

procedure TFrmMain.SpeedButton1Click(Sender: TObject);
Var
  ControllerPedido    : TControllerPedido;
  qryPedidos          : TFDQuery;
begin
  controllerPedido  := TControllerPedido.Create;
  qryPedidos        := TFDQuery.Create(nil);
  try
    qryPedidos    := ControllerPedido.selecionar(0);
    try
      qryPedidos.FetchAll;
      FDMemTabPeds.Close;
      FDMemTabPeds.Data := qryPedidos.Data;
      lblTotPeds.Caption := inttostr(qryPedidos.RecordCount);
      //FDMemTabPeds.Close;
    finally
      qryPedidos.Close;
      Freeandnil(qryPedidos);
    end;
  finally
    FreeAndNil(controllerPedido);
  end;
end;

procedure TFrmMain.ValidaItens;
begin
  if (edtNumProd.Value > 0) and (cbNomProd.KeyValue > 0) and (edtValUnit.Value > 0) then
    btnAddItem.Enabled := True
  else
    btnAddItem.Enabled := False;
    //messagebox(application.Handle,'Por favor, preeencha todos os campos!','ITENS PEDIDO',mb_ok+MB_SYSTEMMODAL);
end;

procedure TFrmMain.validaReg;
begin
  if  (edtCliente.Value > 0) then
    pnlAddItem.Enabled := True
  else
    pnlAddItem.Enabled := False;
end;

end.
