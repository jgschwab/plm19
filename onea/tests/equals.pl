#!/usr/bin/swipl
% vim: set filetype=prolog: ts=2 sw=2 sts=2 expandtab:cindent:formatoptions+=cro %

:- op(700, xfx, equals).

equals(X equals Y) :- X == Y.
