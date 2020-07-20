unit uEnumerationExample;

interface

uses
  system.sysutils;

type
  TFDemoExample = class
  private
    // vars
    FString: string;
    FIndex: Integer;
  protected

  public
    constructor create(const value:string);
  end;

implementation

end.
