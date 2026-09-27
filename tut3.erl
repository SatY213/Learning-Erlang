-module(tut3).
-export([convert_length/1]).

% Tuple is a data structure that can hold multiple values. In this case, it holds a unit and a value.
convert_length({centimeter, X}) ->
     {inch, X / 2.54};

convert_length({inch, X}) ->
     {centimeter, X * 2.54}.
