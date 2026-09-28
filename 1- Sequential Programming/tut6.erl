-module(tut6).
-export([list_max/1]).

list_max([Head | Rest]) -> 
    list_max(Rest,Head).

list_max([], Res) ->
    Res;
list_max([Head|Rest], Result_so_far) when Head > Result_so_far ->
    list_max(Rest,Head);
list_max([Head|Rest], Result_so_far) ->
    list_max(Rest, Result_so_far).

% useful operators
% < less than
% > greater than
% == equal
% >= greater or equal
% =< less or equal
% /= not equal
% The | operator can also be used to add a head to a list: