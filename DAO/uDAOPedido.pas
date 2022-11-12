unit uDAOPedido;

interface

uses
  FireDAC.Comp.Client, SysUtils, uControllerConn, uMPedido;

Type
  TDAOPedido = class
    private
    protected
    public
      function selecionar(Codigo: Integer) : TFDQuery;
      function selecionaCliente : TFDQuery;
      function selecionaProdutos : TFDQuery;

      function incluir (MPedido : TMPedido) : Boolean;
      function excluir (MPedido : TMPedido) : Boolean;
      function alterar (MPedido : TMPedido) : Boolean;
  end;


implementation

{ TMPedidos }

function TDAOPedido.alterar(MPedido: TMPedido): Boolean;
begin
  //
end;

function TDAOPedido.excluir(MPedido: TMPedido): Boolean;
var
  qryPedido : TFDQuery;
begin
  qryPedido := TControllerConn.getInstance().daoConn.novaQuery;
  Try
    try
      qryPedido.ExecSQL('DELETE FROM pedidos WHERE IDPEDIDO = :Codigo',[MPedido.IDPedido]);
      result := True;
    except
      result := False;
    end;
  Finally
    qryPedido.DisposeOf;
  End;
end;

function TDAOPedido.incluir(MPedido: TMPedido): Boolean;
var
  qryPedido : TFDQuery;
begin
  qryPedido := TControllerConn.getInstance().daoConn.novaQuery;
  Try
    try
      qryPedido.ExecSQL('INSERT INTO pedidos (DTE_PED, CLI_PED, VLTOT_PED) VALUES (:DTE_PED, :CLI_PED, 0)',[MPedido.Dte_Ped,MPedido.Cli_Ped]);
      qryPedido.Open('SELECT MAX(IDPEDIDO) ULT FROM pedidos');
      MPedido.IDPedido :=  qryPedido.fieldbyname('ULT').AsInteger;
      result := True;
    except
      result := False;
    end;
  Finally
    qryPedido.DisposeOf;
  End;
end;


function TDAOPedido.selecionaCliente: TFDQuery;
var
  qryCliente : TFDQuery;
begin
  qryCliente := TControllerConn.getInstance().daoConn.novaQuery;
  qryCliente.Open('SELECT * FROM clientes');
  Result := qryCliente;
end;

function TDAOPedido.selecionaProdutos: TFDQuery;
var
  qryProdutos : TFDQuery;
begin
  qryProdutos := TControllerConn.getInstance().daoConn.novaQuery;
  qryProdutos.Open('SELECT * FROM produtos');
  Result := qryProdutos;
end;

function TDAOPedido.selecionar(Codigo: Integer): TFDQuery;
var
  qryPedido : TFDQuery;
begin
  qryPedido := TControllerConn.getInstance().daoConn.novaQuery;
  if codigo > 0 then
    qryPedido.Open('SELECT * FROM vw_regpedidos WHERE IDPEDIDO = ' + inttostr(Codigo))
  else
    qryPedido.Open('SELECT * FROM vw_regpedidos');
  Result := qryPedido;
end;

end.
