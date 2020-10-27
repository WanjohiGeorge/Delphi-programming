unit Dffie_Hellman;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, IdThreadComponent, IdBaseComponent;

type
  TfrDiffie = class(TForm)
    GridPanel1: TGridPanel;
    pnlClient1: TPanel;
    Label1: TLabel;
    mmLogs1: TMemo;
    btnSend1: TButton;
    Panel2: TPanel;
    pnlClient2: TPanel;
    lblClient2: TLabel;
    mmLogs2: TMemo;
    Panel3: TPanel;
    GridPanel3: TGridPanel;
    btnSend2: TButton;
    Button1: TButton;
    Panel1: TPanel;
    Panel4: TPanel;
    Label2: TLabel;
    rb10000: TRadioButton;
    rb1000: TRadioButton;
    rb100: TRadioButton;
    Panel5: TPanel;
    rb100000: TRadioButton;
    edtMsg1: TRichEdit;
    edtMsg2: TRichEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtMsg1Enter(Sender: TObject);
    procedure edtMsg2Enter(Sender: TObject);
    procedure edtMsg1Exit(Sender: TObject);
    procedure edtMsg2Exit(Sender: TObject);
    procedure btnSend1Click(Sender: TObject);
    procedure btnSend2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure GetAndSelectedMaximumPrime;
    procedure ComputeKeys;
    procedure InitializeClients;
    { Private declarations }
  public
    { Public declarations }
  end;

type
  Key { to store P and G as a single element } = class
  public { used public to avoid setting/getting private values }
    FPrimeG, FPrimeP: integer;
  end;

type
  Party = class
  private
    FPrime { P }, FCo_Prime { G }, FSecretNumber { a | b }: integer;
    FKey: Key;
    alienP, alienG: integer;
    EncryptionKey: integer;
    procedure SendP_and_G(aKey: Key);
    function generateRandomPrime: Key;
    procedure setKeys(const Value: Key);
    function CheckPrime(aP: integer): boolean;
    function CheckCoPrime(aG: integer; aP: integer): boolean;
    function RealMod(aPrime: integer; aSecret, aG: integer): integer;
    function DecryptMessage(lmessage: TStrings; EncryptionKey: integer)
      : TStrings;
    function encryptMessage(lmessage: TStrings; EncryptionKey: integer):
      TStrings;
    function GuessKeyWord(lKeys: integer): string;
    function GetKeyWordLength(EncryptionKey: integer): integer;
  public
    property KeysGen: Key read FKey write setKeys;
  end;

var
  frDiffie: TfrDiffie;
  G, P: integer;
  A, B: integer;
  lmessage: TStrings;
  ModPowers, MaxPrime: integer;
  lClient1, lClient2: Party;
  // global variables

implementation

uses
  System.Math;

{$R *.dfm}
{ Party }

function Party.CheckCoPrime(aG: integer; aP: integer): boolean;
var
  lCount, lG, lP: integer;
begin
  result := false;
  for lCount := 1 to aP do
  begin
    lG := aG mod lCount;
    lP := aP mod lCount;
    if ((lG > 0) and (lP > 0)) or ((lG = 0) and (lP <> 0)) or
      ((lG <> 0) and (lP = 0)) and (lCount > 1) then
    begin
      result := true;
    end
    else if (lCount = 1) or (lCount = 0) then
    begin
      continue;
    end
    else
    begin
      result := false;
      exit;
    end;
  end;

end;

function Party.CheckPrime(aP: integer): boolean;
var
  lCount, ap_mod, aP_1: integer;
begin
  result := false;
  for lCount := 1 to aP - 1 do
  begin
    aP_1 := aP - lCount;
    ap_mod := aP mod (aP_1);
    if (ap_mod <> 0) and (aP_1 <> 1) then { div by other numbers }
    begin
      result := true;
    end
    else if (aP_1 = 1) or (aP_1 = 0) then
      exit
    else
    begin
      result := false;
      exit;
    end;
  end;

end;

function Party.DecryptMessage(lmessage: TStrings; EncryptionKey: integer):
  TStrings;
