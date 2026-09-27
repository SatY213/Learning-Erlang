-module(tut2).
-export([convert/2]).

% M is variable, inch is atom
convert(M, inch) ->
    M / 2.54;

convert(N, centimeter) ->
    N * 2.54.

% Execution:
% 1> c(tut2).
% 2> tut2:convert(10, inch).
% 3> tut2:convert(10, centimeter).