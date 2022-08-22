unit CsBina;

interface

uses
  VCL.Forms, System.StrUtils, DtmfDecoder, audio.wave.reader, Vcl.Controls, Vcl.StdCtrls, SysUtils, Classes;

type
  TBina = class
  private
    lWaveFile : TWaveReader;
    lDtmfDecoder            : TDtmfDecoder<SmallInt>;
    lBuffer                 : TArray<Byte>;
    lNumberOfSamples        : Cardinal;
    lAnalyzeBuffer          : TArray<SmallInt>;

  public
    lArquivoOrigem : String;
    procedure IdentificarGravacao(var Edit : TEdit);
  end;


implementation

procedure TBina.IdentificarGravacao(var Edit : TEdit);
var
  StringTemporaria : TStringList;
  i : Integer;
  lDtmfTones              : TArray<Char>;
  lDtmfKey                : Char;
begin
  try
    lWaveFile := TWaveReader.Create(lArquivoOrigem);
    StringTemporaria := TStringList.Create;

    SetLength(lBuffer, lWaveFile.DataChunk.Size div lWaveFile.DataChunk.NumberOfChannel);
    Move(lWaveFile.DataChunk.ChannelData[0]^, lBuffer[0], lWaveFile.DataChunk.Size div lWaveFile.DataChunk.NumberOfChannel);

    lNumberOfSamples := lWaveFile.DataChunk.Size div lWaveFile.DataChunk.NumberOfChannel div (lWaveFile.FMTChunk.BitsPerSample div 8);
    SetLength(lAnalyzeBuffer, lNumberOfSamples);
    for i := 0 to lNumberOfSamples - 1 do
    begin
      lAnalyzeBuffer[i] := PSmallInt(@lBuffer[(I*2)])^;
    end;

    {lDtmfTones := TDtmfDecoder<SmallInt>.DetectDTMF(lAnalyzeBuffer, lWaveFile.FMTChunk.SampleRate);
    for lDtmfKey in lDtmfTones do
    begin
//      WriteLn(Format('DTMF KEY: %s', [lDtmfKey]));
    end;}

    lDtmfDecoder := TDtmfDecoder<SmallInt>.Create(lWaveFile.FMTChunk.SampleRate);
    try
      lDtmfDecoder.Thresold := 33.0;
      lDtmfDecoder.OnDtmfCode := procedure(Sender: TObject; DtmfCode: Char; Duration: Integer)
      begin
      //  WriteLn(Format('DTMF KEY: %s, Duration: %d', [DtmfCode, Duration]));
        StringTemporaria.Add(DtmfCode);
      end;
      lDtmfDecoder.Analyze(lAnalyzeBuffer, 0, Length(lAnalyzeBuffer));
    finally
      FreeAndNil(lDtmfDecoder);
    end;
  finally
    Edit.Text := StringTemporaria.Text;
    FreeAndNil(lWaveFile);
  end;
end;

end.