var
  lS: TStrings;
  str, lTemp, ltempKeyword, lPxtr, lPxtl, Keyword: string;
  lCount, lKeyLen, lIndex, lCtemp, tempK: integer;
begin
  lKeyLen := GetKeyWordLength(lClient1.EncryptionKey);
  keyword := '';
  Result := TStringList.Create;

  for lCount := 1 to lKeyLen do
    keyword := keyword + lMessage.Strings[0][lCount];
  ltempKeyword := '';
  lIndex := 1;

  for str in lmessage do
  begin
    if (str = lmessage.Strings[0]) then
      continue;
    for lKeyLen := 1 to length(str) do
    begin
      if lIndex = length(Keyword) + 1 then
        lIndex := 1;
      ltempKeyword := ltempKeyword + KeyWord[lIndex];
      lindex := lIndex + 1;
    end;
  end;

  lS := TStringList.Create;
  try
    ltemp := '';
    lIndex := 1;
    for str in lmessage do
    begin
      if (str = lmessage.Strings[0]) then
        continue;
      for lCount := 1 to length(str) do
      begin
        if not (str[lCount] in ['A'..'Z', 'a'..'z']) then
          // do not encrypt non alphabets
          ltemp := ltemp + str[lCount]
        else
        begin
          {
            encryption
            Ei = (Pi + Ki) mod 26
            Decryption
            Di = (Ei - Ki + 26) mod 26
          }
          lPxtl := str[lCount];
          if (lPxtl[1] in ['a'..'z']) then
          begin
            lPxtr := Lowercase(ltempKeyword[lCount]);
            lCtemp := { get Letter }(ord('a') + ({ A }(ord(lPxtl[1])
              - ord(lPxtr[1]) + 13) mod 26) + 1); { vigerene cipher }
            if lCtemp > ord('z') then
              lCtemp := lCtemp - 26;
            ltemp := ltemp + chr(lCtemp);
          end
          else
          begin
            lPxtr := ltempKeyword[lCount];
            ltemp := ltemp + chr { get Letter }(ord('A') + ({ A }(ord(lPxtl[1])
              - ord(lPxtr[1]) + 26) mod 26)); { vigerene cipher }
          end;
        end;
      end;
      lS.Add(lTemp);
    end;
    result.SetStrings(lS);
  finally
    lS.Free;
  end;
end;

function Party.encryptMessage(lmessage: TStrings; EncryptionKey: integer)
  : TStrings;
var
  KeyWord: string;
  lS: TStrings;
  ltemp, ltempKeyword, lPxtr, lPxtl, str: string;
  lCount, lKeyLen, lIndex, lCtemp: integer;
begin
  KeyWord := lClient1.GuessKeyWord
    (lClient1.GetKeyWordLength(lClient1.EncryptionKey));
  lS := TStringList.Create;
  Result := TStringList.Create;
  ltempKeyword := '';
  try
    ltemp := '';
    lS.Add(KeyWord);
    lIndex := 1;
    for str in lmessage do
      for lKeyLen := 1 to length(str) do
      begin
        ltempKeyword := ltempKeyword + KeyWord[lIndex];
        lindex := lIndex + 1;
        if lIndex = length(Keyword) + 1 then
          lIndex := 1;
      end;
    for str in lmessage do
    begin
      for lCount := 1 to length(str) do
      begin
        if not (str[lCount] in ['A'..'Z', 'a'..'z']) then
          // do not encrypt non alphabets
          ltemp := ltemp + str[lCount]
        else
          //          ltemp := ltemp + chr { get Letter }(65 + ({ A }(ord(str[lCount]) +
          //            ord(ltempKeyword[lCount])) mod 26)); { vigerene cipher }
        begin
          lPxtl := str[lCount];
          if lPxtl[1] in ['a'..'z'] then
          begin
            lPxtr := Lowercase(ltempKeyword[lCount]);

            lCtemp := { get Letter }((ord('a') + ((ord(lPxtl[1]) +
              ord(lPxtr[1])) mod 26))); { vigerene cipher }
            if lCtemp > ord('z') then
              lCtemp := lCtemp - 26;
            ltemp := ltemp + chr(lCtemp);
          end
          else
          begin
            lPxtr := ltempKeyword[lCount];
            ltemp := ltemp + (chr(ord('A') + ((ord(lPxtl[1]) +
              ord(lPxtr[1])) mod 26)));
          end;

        end;
      end;
      lS.Add(lTemp);
    end;
    result.SetStrings(lS);
  finally
    lS.Free;
  end;
