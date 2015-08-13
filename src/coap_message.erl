%
% This Source Code Form is subject to the terms of the Mozilla Public
% License, v. 2.0. If a copy of the MPL was not distributed with this
% file, You can obtain one at http://mozilla.org/MPL/2.0/.
%
% Copyright (C) 2015 Petr Gotthard <petr.gotthard@centrum.cz>
%

% convenience functions for message construction
-module(coap_message).
-export([non/0, non/1, ack/1, response/2, response/3, content/3]).

-include("coap.hrl").

non() ->
    #coap_message{
        type=non
    }.

non(Request) ->
    #coap_message{
        type=non,
        token=Request#coap_message.token
    }.

ack(Request) ->
    #coap_message{
        type=ack,
        id=Request#coap_message.id,
        token=Request#coap_message.token
    }.

response(Method, Message) ->
    Message#coap_message{method=Method}.

response(Method, Payload, Message) ->
    Message#coap_message{method=Method, payload=Payload}.

content(Type, Payload, Message) ->
    Message#coap_message{
        method=content,
        options=[{content_format, [Type]}|Message#coap_message.options],
        payload=Payload
    }.

% end of file