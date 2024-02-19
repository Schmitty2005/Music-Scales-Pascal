{$mode objfpc}

Unit MusicTheory;

Interface

Type 
  TscaleArray24 = array [1 .. 25] Of String;
  TscaleArray14 = array [1..14] Of String; {probably not needed!}
  TscaleArray8 = array [1 .. 8] Of String;

  TscaleSteps = array [1 .. 8] Of Integer;
  TfullScalesteps = array [1 .. 15] Of Integer;
  TFullKeyModes = array [0 .. 7] Of TscaleArray8;
  TKeyGroup = array [1 .. 15 ] Of TscaleArray8;
  TModeKeyGroup = array [1..7] Of TKeyGroup; {Needs some replannig}
  Tmode = (Ionian, Dorian, Phrygian, Lydian, Mixolydian, Aeolian, Locrian);

Function chromatic(key: String): string;
Function majorScale(key: String): TscaleArray8;
Function relativeMinor(key: String): TscaleArray8;
Function calcFullKey(key: String): TFullKeyModes;
Function buildScaleString(scaleArray: TscaleArray8): String;
Function scaleToString(scale: TscaleArray8): string;
Function allKeys  : TKeyGroup;

Var   {Change lots of these to const later!}

  modes: Tmode;
  fullScaleSteps: TfullScalesteps = (0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1,
                                     0, 1, 1, 0);
  { R, W, W, W, H, W, W, H, W, W, W, H, W, W, H) }
  { Ionian, Dorian, Phrygian, Lydian, Mixolydian, Aeolian, Locrian) }

{
    Ionian = 0
    Dorian = 1
    Phrygian = 2
    Lydian = 3
    Mixolydian =4
    Aeolian = 5
    Locrian = 6
  }
  { MODES MAY NOT BE CORRECT }
  modeIonian: TscaleSteps =     (0, 1, 1, 1, 0, 1, 1, 0);
  modeDorian: TscaleSteps =     (0, 1, 1, 0, 1, 1, 1, 1);
  modePhygian: TscaleSteps =    (0, 1, 0, 1, 1, 1, 0, 1);
  modeMixolydian: TscaleSteps = (0, 1, 1, 1, 0, 1, 1, 0);
  modeLydian: TscaleSteps =     (0, 1, 1, 0, 1, 1, 0, 1);
  modeAeolian: TscaleSteps =    (0, 1, 0, 1, 1, 0, 1, 1);
  modeLocrian: TscaleSteps =    (0, 0, 1, 1, 0, 1, 1, 0);

  chordProg: TscaleArray8 = ('I', 'ii', 'iii', 'IV', 'V', 'vi', 'vii(dim)',
                             'I (root)');
  chordProgName: TscaleArray8 = ('Tonic', 'SubTonic', 'Sub ', ' ? ', 'Dominant',
                                 '', '', ''); { not complete }
  majorScaleSteps: TscaleSteps = (0, 1, 1, 0, 1, 1, 1, 0);
  { R, W, W, W, H, W, W, H }
  naturalMinorScaleSteps: TscaleSteps = (0, 1, 0, 1, 1, 0, 1, 1);
  { R, W, H, W, W, H, W, W }

  { create scaleSteps for all modes }

  chromaticScaleSharp: TscaleArray24 = ('A ', 'A#', 'B ', 'C ', 'C#', 'D ',
                                        'D#', 'E ', 'F ', 'F#', 'G ', 'G#', 'A '
                                        , 'A#', 'B ', 'C ', 'C#', 'D ', 'D#',
                                        'E ', 'F ', 'F#', 'G ', 'G#', 'A ');

  chromaticScaleFlat: TscaleArray24 = ('A ', 'Bb', 'Cb', 'C ', 'Db', 'D ', 'Eb',
                                       'Fb', 'F ', 'Gb', 'G ', 'Ab', 'A ', 'Bb',
                                       'Cb', 'C ', 'Db', 'D ', 'Eb', 'Fb',
                                       'F ', 'Gb', 'G ', 'Ab'
                                       , 'A ');

  flatKeys: Array [1 .. 7] Of String = (
                                        'F ',
                                        'Bb',
                                        'Eb',
                                        'Ab',
                                        'Db',
                                        'Gb',
                                        'Cb'
                                       );
  sharpKeys: Array [1 .. 7] Of String = (
                                         'G ',
                                         'D ',
                                         'A ',
                                         'E ',
                                         'B ',
                                         'F#',
                                         'C#'
                                        );

  availableKeys: Array [1 .. 15] Of String = (
                                              'A ',
                                              'Bb',
                                              'B ',
                                              'Cb',
                                              'C ',
                                              'C#',
                                              'Db',
                                              'D ',
                                              'Eb',
                                              'E ',
                                              'F ',
                                              'F#',
                                              'Gb',
                                              'G ',
                                              'Ab'
                                             );

  unavailableKeys : Array [1..5] Of String = ('B#', 'D#', 'E#', 'Fb', 'G#');
  convertUKeys : Array [1..5] Of String  = ('Ab', 'Eb', 'F ', 'E ', 'Ab');

  localScale: TscaleArray8;