end;

function Party.generateRandomPrime: Key;
var
  lG, lCoPrime, lP: integer;
begin
  try
    FKey := Key.Create;

    // generate P
    lP := random(MaxPrime); { random numbers from 0-100] }
    while CheckPrime(lP) = false do
    begin
      // checkPrime
      lP := random(MaxPrime); { random numbers from 0-100] }
    end;
    lCoPrime := lP - 1;
    // generate G
    lG := random(lCoPrime); { random numbers from 0 - P }
    while CheckCoPrime(lCoPrime, lG) = false do
    begin
      lG := random(lP); { random numbers from 0 - P }
    end;

    FKey.FPrimeP := lP;
    FKey.FPrimeG := lG;
    result := FKey;
  finally
    //    FKey.Free;
  end;
end;

function Party.GuessKeyWord(lKeys: integer): string;
var
  lI: integer;
begin
  result := '';
  for lI := 1 to lKeys do
  begin
    result := result + chr(65 + random(25))
  end;
end;

function Party.GetKeyWordLength(EncryptionKey: integer): integer;
var
  lKeys: integer;
  lLetters: string;
  lI: integer;
begin
  lKeys := 0;
  lLetters := IntToStr(EncryptionKey);
  if length(lLetters) < 3 then
  begin
    for lI := 1 to length(lLetters) do
    begin
      lKeys := lKeys + StrToInt(lLetters[lI]);
    end;
    if lKeys <= 7 then
      lKeys := 5 * 3;
  end
  else
    for lI := 1 to length(lLetters) do
    begin
      lKeys := lKeys + StrToInt(lLetters[lI]);
    end;
  result := lKeys * 2;
end;

function Party.RealMod(aPrime, aSecret, aG: integer): integer;
var
  ltemp: integer;
begin
  //
  result := aPrime mod aG;
  ltemp := aSecret;
  while ltemp > 1 do
  begin
    result := aPrime * result;
    result := result mod aG;
    ltemp := ltemp - 1;
    if ltemp = 1 then
      result := result;
    // find mod value for
  end;
end;

procedure Party.SendP_and_G(aKey: Key);
begin
  // set global P and G
  G := aKey.FPrimeG;
  P := aKey.FPrimeP;
end;

procedure Party.setKeys(const Value: Key);
begin
  self.FPrime := Value.FPrimeP;
  self.FCo_Prime := Value.FPrimeG;
end;

procedure TfrDiffie.btnSend1Click(Sender: TObject);
begin
  if btnSend1.Caption = 'Send' then
  begin
    if edtMsg1.Lines.Strings[0].Contains('Type in the message to send') then
    begin
      ShowMessage('please type a message');
    end
    else
    begin
      mmLogs1.Lines.Add(sLinebreak + '');
      mmLogs1.Lines.Add(sLinebreak + ' Encrypt.. and Send: ');
      mmLogs1.Lines.AddStrings(edtMsg2.Lines);
      mmLogs1.Perform(EM_SCROLL, SB_LINEDOWN, 0);
      lMessage := edtMsg1.Lines;
      lMessage := lClient1.encryptMessage(lmessage, lClient1.EncryptionKey);
      mmLogs1.Lines.Add(sLinebreak + 'encrypting.......' + sLineBreak +
        'cipher = ..');
      mmLogs1.Lines.AddStrings(lMessage);
      mmLogs1.Perform(EM_SCROLL, SB_LINEDOWN, 0);
      mmLogs2.Lines.Add(sLinebreak + 'received.......' + sLineBreak +
        'cipher = ..');
      mmLogs2.Lines.AddStrings(lMessage);

      mmLogs2.Perform(EM_SCROLL, SB_LINEDOWN, 0);
      mmLogs1.Perform(EM_SCROLL, SB_LINEDOWN, 0);
      btnSend2.Caption := 'Receive and decrypt';
      if edtMsg1.Lines.Strings[0].IsEmpty then
        edtMsg1.Lines.Add('Type in the message to send');
    end;
  end
  else if btnSend1.Caption = 'Receive and decrypt' then
  begin
    btnSend1.Caption := 'Send';
    edtMsg1.Lines := lClient1.DecryptMessage(lmessage, lClient1.EncryptionKey);
    mmLogs1.Lines.Add( sLineBreak + 'Decypted Message to obtain...');
    mmLogs1.Lines.AddStrings(edtMsg1.Lines);
  end;
