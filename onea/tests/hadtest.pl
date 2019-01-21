#!/usr/bin/swipl
% vim: set filetype=prolog: ts=2 sw=2 sts=2 expandtab:cindent:formatoptions+=cro %

:- dynamic fact/3. % can be retracted/asserted at runtime
fact(emp,tim,      [job=cleaner,mother=president]).
fact(emp,jane,     [job=president]).
fact(job,cleaner,  [salary=10000]).
fact(job,professor,[salary=30000]).

:- op(800,xfy,  and).
:- op(790, xfy, had).


had(X and Y)      :- had(X), had(Y).
had(X =Id had Y)  :- fact(X,Id,Fs),  b4(Y,Fs).

b4(X had Y,Fs)    :- b4(X,Fs), b4(Y,Fs).
b4(X =  Y, Fs)    :- member(X=Y,Fs).
