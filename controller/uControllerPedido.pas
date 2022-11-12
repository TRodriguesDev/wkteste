unit uControllerPedido;

interface

uses FireDAC.Comp.Client, uMPedido, SysUtils;

Type
  TControllerPedido = class
  private
    FMPedido: TMPedido;

    public
      property MPedido : TMPedido read FMPedido write FMPedido;

      function persistir: Boolean;
      function selecionar(Codigo: Integer): TFDQuery;
      function selecionaCliente   : TFDQuery;
      function selecionaProdutos  : TFDQuery;


      constructor Create;
      destructor destroy; override;
  end;

implementation

{ TControllerPedido }

constructor TControllerPedido.Create;
begin
  FMPedido := TMPedido.create;
  inherited Create;
end;

destructor TControllerPedido.destroy;
begin
  Freeandnil(FMPedido);
  inherited;
end;

function TControllerPedido.persistir: Boolean;
begin
  result := FMPedido.persistir;
end;

function TControllerPedido.selecionaCliente: TFDQuery;
begin
  result := FMPedido.selecionaCliente;
end;

function TControllerPedido.selecionaProdutos: TFDQuery;
begin
  result := FMPedido.selecionaProdutos;
end;

function TControllerPedido.selecionar(Codigo: Integer): TFDQuery;
begin
  result := FMPedido.selecionar(Codigo);
end;

end.
