%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% @doc
%%% @end
%%% @author Thomas Järvstrand <tjarvstrand@gmail.com>
%%% @copyright
%%% Copyright 2012 Thomas Järvstrand <tjarvstrand@gmail.com>
%%%
%%% This file is part of EDTS.
%%%
%%% EDTS is free software: you can redistribute it and/or modify
%%% it under the terms of the GNU General Public License as published by
%%% the Free Software Foundation, either version 3 of the License, or
%%% (at your option) any later version.
%%%
%%% EDTS is distributed in the hope that it will be useful,
%%% but WITHOUT ANY WARRANTY; without even the implied warranty of
%%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%%% GNU General Public License for more details.
%%%
%%% You should have received a copy of the GNU General Public License
%%% along with EDTS. If not, see <http://www.gnu.org/licenses/>.
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%_* Module declaration =======================================================
-module(edts).

%%%_* Exports ==================================================================

%% API
-export([ init_node/1
        , is_edts_node/1
        , modules/1
        , nodes/0]).

%%%_* Includes =================================================================

%%%_* Defines ==================================================================

%%%_* Types ====================================================================

%%%_* API ======================================================================

%%------------------------------------------------------------------------------
%% @doc
%% Initializes a new edts node.
%% @end
%%
-spec init_node(node()) -> ok.
%%------------------------------------------------------------------------------
init_node(Node) ->
  edts_server:init_node(Node).

%%------------------------------------------------------------------------------
%% @doc
%% Returns true iff Node is registered with this edts instance.
%% @end
%%
-spec is_edts_node(node()) -> boolean().
%%------------------------------------------------------------------------------
is_edts_node(Node) ->
  edts_server:is_edts_node(Node).

%%------------------------------------------------------------------------------
%% @doc
%% Returns a list of all erlang modules available on Node.
%% @end
%%
-spec modules(node()) -> [module()].
%%------------------------------------------------------------------------------
modules(Node) ->
  edts_server:ensure_node_initialized(Node),
  edts_dist:call(Node, edts_xref, modules).


%%------------------------------------------------------------------------------
%% @doc
%% Returns a list of the edts_nodes currently registered with this
%% edts-instance.
%% @end
%%
-spec nodes() -> [node()].
%%------------------------------------------------------------------------------
nodes() ->
  edts_server:nodes().

%%%_* Internal functions =======================================================

%%%_* Emacs ====================================================================
%%% Local Variables:
%%% allout-layout: t
%%% erlang-indent-level: 2
%%% End: