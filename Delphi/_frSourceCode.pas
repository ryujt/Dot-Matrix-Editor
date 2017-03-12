unit _frSourceCode;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SynEdit, SynMemo,
  SynEditHighlighter, SynHighlighterJScript, Vcl.StdCtrls, Vcl.Menus;

type
  TfrSourceCode = class(TFrame)
    SynEdit: TSynEdit;
    SynJScriptSyn: TSynJScriptSyn;
    PopupMenu: TPopupMenu;
    miSelectall: TMenuItem;
    miCopy: TMenuItem;
    moSrc: TMemo;
    procedure miSelectallClick(Sender: TObject);
    procedure miCopyClick(Sender: TObject);
  private
  public
    procedure SetSourceCode(const AText:string);
  end;

implementation

{$R *.dfm}

{ TfrSourceCode }

procedure TfrSourceCode.miCopyClick(Sender: TObject);
begin
  SynEdit.CopyToClipboard;
end;

procedure TfrSourceCode.miSelectallClick(Sender: TObject);
begin
  SynEdit.SelectAll;
end;

procedure TfrSourceCode.SetSourceCode(const AText: string);
const
  LoopFormat = '  max7219.write(char_%d);' + #13#10 +
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
      sMatrixString := sMatrixString + Format('static const unsigned char PROGMEM  char_%d[] = { %s };'+#13#10, [Loop+1, Lines[Loop]]);
      sLoop := sLoop + Format(LoopFormat, [Loop+1]);
    end;
  finally
    Lines.Free;
  end;

  SetLength(sLoop, Length(sLoop)-2);

  SynEdit.Text := StringReplace(moSrc.Text, '@Matrix-String', sMatrixString, []);
  SynEdit.Text := StringReplace(SynEdit.Text, '@Loop', sLoop, []);
end;

end.
