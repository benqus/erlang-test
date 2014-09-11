-module(loops).
-export([times/2, for/4, until/3]).

%%
%% times
%%

%% Example:
%%
%% loops:times(
%%     5,
%%     fun() -> io:format('log') end
%% ).
%%
times(1, Fun) -> Fun();
times(Times, Fun) ->
    Fun(),
    times(Times - 1, Fun).

%%
%% for
%%

%% Example:
%%
%% loops:for(
%%     0,
%%     5,
%%     1,
%%     fun() -> io:format('log') end
%% ).
%%
for(Start, End, Step, Fun) ->
    if
        Start < End ->
            Fun(),
            for(Start + Step, End, Step, Fun);
        true -> ok
    end.

%%
%% until
%%

%% Example:
%%
%% loops:until(
%%     3,
%%     fun(Start) ->
%%         io:format('log'),
%%         Start + 1
%%     end,
%%     0
%% ).
%%
until(End, Fun, Start) ->
    Return_value = Fun(Start),

    if
        Return_value =/= End -> until(End, Fun, Return_value);
        Return_value == ok -> ok;
        true -> ok
    end.
