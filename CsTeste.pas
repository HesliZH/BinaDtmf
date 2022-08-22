unit CsTeste;

interface

uses
  Winapi.MMSystem, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.MPlayer, System.SysUtils;

function CreateNewWave(NewFileName: string): Boolean;

implementation

function CreateNewWave(NewFileName: string): Boolean;
var
  DeviceID: Word;
  Return: LongInt;
  MciOpen: TMCI_Open_Parms;
  MciRecord: TMCI_Record_Parms;
  MciPlay: TMCI_Play_Parms;
  MciSave: TMCI_SaveParms;
  MCIResult: LongInt;
  Flags: Word;
  TempFileName: array[0..255] of char;
  MediaPlayer : TMediaPlayer;
begin
  try
    {$REGION 'Criar objetos media player'}
    MediaPlayer := TMediaPlayer.Create(Application);
    MediaPlayer.Close;
    {$ENDREGION}

    {$REGION 'Localiza o microfone'}
    StrPCopy(TempFileName, NewFileName);
    MciOpen.lpstrDeviceType := 'waveaudio';
    MciOpen.lpstrElementName := '';
    Flags := Mci_Open_Element or Mci_Open_Type;
    MCIResult := MciSendCommand(0, MCI_OPEN, Flags, LongInt(@MciOpen));
    DeviceID := MciOpen.wDeviceId;
    MciRecord.dwTo := 1;
    Flags := Mci_To or Mci_Wait;
    {$ENDREGION}

    {$REGION 'Manda comando para gravação da faixa de audio'}
    MCIResult := MciSendCommand(DeviceID, Mci_Record, Flags, LongInt(@MciRecord));
    mciPlay.dwFrom := 0;
    Flags := Mci_From or Mci_Wait;
    MciSendCommand(DeviceId, Mci_Play, Flags, LongInt(@MciPlay));
    mciSave.lpfileName := TempFilename;
    Flags := MCI_Save_File or Mci_Wait;
    {$ENDREGION}

    {$REGION 'Manda comando para gravação do arquivo .wav em disco'}
    MCIResult := MciSendCommand(DeviceID, MCI_Save, Flags, LongInt(@MciSave));
    Result := MciSendCommand(DeviceID, Mci_Close, 0, LongInt(nil)) = 0;
    {$ENDREGION}
  finally
    FreeAndNil(MediaPlayer)
  end;

end;

end.
