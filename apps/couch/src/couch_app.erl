% Licensed under the Apache License, Version 2.0 (the "License"); you may not
% use this file except in compliance with the License. You may obtain a copy of
% the License at
%
%   http://www.apache.org/licenses/LICENSE-2.0
%
% Unless required by applicable law or agreed to in writing, software
% distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
% WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
% License for the specific language governing permissions and limitations under
% the License.

-module(couch_app).

-behaviour(application).

-include("couch_db.hrl").

-export([start/2, stop/1]).
-export([get_app_env/2]).

start(_Type, _Args) ->
    couch_sup:start_link().

stop(_) ->
    ok.

get_app_env(Env, Default) ->
    case application:get_env(couch, Env) of
        {ok, Val} -> Val;
        undefined -> Default
    end.
