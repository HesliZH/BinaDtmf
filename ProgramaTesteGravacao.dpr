program ProgramaTesteGravacao;

uses
  Vcl.Forms,
  FoMain in 'FoMain.pas' {FormMain},
  CsTeste in 'CsTeste.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