end;

procedure TfrDiffie.btnSend2Click(Sender: TObject);
var
  lline: string;
begin
  if btnSend2.Caption = 'Send' then
  begin
    if edtMsg2.Lines.Strings[0].Contains('Type in the message to send') then
    begin
      ShowMessage('please type a message');
    end
    else
    begin
      mmLogs2.Lines.Add(sLinebreak + ' Encrypt.. and Send: ');
      mmLogs2.Lines.AddStrings(edtMsg2.Lines);
      mmLogs2.Perform(EM_SCROLL, SB_LINEDOWN, 0);
      lMessage := edtMsg2.Lines;
      lMessage := lClient2.encryptMessage(lmessage, lClient2.EncryptionKey);
      mmLogs2.Lines.Add(sLinebreak + 'encrypting.......' + sLineBreak +
        'cipher = ..');
      mmLogs2.Lines.AddStrings(lMessage);
      mmLogs2.Perform(EM_SCROLL, SB_LINEDOWN, 0);
      mmLogs1.Lines.Add(sLinebreak + 'received.......' + sLineBreak +
        'cipher = ..');
      mmLogs1.Lines.AddStrings(lMessage);
      mmLogs1.Perform(EM_SCROLL, SB_LINEDOWN, 0);
      btnSend1.Caption := 'Receive and decrypt';

      if edtMsg2.Lines.Strings[0].IsEmpty then
        edtMsg2.Lines.Add('Type in the message to send');
    end;
  end
  else if btnSend2.Caption = 'Receive and decrypt' then
  begin
    btnSend2.Caption := 'Send';
    edtMsg2.Lines := lClient1.DecryptMessage(lmessage, lClient1.EncryptionKey);
    mmLogs2.Lines.Add( sLineBreak +'Decypted Message to obtain...' );
    mmLogs2.Lines.AddStrings(edtMsg2.Lines);
  end;

end;

procedure TfrDiffie.Button1Click(Sender: TObject);
begin
  GetAndSelectedMaximumPrime;

  // create communicating objects
  Button1.Enabled := false;
  InitializeClients;
  { // Client 2 should not find co primes
    mmLogs2.Lines.Add('guessing coprime of  ' + inttostr(lClient2.KeysGen.FPrimeP
    - 1) + ' ....');
    mmLogs2.Lines.Add('');
    mmLogs2.Lines.Add('G :  ' + inttostr(lClient2.KeysGen.FPrimeG));
  }
  ComputeKeys;
  while lClient2.EncryptionKey <> lClient1.EncryptionKey do
  begin
    ComputeKeys;
  end;
  Button1.Enabled := true;

  mmLogs1.Lines.Add('' + sLinebreak + 'Key :   ' +
    IntToStr(lClient1.EncryptionKey));
  mmLogs2.Lines.Add('' + sLinebreak + 'Key :   ' +
    IntToStr(lClient2.EncryptionKey));

  // either client 1 or 2 can type and send their message;

end;

procedure TfrDiffie.edtMsg1Enter(Sender: TObject);
begin
  if edtMsg1.Lines.Strings[0].Contains('Type in the message to send') then
    edtMsg1.Lines.Clear;
end;

procedure TfrDiffie.edtMsg1Exit(Sender: TObject);
begin
  if edtMsg1.Lines.Strings[0].IsEmpty then
    edtMsg1.Lines.Add('Type in the message to send');
