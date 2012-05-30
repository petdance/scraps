% Notes from Kevin A. Smith's Erlang talk
% In Erlang, create processes like you would create objects in another language.

% Three terminators:   , ; and .  not too different from English.

% Erlang variables are WORMy.  A = A + 1 is wrong

[First|Rest] = [1,2,3,4,5]



% List comprehensions

A = [1,2,3,4,5]
[X * 2 || X <- A].

[X || X <- A, X rem 2 == 0].


% functions

even_or_odd(Num) ->
    if
        Num rem 2 == 0 ->
            even;
        true ->
            odd
    end.


even_or_odd(N) when N rem 2 == 0 ->
    even;

even_or-odd(N) ->
    odd.

% Looping
% There is no looping, only recursion.

print([H|T]) ->
    io:format("~p~n", [H]),
    print(T);

print([]) ->
    ok.

% if statements are rare

if
    A == 5 ->
        do_something();
    true ->
        do_something_else()
end.

% case statements

case A of
    0 ->
        first();
    1 ->
        second();
    _ ->
        third()
end.

% Message passing

Pid ! "hello, world".

%% receiver

-module(test).
-compile([export_all]).

printer() ->
    receive
        {message, Message} ->
            io:format("-p receieved: ~p~n",
                [self(), Message]),
            printer();
        stop ->
            ok
    end.

P = spawn(fun() -> test:printer() end).
P.

P = spawn(fun() -> test:printer() end).
P | {message, "Hello, world!"}.
