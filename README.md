# EN

This module allows you to call functions of thiscall Convention without any hassle as creating your own wrappers.
 
The main function of the module - "__ThisCall", which serves as a universal wrapper for all functions of the convention. The main args:
 
  * PClass - a pointer to the class where the function is located.
  * PFunc - a pointer to a function which is necessary to be called.<br />

The function has uncertain number of arguments. All minor arguments are the arguments for the function, which is going to be called.
  
Some classes of functions can return a result. ThisCall function can return the result as a pointer. You can use the type conversion, to get the result of the correct type.
 
TThisCall type is needed for tricking the compiler, which prohibits the direct use of "varargs" directive. By assigning this type of variable, we can call it using the dynamic number of arguments. This directive works both on "register", and the "stdcall/pascal/cdecl" conventions.

# RU

Данный модуль позволяет вызывать функции thiscall конвенции, не прибегая к созданию собственных оберток.

Главная функция модуля - "__ThisCall", которая и служит универсальной оберткой для всех функций данной конвенции.
Основные аргументы:
  * PClass - указатель на класс, в котором располагается функция.
  * PFunc - указатель на функцию, которая должна быть вызвана.<br />

Функция имеет переменное количество аргументов. Все побочные аргументы являются аргументами для функции, которая планируется быть вызвана.

Некоторые функции классов могут возвращать результат. ThisCall функция способна вернуть этот результат в виде указателя. Можно использовать преобразование типов, чтобы получить результат нужного типа.

Тип TThisCall необходим для "обмана" компилятора, который запрещает прямое использование директивы "varargs". Присвоив переменной данный тип, мы сможем вызывать ее, используя динамическое количество аргументов. Данная директива работает как на "register", так и на "stdcall/pascal/cdecl" соглашениях.