Implementation

Uses sysutils, typinfo;

{ - typinfo is used for getting string from enum ordinal (0, 1, ect,) like so: }

 { x:= GetEnumName (TypeInfo ([Enum Type ] , [Integer of enum ] ))}

Function buildScaleString(scaleArray: TscaleArray8): String;

Var 
  counter: Integer;
  note: String;
  newScale: String;

Begin

  For note In scaleArray Do
    Begin
      newScale := Concat(buildScaleString, scaleArray[counter]);
      counter := counter + 1;
    End;
  buildScaleString := newScale;
End;

Function chromatic(key: String): String;

Var 
  intKey: Integer;
  note: char;
  step: Integer;
  counter: Integer;
  builder: TscaleArray24;
Begin
  counter := 1;
  key := upCase(key); { Change char to uppercase }
  { intKey := ord(key); }
  For step In majorScaleSteps Do
    Begin
      chromatic := 'poop';
    End;
  chromatic := key;
End;

Function majorScale(key: String): TscaleArray8;
{ THIS FUNCTION WORKS }

Var 
  intKey: Integer;
  note: String;
  stepChar: char;
  noteCounter, scaleCounter: Integer;
  buildScale: String;
  output: TscaleArray8;
  startKey: Integer;
  builder: TscaleArray24;

Const 
  errorMsg : array [1..8] Of String = ('N', 'O', ' ', 'K', 'E', 'Y', ' ', ' ');

Begin
  key[1] := upCase(key[1]);
  scaleCounter := 1;
  startKey := 0;
  intKey := 0;
  { determine Sharp or Flat correction here }
  If key[2] = '#' Then
    builder := chromaticScaleSharp;
  If ((key[2] = 'b') Or (key[2] = 'B')) Then
    builder := chromaticScaleFlat;
  If key[2] = ' ' Then
    builder := chromaticScaleSharp;
  Try
    For note In availableKeys Do
      If key = note Then break;;

  Except
    on E: Exception Do
          writeln ('Exception Caught');
End;


Try
  While (key <> builder[startKey + 1]) Do
    startKey := startKey + 1;
Except
  on ERangeError Do
  Begin
    writeln ('NOT A VALID KEY!');
    startkey := 0;
    Try
      While (key <> builder[startKey + 1]) Do
        startKey := startKey + 1;
    Except
      on E : Exception Do
             Begin
               writeln ('MAJOR ERROR .....EXITING');
               exit;
             End;
  End;
End;

For intKey In majorScaleSteps Do
  Begin
    startKey := startKey + intKey;
    Try
      output[scaleCounter] := builder[startKey + scaleCounter];
    Except
      on ERangeError Do
      Begin
        output := errorMsg;
    {ROUTINE TO WRITE N-O---K-E-Y to array}
      End;
      on E : Exception Do
  End;
scaleCounter := scaleCounter + 1;
End;

majorScale := output;
End;

Function relativeMinor(key: String): TscaleArray8;

Var 
  relMajScale: TscaleArray8;

Begin
  relMajScale := majorScale(key);
  {
    relativeMinor := relMajScale[6];
  }
End;

Function calcFullKey(key: String): TFullKeyModes;

Var 
  counter: Integer;
  modeScale: TscaleArray8;
  fullKeyModes: TFullKeyModes;
  accidental: char;
  chromaticStart: Integer;
  mode: Tmode;
  builder: TscaleArray24;
  note: string;

Begin
  { calculate starting key }
  If (length(key) > 1) Then
    Begin
    { use index of }
    { accidental := indexof (key); }
    End
  Else
    accidental := ' ';
  If accidental = 'b' Then
    builder := chromaticScaleFlat;
  If accidental = '#' Then
    builder := chromaticScaleSharp;
  { FIND Start Position of chromatic }
  For note In builder Do
    Begin

    End;

  For modeScale In fullKeyModes Do
    Begin
    { Create Scale with mode position starting }
      writeln('ModeScaleFiller');
    End;

End;

Function scaleToString(scale: TscaleArray8): string;

Var 
  counter: Integer;
  output: string;
  note: string;

Begin
  For note In scale Do
    scaleToString := scaleToString + note + ' - ';
End;


Function allKeys  : TKeyGroup;

Var 
  note : string;
  counter : integer;
  scale : TscaleArray8;
  output : TKeyGroup;
Begin
  counter := 1;
  For note In  availableKeys Do
    Begin
      writeln('Counter : ' + IntToStr(counter) + ' NOTE : ' + note);
      allKeys[counter] := majorScale(note);
      counter := counter + 1;

    End;
End;


{}

Function modeGroup ( keyz : TKeyGroup ) : TModeKeyGroup;

Begin
End;

{}
Begin

  {
    Any Code that needs to run first
  }

End.
