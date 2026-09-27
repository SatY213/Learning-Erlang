-module(color).

-export([new/4, blend/2]).

% Map keys: red, green, blue, alpha 
% This file teaches how to use maps in Erlang. The color is represented as a map with keys for red, green, blue, and alpha channels. Each channel value is a float between 0.0 and 1.0.
-define(is_channel(V), (is_float(V) andalso V >= 0.0 andalso V =< 1.0)).

new(R,G,B,A) when ?is_channel(R), ?is_channel(G),
                  ?is_channel(B), ?is_channel(A) ->
    #{red => R, green => G, blue => B, alpha => A}.

blend(Src,Dst) ->
    blend(Src,Dst,alpha(Src,Dst)).

blend(Src,Dst,Alpha) when Alpha > 0.0 ->
    Dst#{
        red   := red(Src,Dst) / Alpha,
        green := green(Src,Dst) / Alpha,
        blue  := blue(Src,Dst) / Alpha,
        alpha := Alpha
    };
blend(_,Dst,_) ->
    Dst#{
        red   := 0.0,
        green := 0.0,
        blue  := 0.0,
        alpha := 0.0
    }.

alpha(#{alpha := SA}, #{alpha := DA}) ->
    SA + DA*(1.0 - SA).

red(#{red := SV, alpha := SA}, #{red := DV, alpha := DA}) ->
    SV*SA + DV*DA*(1.0 - SA).
green(#{green := SV, alpha := SA}, #{green := DV, alpha := DA}) ->
    SV*SA + DV*DA*(1.0 - SA).
blue(#{blue := SV, alpha := SA}, #{blue := DV, alpha := DA}) ->
    SV*SA + DV*DA*(1.0 - SA).