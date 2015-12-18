require! {
  underscore: _
  'lweb3/transports/client/nssocket': { nssocketClient }
  'lweb3/protocols/query': queryProtocol
  'validator2-extras': { v, ValidatedModel }
}

exports.idsclient = nssocketClient.extend4000 ValidatedModel,
  validator:
    host: v().default('localhpst').String()
    port: v().default(12312).Number()

  @on 'disconnect', ~> h.wait 1000, ~> @connect!

  

