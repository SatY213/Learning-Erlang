-module(tut14).
-export([start/0, say_something/2]).

say_something(_What, 0) ->
    done;

say_something(What,Times) ->
    io:format("~p~n",[What]), %p is used instead of w to quote it allows to break terms whose printed into many lines and indents each line sensibly
    say_something(What,Times -1).

start() ->
    spawn(tut14, say_something, [hello, 3]),
    spawn(tut14, say_something, [goodbye,3]).