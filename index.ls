require! {
  helpers: h
  underscore: _
  backbone4000: Backbone
  'lweb3/transports/client/nssocket': { nssocketClient }
  'lweb3/transports/reconnecto': { reconnecto }
  'lweb3/protocols/query': queryProtocol
  'lweb3/core': { core }
  'validator2-extras': { v, ValidatedModel }
}


exports.idsclient = core.extend4000 do
  defaults:
    name: 'idsclient'
  initialize: ->
    @log 'init', {}, 'init'
    @connection = new reconnecto do
      logger: @logger
      defaultChannelClass: nssocketClient.extend4000 defaults: { host: @get('host'), port: @get('port') }

  send: (msg) ->
    @connection.send msg
