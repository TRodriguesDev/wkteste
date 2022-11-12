unit uMPedido;

interface

uses
  FireDAC.Comp.Client, SysUtils, uControllerConn, uEnumerador;

Type
  TMPedido = class
    private
      FConn       : TFDConnection;
      FIDPedido   : Integer;
      FDte_Ped    : TDateTime;
      FCli_Ped    : Integer;
      FVltot_ped  : Double;
      FEnumtp     : TEnumerador;
    public

      property Conn       : TFDConnection read FConn write FConn;
      property IDPedido   : Integer read FIDPedido write FIDPedido;
      property Dte_Ped    : TDateTime read FDte_Ped write FDte_Ped;
      property Cli_Ped    : Integer read FCli_Ped write FCli_Ped;
      property Vltot_ped  : Double read FVltot_ped write FVltot_ped;
      property Enumtp     : TEnumerador read FEnumtp write FEnumtp;

      function persistir: Boolean;
      function selecionar(Codigo : Integer): TFDQuery;

      {
      }
      function selecionaCliente   : TFDQuery;
      function selecionaProdutos  : TFDQuery;


   published

  end;


implementation

{ TMPedido }

uses uDAOPedido;



function TMPedido.persistir: Boolean;
var
  daoPedido : TDAOPedido;
begin
  daoPedido := TDAOPedido.Create;
  try
    case FEnumtp of
      tpIncluir:
        result := daoPedido.incluir(Self);
      tpExcluir:
        result := daoPedido.excluir(self);
      tpAlterar:
        result := daoPedido.alterar(self);
    end;
  finally
    Freeandnil(daoPedido);
  end;
end;

function TMPedido.selecionaCliente: TFDQuery;
var
  daoPedido : TDAOPedido;
begin
  daoPedido := TDAOPedido.Create;
  Try
    result := daoPedido.selecionaCliente;
  Finally
    Freeandnil(daoPedido);
  End;
end;

function TMPedido.selecionaProdutos: TFDQuery;
var
  daoPedido : TDAOPedido;
begin
  daoPedido := TDAOPedido.Create;
  Try
    result := daoPedido.selecionaProdutos;
  Finally
    Freeandnil(daoPedido);
  End;
end;

function TMPedido.selecionar(Codigo: Integer): TFDQuery;
var
  daoPedido : TDAOPedido;
begin
  daoPedido := TDAOPedido.Create;
  Try
    result := daoPedido.selecionar(Codigo);
  Finally
    Freeandnil(daoPedido);
  End;
end;

end.
