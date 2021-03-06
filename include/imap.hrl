-include_lib("eunit/include/eunit.hrl").

-record(state_data, {socket,
                     socket_type,
                     enqueued_commands = [],
                     server_capabilities = [],
                     commands_pending_response = dict:new(),
                     untagged_responses_received = []}).

% uncomment this if you want to enable debug mode
%-define(DEBUG, true).

%-ifdef(debug).
%    -define(LOG_DEBUG(Format, Data), ?LOG_INFO("*** DEBUG ~p:~p " ++ Format ++ " ***", [?MODULE, ?LINE | Data])).
%    -define(LOG_ERROR(Fun, Format, Data), error_logger:error_msg("~p:~p(): " ++ Format ++ "~n", [?MODULE, Fun] ++ Data)).
%    -define(LOG_WARNING(Fun, Format, Data), error_logger:warning_msg("~p:~p(): " ++ Format ++ "~n", [?MODULE, Fun] ++ Data)).
%    -define(LOG_INFO(Format, Data), error_logger:info_msg(Format ++ "~n", Data)).
%-else.
%    -define(LOG_DEBUG(Format, Data), true).
%    -define(LOG_ERROR(Fun, Format, Data), true).
%    -define(LOG_WARNING(Fun, Format, Data), true).
%    -define(LOG_INFO(Format, Data), true).
%-endif.
-define(LOG_DEBUG(Format, Data), true).
-define(LOG_ERROR(Fun, Format, Data), true).
-define(LOG_WARNING(Fun, Format, Data), true).
-define(LOG_INFO(Format, Data), true).

-define(t2b(T), term_to_binary(T)).
-define(b2t(B), binary_to_term(B)).
-define(l2b(L), list_to_binary(L)).
-define(b2l(B), binary_to_list(B)).
-define(l2a(L), list_to_atom(L)).
-define(a2l(A), atom_to_list(A)).
-define(l2i(L), list_to_integer(L)).
-define(i2l(I), integer_to_list(I)).

%% @type mailbox() = #mailbox{name = list(),
%%			      flags = list(),
%%			      permflags = list(),
%%			      exists = integer(),
%%			      messages = integer(),
%%			      recent = integer(),
%%			      unseen = integer(),
%%			      uidvalidity = integer(),
%%			      uidnext = integer(),
%%			      myrights = list(),
%%			      readwrite = boolean(),
%%			      highestmodseq = integer()}
-record(mailbox,{
    name          = [],
    flags         = [],
    permflags     = [],
    exists        = 0,
    messages      = 0,
    recent        = 0,
    unseen        = 0,
    uidvalidity   = 0,
    uidnext       = 0,
    myrights      = [],
    readwrite     = false,
    highestmodseq = 0
    }).

