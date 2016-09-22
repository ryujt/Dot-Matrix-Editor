program DotMatrix;

uses
  Vcl.Forms,
  _fmMain in '_fmMain.pas' {fmMain},
  _frMatrix in '_frMatrix.pas' {frMatrix: TFrame},
  _frControlBar in '_frControlBar.pas' {frControlBar: TFrame},
  _frMatrixList in '_frMatrixList.pas' {frMatrixList: TFrame},
  _frSourceCode in '_frSourceCode.pas' {frSourceCode: TFrame},
  Base in 'Base.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
