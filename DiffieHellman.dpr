program DiffieHellman;

uses
  Vcl.Forms,
  Dffie_Hellman in 'Dffie_Hellman.pas' {frDiffie},
  Vcl.Themes,
  Vcl.Styles,
  primesonly in 'primesonly.pas' {Form1};

{$R *.res}

begin
{$IFDEF debug}
  ReportMemoryLeaksOnShutdown := debughook <> 0;
{$ENDIF}
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Smokey Quartz Kamri');
  Application.CreateForm(TfrDiffie, frDiffie);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

