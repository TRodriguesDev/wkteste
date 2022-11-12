unit uControllerItemPedido;

interface

uses FireDAC.Comp.Client, uMItemPedido, SysUtils;

Type
  TControllerItemPedido = class
  private
    fMItemPedido: TMItemPedido;

    public
      property MItemPedido : TMItemPedido read fMItemPedido write fMItemPedido;

      function persistir: Boolean;
      function selecionar(Codigo: Integer): TFDQuery;

      constructor Create;
      destructor destroy; override;
  end;

implementation

{ TControllerPedido }

constructor TControllerItemPedido.Create;
begin
  fMItemPedido := TMItemPedido.create;
  inherited Create;
end;

destructor TControllerItemPedido.destroy;
begin
  Freeandnil(FMItemPedido);
  inherited;
end;


function TControllerItemPedido.persistir: Boolean;
begin
  Result := fMItemPedido.persistir;
end;

function TControllerItemPedido.selecionar(Codigo: Integer): TFDQuery;
begin
  Result := fMItemPedido.selecionar(Codigo);
end;

end.
