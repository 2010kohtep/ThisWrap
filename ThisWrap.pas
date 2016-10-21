unit ThisWrap;

{ Данный модуль позволяет вызывать функции thiscall конвенции, не прибегая
  к созданию собственных оберток.

  Главная функция модуля - __ThisCall, которая и служит универсальной оберткой.
  Основные аргументы:
    * PClass - указатель на класс, в котором располагается функция.
    * PFunc - указатель на функцию, которая должна быть вызвана.
  Функция имеет переменное количество аргументов. Все побочные аргументы
  являются аргументами для функции, которая планируется быть вызвана.

  Некоторые функции классов могут возвращать результат. ThisCall функция
  способна вернуть этот результат в виде указателя. Можно использовать
  преобразование типов, чтобы получить результат нужного типа. }

interface

{ Тип TThisCall необходим для "обмана" компилятора, который запрещает прямое
  использование директивы "varargs". Присвоив переменной данный тип, мы сможем
  вызывать ее, используя динамическое количество аргументов. Данная директива
  работает как на "register", так и на "stdcall/pascal/cdecl" соглашениях. }

type
  TThisCall = function(PClass, PFunc: Pointer): Pointer; stdcall varargs;

const
  ThisCall: TThisCall = nil;

implementation

function __ThisCall(PClass, PFunc: Pointer): Pointer; assembler;
asm
  cmp dword [esp + 4], 0 // is PFunc nil?
  jz @A
  cmp dword [esp + 8], 0 // is PClass nil?
  jz @A

  pop edx // return address
  pop ecx // class (this) pointer
  pop eax // function for call
  push edx

  jmp eax

@A:
  or eax, -1
  ret 8
end;

initialization
  ThisCall := @__ThisCall;
end.
