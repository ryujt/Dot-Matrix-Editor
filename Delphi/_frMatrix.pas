unit _frMatrix;

interface

uses
  Base,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons;

const
  MATRIX_WIDTH  = 8;
  MATRIX_HEIGHT = 8;

type
  TNewShape = class (TShape)
  end;

  TfrMatrix = class(TFrame)
    Shape1: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    Shape13: TShape;
    Shape14: TShape;
    Shape15: TShape;
    Shape16: TShape;
    Shape17: TShape;
    Shape18: TShape;
    Shape19: TShape;
    Shape2: TShape;
    Shape20: TShape;
    Shape21: TShape;
    Shape22: TShape;
    Shape23: TShape;
    Shape24: TShape;
    Shape25: TShape;
    Shape26: TShape;
    Shape27: TShape;
    Shape28: TShape;
    Shape29: TShape;
    Shape3: TShape;
    Shape30: TShape;
    Shape31: TShape;
    Shape32: TShape;
    Shape33: TShape;
    Shape34: TShape;
    Shape35: TShape;
    Shape36: TShape;
    Shape37: TShape;
    Shape38: TShape;
    Shape39: TShape;
    Shape4: TShape;
    Shape40: TShape;
    Shape41: TShape;
    Shape42: TShape;
    Shape43: TShape;
    Shape44: TShape;
    Shape45: TShape;
    Shape46: TShape;
    Shape47: TShape;
    Shape48: TShape;
    Shape49: TShape;
    Shape5: TShape;
    Shape50: TShape;
    Shape51: TShape;
    Shape52: TShape;
    Shape53: TShape;
    Shape54: TShape;
    Shape55: TShape;
    Shape56: TShape;
    Shape57: TShape;
    Shape58: TShape;
    Shape59: TShape;
    Shape6: TShape;
    Shape60: TShape;
    Shape61: TShape;
    Shape62: TShape;
    Shape63: TShape;
    Shape64: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    btAllRed: TSpeedButton;
    btAllSilver: TSpeedButton;
    procedure btAllRedClick(Sender: TObject);
    procedure btAllSilverClick(Sender: TObject);
  private
    FLEDs : array [0..MATRIX_WIDTH-1, 0..MATRIX_HEIGHT-1] of TNewShape;
    procedure on_Shape_Click(ASender:TObject);
  private
    FOnMatrixChanged: TStringEvent;
    function GetAsText: string;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure SetMatrixString(const AText:string);
  published
    property AsText : string read GetAsText;
    property OnMatrixChanged : TStringEvent read FOnMatrixChanged write FOnMatrixChanged;
  end;

implementation

{$R *.dfm}

{ TfrMatrix }

procedure TfrMatrix.btAllSilverClick(Sender: TObject);
var
  X, Y : integer;
begin
  for Y := 0 to MATRIX_WIDTH-1  do
  for X := 0 to MATRIX_HEIGHT-1 do
    FLEDs[X, Y].Brush.Color := clSilver;

  if Assigned(FOnMatrixChanged) then FOnMatrixChanged(Self, AsText);
end;

constructor TfrMatrix.Create(AOwner: TComponent);
var
  Loop : integer;
begin
  inherited;

  for Loop := 0 to (MATRIX_WIDTH * MATRIX_HEIGHT) - 1 do begin
    FLEDs[Loop mod MATRIX_WIDTH, Loop div MATRIX_WIDTH] := Pointer( FindComponent('Shape' + IntToStr(Loop+1)) );
    FLEDs[Loop mod MATRIX_WIDTH, Loop div MATRIX_WIDTH].OnClick := on_Shape_Click;
  end;
end;

destructor TfrMatrix.Destroy;
begin

  inherited;
end;

procedure SetBit(var AValue:byte; AIndex:integer; AOn:boolean);
var
  iValue : byte;
begin
  iValue := 1 shl (8-AIndex-1);

  if AOn then begin
    AValue := AValue or iValue;
  end else begin
    iValue := not iValue;
    AValue := AValue and iValue;
  end;
end;

function TfrMatrix.GetAsText: string;
var
  Data : byte;
  X, Y : integer;
begin
  Result := '';

  for Y := 0 to MATRIX_WIDTH-1  do begin
    Data := 0;
    for X := 0 to MATRIX_HEIGHT-1 do
      SetBit(Data, X, FLEDs[X, Y].Brush.Color = clRed);
    Result := Result + Format( '0x%s, ', [IntToHex(Data, 2)] );
  end;

  SetLength(Result, Length(Result) - 2);
end;

procedure TfrMatrix.on_Shape_Click(ASender: TObject);
var
  Shape : TNewShape absolute ASender;
begin
  if Shape.Brush.Color = clRed then Shape.Brush.Color := clSilver
  else Shape.Brush.Color := clRed;

  if Assigned(FOnMatrixChanged) then FOnMatrixChanged(Self, AsText);
end;

function BitOn(AValue,AIndex:byte):boolean;
var
  iMask : byte;
begin
  iMask := 1;
  iMask := iMask shl (8 - AIndex - 1);

  Result := (AValue and iMask) = iMask;
end;

procedure TfrMatrix.SetMatrixString(const AText: string);
var
  Data : byte;
  X, Y: Integer;
  sLine : string;
  Lines : TStringList;
begin
  Lines := TStringList.Create;
  try
    Lines.Delimiter := ',';
    Lines.DelimitedText := AText;

    for Y := 0 to Lines.Count-1 do begin
      sLine := Trim(Lines[Y]);
      sLine := StringReplace( sLine, '0x', '$', [] );

      Data := StrToInt( sLine );

      for X := 0 to MATRIX_WIDTH-1 do if BitOn(Data, X) then FLEDs[X, Y].Brush.Color := clRed
      else FLEDs[X, Y].Brush.Color := clSilver;
    end;
  finally
    Lines.Free;
  end;
end;

procedure TfrMatrix.btAllRedClick(Sender: TObject);
var
  X, Y : integer;
begin
  for Y := 0 to MATRIX_WIDTH-1  do
  for X := 0 to MATRIX_HEIGHT-1 do
    FLEDs[X, Y].Brush.Color := clRed;

  if Assigned(FOnMatrixChanged) then FOnMatrixChanged(Self, AsText);
end;

end.
