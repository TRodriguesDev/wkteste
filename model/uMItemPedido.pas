unit uMItemPedido;

interface

uses
  FireDAC.Comp.Client, SysUtils, uControllerConn, uEnumerador;

Type
  TMItemPedido = class
    private
      FConn         : TFDConnection;
      FIDItem       : Integer;
      FNumPed_Item  : Integer;
      FCodProd_Item : Integer;
      FQtdProd_Item : Double;
      FVlUnit_Item  : Double;
      FVltot_Item   : Double;
      FEnumtp       : TEnumerador;

    public

      property Conn         : TFDConnection read FConn write FConn;
      property IDItem       : Integer read FIDItem       write FIDItem;
      property NumPed_Item  : Integer read FNumPed_Item  write FNumPed_Item;
      property CodProd_Item : Integer read FCodProd_Item write FCodProd_Item;
      property QtdProd_Item : Double read  FQtdProd_Item write FQtdProd_Item;
      property VlUnit_Item  : Double read  FVlUnit_Item  write FVlUnit_Item;
      property Vltot_Item   : Double read  FVltot_Item   write FVltot_Item;
      property Enumtp       : TEnumerador read FEnumtp write FEnumtp;

      function persistir: Boolean;
      function selecionar(Codigo: Integer): TFDQuery;

    published

  end;
implementation
{ TMItemPedido }

uses uDAOItemPedido;

function TMItemPedido.persistir: Boolean;
var
  daoItemPedido : TDAOItemPedido;
begin
  daoItemPedido := TDAOItemPedido.Create;
  try
    case FEnumtp of
      tpIncluir:
        result := daoItemPedido.incluir(Self);
      tpExcluir:
        result := daoItemPedido.excluir(self);
      tpAlterar:
        result := daoItemPedido.alterar(self);
    end;
  finally
    Freeandnil(daoItemPedido);
  end;
end;

function TMItemPedido.selecionar(Codigo: Integer): TFDQuery;
var
  daoItemPedido : TDAOItemPedido;
begin
  daoItemPedido := TDAOItemPedido.Create;
  Try
    result := daoItemPedido.selecionar(codigo);
  Finally
    Freeandnil(daoItemPedido);
  End;
end;

end.
