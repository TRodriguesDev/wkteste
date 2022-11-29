unit uMItemPedido;

interface

uses
  FireDAC.Comp.Client, SysUtils, uControllerConn, uEnumerador,
  uDAOItemPedido, uValidarClasses;

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
      FmsgAlerta    : wideString;

    protected
    public

      property Conn         : TFDConnection read FConn write FConn;
      property IDItem       : Integer read FIDItem       write FIDItem;
      property NumPed_Item  : Integer read FNumPed_Item  write FNumPed_Item;

      [TValidador('Código do Produto')]
      property CodProd_Item : Integer read FCodProd_Item write FCodProd_Item;

      [TValidador('Quantidade')]
      property QtdProd_Item : Double read  FQtdProd_Item write FQtdProd_Item;

      [TValidador('Valor Item')]
      property VlUnit_Item  : Double read  FVlUnit_Item  write FVlUnit_Item;

      [TValidador('Total Item')]
      property Vltot_Item   : Double read  FVltot_Item   write FVltot_Item;
      property Enumtp       : TEnumerador read FEnumtp write FEnumtp;
      property msgAlerta    : wideString read FmsgAlerta write FmsgAlerta;

      function persistir: Boolean;
      function selecionar(Codigo: Integer): TFDQuery;


    published

  end;
implementation
{ TMItemPedido }



function TMItemPedido.persistir: Boolean;
var
  daoItemPedido : TDAOItemPedido;
begin
  result          := false;
  self.msgAlerta  := '';

  if self.Enumtp <> tpExcluir then
    self.msgAlerta := TValidador.validar(Self);

  if self.MsgAlerta = '' then
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

{
procedure TMItemPedido.validarDados;
var
  Contexto    : TRttiContext;
  Tipo        : TRttiType;
  Propriedade : TRttiProperty;
  Atributo    : TCustomAttribute;
begin

  Contexto := TRttiContext.Create;

  Tipo := Contexto.GetType(TMItemPedido.ClassInfo);

  Self.MsgAlerta := '';
  for Propriedade in Tipo.GetProperties do
  begin
    for Atributo in Propriedade.GetAttributes do
    begin
      if Atributo is TValidador then
      begin
        if not TValidador(Atributo).ValidarValor(Propriedade,Self) then
        begin
          if self.MsgAlerta = '' then
            self.MsgAlerta  := 'Valor não preenchido:' + #13#10;

          Self.MsgAlerta  := Self.MsgAlerta + (Atributo as TValidador).Descricao + #13#10;
        end;
      end;
    end;

  end;
end;
}
{ TValidador }

{
constructor TValidador.Create(const Descricao: string);
begin
  FDescricao := Descricao;
end;

function TValidador.ValidarValor(Propriedade: TRttiProperty;
  Objeto: TObject): Boolean;
Var
  Valor: variant;
begin
  Valor := Propriedade.GetValue(Objeto).AsVariant;

  result := (VarToStr(Valor) <> EmptyStr) and (VarToStr(Valor) <> '0');
end;
}

end.
