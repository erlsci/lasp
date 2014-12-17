-define(TIMEOUT, 100000).

-define(BUCKET, <<"derflow">>).
-define(BACKEND, derflow_ets).

-define(N, 1).
-define(W, 1).
-define(R, 1).

-define(PROGRAM_N, 3).
-define(PROGRAM_W, 2).
-define(PROGRAM_R, 2).

-record(derflow_execute_request_v1, {
        module :: atom(),
        req_id :: non_neg_integer(),
        caller :: pid()}).

-define(EXECUTE_REQUEST, #derflow_execute_request_v1).

-record(dv, {value,
             next,
             waiting_threads = [],
             binding_list = [],
             creator,
             type,
             lazy = false,
             bound = false}).

-define(LATTICES, [riak_dt_gset, riak_dt_gcounter]).

-type module() :: atom().
-type file() :: iolist().
-type registration() :: preflist | global.
-type id() :: atom().
-type result() :: term().
-type type() :: undefined | riak_dt_gset | riak_dt_gcounter.
-type lattice() :: riak_dt_gset | riak_dt_gcounter.
-type value() :: term().
-type func() :: atom().
-type args() :: list().
-type bound() :: true | false.
-type supervisor() :: pid().
-type stream() :: list(#dv{}).
-type store() :: ets:tid().
-type threshold() :: value() | {strict, value()}.
-type pending_threshold() :: {threshold, pid(), lattice(), threshold()}.
-type operation() :: {atom(), value()}.
-type operations() :: list(operation()).