end;

procedure TfrDiffie.edtMsg2Enter(Sender: TObject);
begin
  if edtMsg2.Lines.Strings[0].Contains('Type in the message to send') then
    edtMsg2.Lines.Clear;
end;

procedure TfrDiffie.edtMsg2Exit(Sender: TObject);
begin
  if edtMsg2.Lines.Strings[0].IsEmpty then
    edtMsg2.Lines.Add('Type in the message to send');
end;

procedure TfrDiffie.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 // 
 lClient1.Free;
 lClient2.Free;
end;

procedure TfrDiffie.FormShow(Sender: TObject);
begin
  rb100.Checked := true;
  Button1Click(Sender);
  lMessage := TStringList.Create;
end;

procedure TfrDiffie.GetAndSelectedMaximumPrime;
begin
  if rb100.Checked then
  begin
    ModPowers := 7;
    MaxPrime := StrToInt(rb100.Caption);
  end;
  if rb1000.Checked then
  begin
    ModPowers := 5;
    MaxPrime := StrToInt(rb1000.Caption);
  end;
  if rb10000.Checked then
  begin
    ModPowers := 3;
    MaxPrime := StrToInt(rb10000.Caption);
  end;
  if rb100000.Checked then
  begin
    ModPowers := 3;
    MaxPrime := StrToInt(rb100000.Caption);
  end;
end;

procedure TfrDiffie.ComputeKeys;
begin
  // object 1 sends P and G (= coprime of p-1} to object 2
  lClient1.SendP_and_G(lClient1.KeysGen);
  // read P and G
  lClient2.alienP := P;
  lClient2.alienG := G;
  // object 2 selects a secretNumber(a)
  lClient2.FSecretNumber := random(MaxPrime);
  // object 2 computes  g^a mod p and send the result to  object 1  {A}
  A := lClient2.RealMod(lClient2.alienG, lClient2.FSecretNumber,
    lClient2.alienP);
  // object 1 selects a secretNumber(b)
  lClient1.FSecretNumber := random(MaxPrime);
  // object 1 computes  g^b mod p and send the result to  object 2  {B}
  B := lClient1.RealMod(lClient1.KeysGen.FPrimeG, lClient1.FSecretNumber,
    lClient1.KeysGen.FPrimeP);
  // object 1 compute A^b mod P  = Key
  lClient1.EncryptionKey := lClient1.RealMod(A, lClient1.FSecretNumber,
    lClient1.KeysGen.FPrimeP);
  // object 2 computes B^a mod P = Key
  lClient2.EncryptionKey := lClient2.RealMod(B, lClient2.FSecretNumber,
    lClient2.alienP);
end;

procedure TfrDiffie.InitializeClients;
begin
  lClient1 := Party.Create;
  mmLogs1.Lines.Add('client 1 initialized...');
  mmLogs1.Lines.Add('');
  lClient2 := Party.Create;
  mmLogs2.Lines.Add('client 2 initialized...');
  mmLogs2.Lines.Add('');
  mmLogs1.Lines.Add('guessing a prime number...');
  mmLogs1.Lines.Add('');
  // with MyThread.Create do
  // FreeOnTerminate := true;
  lClient1.generateRandomPrime;
  mmLogs1.Lines.Add('P :  ' + IntToStr(lClient1.KeysGen.FPrimeP));
  { // Client 2 should not find primes
    lClient2.generateRandomPrime;
    mmLogs2.Lines.Add('guessing a prime number...');
    mmLogs2.Lines.Add('');
    mmLogs2.Lines.Add('P :  ' + inttostr(lClient2.KeysGen.FPrimeP));
  }
  // allow object 1 to select their prime|coprime numbers
  mmLogs1.Lines.Add('guessing coprime of  ' + IntToStr(lClient1.KeysGen.FPrimeP
    - 1) + ' ....');
  mmLogs1.Lines.Add('');
  mmLogs1.Lines.Add('G :  ' + IntToStr(lClient1.KeysGen.FPrimeG));
end;

end.



