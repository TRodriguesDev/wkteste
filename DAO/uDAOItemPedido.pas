unit uDAOItemPedido;

interface

uses
  FireDAC.Comp.Client, SysUtils, uControllerConn, uMItemPedido;

Type
  TDAOItemPedido = class
    private
    protected
    public
      function selecionar (Codigo : Integer) : TFDQuery;
      function incluir (MItemPedido : TMItemPedido) : Boolean;
      function excluir (MItemPedido : TMItemPedido) : Boolean;
      function alterar (MItemPedido : TMItemPedido) : Boolean;
  end;


implementation



{ TMItemPedidos }



function TDAOItemPedido.alterar(MItemPedido: TMItemPedido): Boolean;
var
  qryItemPedido : TFDQuery;
begin
  qryItemPedido := TControllerConn.getInstance().daoConn.novaQuery;
  Try
    try
      qryItemPedido.ExecSQL('UPDATE itenspedido SET QTD_ITEM = :QTD, VLUNIT_ITEM = :VLUNIT, VLTOT_ITEM = :VLTOT WHERE IDITEM = :Codigo',[MItemPedido.QtdProd_Item,MItemPedido.VlUnit_Item,MItemPedido.Vltot_Item,MItemPedido.IDItem]);
      result := True;
    except
      result := False;
    end;
  Finally
    qryItemPedido.DisposeOf;
  End;
end;

function TDAOItemPedido.excluir(MItemPedido: TMItemPedido): Boolean;
var
  qryItemPedido : TFDQuery;
begin
  qryItemPedido := TControllerConn.getInstance().daoConn.novaQuery;
  Try
    try
      qryItemPedido.ExecSQL('DELETE FROM itenspedido WHERE NUMPED_ITEM = :Codigo',[MItemPedido.NumPed_Item]);
      result := True;
    except
      result := False;
    end;
  Finally
    qryItemPedido.DisposeOf;
  End;
end;

function TDAOItemPedido.incluir(MItemPedido: TMItemPedido): Boolean;
var
  qryItemPedido : TFDQuery;
begin
  qryItemPedido := TControllerConn.getInstance().daoConn.novaQuery;
  Try
    try
      qryItemPedido.ExecSQL('INSERT INTO itenspedido (NUMPED_ITEM, CODPROD_ITEM, QTD_ITEM, VLUNIT_ITEM, VLTOT_ITEM) VALUES (:NUMPED_ITEM, :CODPROD_ITEM, :QTD_ITEM, :VLUNIT_ITEM, :VLTOT_ITEM)',[MItemPedido.NumPed_Item,MItemPedido.CodProd_Item,MItemPedido.QtdProd_Item,MItemPedido.VlUnit_Item,MItemPedido.Vltot_Item]);
      result := True;
    except
      result := False;
    end;
  Finally
    qryItemPedido.DisposeOf;
  End;
end;


function TDAOItemPedido.selecionar(Codigo : Integer): TFDQuery;
var
  qryItemPedido : TFDQuery;
begin
  qryItemPedido := TControllerConn.getInstance().daoConn.novaQuery;
  qryItemPedido.Open('SELECT * FROM vw_itenspedidos WHERE NUMPED_ITEM = ' + inttostr(codigo));
  Result := qryItemPedido;
end;

end.
