unit FoMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.MPlayer, Vcl.StdCtrls, CsTeste, FMX.Media, CsBina;

type
  TFormMain = class(TForm)
    ArquivoWav: TFileOpenDialog;
    BtGerarWave: TButton;
    BtIniciarGravacao: TButton;
    BtStopGravacao: TButton;
    BtDeletaPorra: TButton;
    BtFMXMedia: TButton;
    LblInfoGrava: TLabel;
    EdTelefone: TEdit;
    BtAnalisarBinaCaseira: TButton;
    BtNossoArquivo: TButton;
    procedure BtGerarWaveClick(Sender: TObject);
    procedure BtIniciarGravacaoClick(Sender: TObject);
    procedure BtStopGravacaoClick(Sender: TObject);
    procedure BtDeletaPorraClick(Sender: TObject);
    procedure BtFMXMediaClick(Sender: TObject);
    procedure BtNossoArquivoClick(Sender: TObject);
    procedure BtAnalisarBinaCaseiraClick(Sender: TObject);
  private
    { Private declarations }
  public
    AudioCapture : TAudioCaptureDevice;
  end;

var
  FormMain: TFormMain;

implementation

const
  Arquivo = 'C:\Projetos\DebugWave\Wave.wav';
  ArquivoTeste = 'C:\Projetos\DebugWave\DTFM_TEST.wav';

{$R *.dfm}

procedure TFormMain.BtAnalisarBinaCaseiraClick(Sender: TObject);
var
  Bina : TBina;
begin
  try
    Bina := TBina.Create;
    Bina.lArquivoOrigem := ArquivoTeste;
    Bina.IdentificarGravacao(EdTelefone);
  finally
    FreeAndNil(Bina);
  end;
end;

procedure TFormMain.BtDeletaPorraClick(Sender: TObject);
begin
//  MpMain.Close;
  DeleteFile(Arquivo);
end;

procedure TFormMain.BtFMXMediaClick(Sender: TObject);
begin
  // Get access to the default audio capture device
  AudioCapture:= TCaptureDeviceManager.Current.DefaultAudioCaptureDevice;
  if Assigned(AudioCapture) then
  begin
    AudioCapture.FileName := Arquivo;
    AudioCapture.StartCapture;
    LblInfoGrava.Caption := 'Gravando';
  end;
end;

procedure TFormMain.BtGerarWaveClick(Sender: TObject);
begin
  CreateNewWave('C:\Projetos\DebugWave\Wave.wav');
end;

procedure TFormMain.BtIniciarGravacaoClick(Sender: TObject);
begin
  if not FileExists(Arquivo) then
    CreateNewWave(Arquivo);

//  Self.MpMain.FileName := Arquivo;
//  MpMain.Open;
//  MpMain.StartRecording;
end;

procedure TFormMain.BtStopGravacaoClick(Sender: TObject);
begin
  AudioCapture.StopCapture;
  LblInfoGrava.Caption := 'Gravação parada';
end;

procedure TFormMain.BtNossoArquivoClick(Sender: TObject);
var
  Bina : TBina;
begin
  try
    Bina := TBina.Create;
    Bina.lArquivoOrigem := Arquivo;
    Bina.IdentificarGravacao(EdTelefone);
  finally
    FreeAndNil(Bina);
  end;
end;

end.
