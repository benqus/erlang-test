-module(hello).
-export([world/1]).


get_gender(male) -> "Mr.";
get_gender(female) -> "Mrs.".


join({First, Last}) -> string:join([First, Last], " ");
join({Pre, First, Last}) -> join({Pre, join({First, Last})}).


print(String) ->
    io:format("Hello ~s!~n", [String]).


world({First, Last}) ->
    FullName = join({First, Last}),
    print(FullName);

world({First, Last, Gender}) ->
    Pre = get_gender(Gender),
    FullName = join({Pre, First, Last}),
    print(FullName).
