unit _fmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus,
  _frMatrix, _frSourceCode, _frMatrixList;

type
  TfmMain = class(TForm)
    frMatrix: TfrMatrix;
    Panel1: TPanel;
    frMatrixList: TfrMatrixList;
    Panel2: TPanel;
    SaveDialog: TSaveDialog;
    MainMenu: TMainMenu;
    File1: TMenuItem;
    miOpen: TMenuItem;
    miSave: TMenuItem;
    N1: TMenuItem;
    miExit: TMenuItem;
    OpenDialog: TOpenDialog;
    frSourceCode: TfrSourceCode;
    procedure miOpenClick(Sender: TObject);
    procedure miSaveClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
  private
    procedure on_frMatrix_MatrixChanged(ASender:TObject; const AText:string);
    procedure on_frMatrixList_Changed(ASender:TObject; const AText:string);
    procedure on_frMatrixList_Selected(ASender:TObject; const AText:string);
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  fmMain: TfmMain;

implementation

{$R *.dfm}

{ TfmMain }

constructor TfmMain.Create(AOwner: TComponent);
begin
  inherited;

  frMatrix.OnMatrixChanged := on_frMatrix_MatrixChanged;

  frMatrixList.OnChanged  := on_frMatrixList_Changed;
  frMatrixList.OnSelected := on_frMatrixList_Selected;
end;

procedure TfmMain.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMain.miOpenClick(Sender: TObject);
begin
  if OpenDialog.Execute then frMatrixList.LoadFromFile(OpenDialog.FileName);
end;

procedure TfmMain.miSaveClick(Sender: TObject);
begin
  if SaveDialog.Execute then frMatrixList.SaveToFile(SaveDialog.FileName);
end;

procedure TfmMain.on_frMatrixList_Changed(ASender: TObject;
  const AText: string);
begin
  frSourceCode.SetSourceCode(AText);
end;

procedure TfmMain.on_frMatrixList_Selected(ASender: TObject;
  const AText: string);
begin
  frMatrix.SetMatrixString(AText);
end;

procedure TfmMain.on_frMatrix_MatrixChanged(ASender: TObject; const AText: string);
begin
   frMatrixList.SetMatrixString(AText);
end;

end.
