unit _frSourceCode;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SynEdit, SynMemo,
  SynEditHighlighter, SynHighlighterJScript, Vcl.StdCtrls;

type
  TfrSourceCode = class(TFrame)
    SynEdit: TSynEdit;
    SynJScriptSyn: TSynJScriptSyn;
    moSrc: TMemo;
  private
  public
    procedure SetSourceCode(const AText:string);
  end;

implementation

{$R *.dfm}

{ TfrSourceCode }

procedure TfrSourceCode.SetSourceCode(const AText: string);
const
  LoopFormat = 'for (int i=0; i<8; i++) max7219.write(i+1, char_%d[i]);' + #13#10 +
               '  delay(500);' + #13#10 + #13#10;
var
  Loop: Integer;
  sLoop : string;
  sMatrixString : string;
  Lines : TStringList;
begin
  sLoop := '';
  sMatrixString := '';

  Lines := TStringList.Create;
  try
    Lines.Text := AText;

    for Loop := 0 to Lines.Count-1 do begin
      sMatrixString := sMatrixString + Format('char char_%d[8] = { %s };'+#13#10, [Loop+1, Lines[Loop]]);
      sLoop := sLoop + Format(LoopFormat, [Loop+1]);
    end;
  finally
    Lines.Free;
  end;

  SynEdit.Text := StringReplace(moSrc.Text, '@Matrix-String', sMatrixString, []);
  SynEdit.Text := StringReplace(SynEdit.Text, '@Loop', sLoop, []);
end;

end.
