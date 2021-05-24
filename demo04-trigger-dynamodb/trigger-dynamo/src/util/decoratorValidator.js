const decoratorValidator = (fn, schema, argsType) => {
  return async function (event) {
    // console.log('event', event)
    // console.log('schema', schema)
    // console.log('argsType', argsType)
    const data = JSON.parse(event[argsType])
    const { error, value } = await schema.validate(
      data, { abortEarly: false } // mostra todos os erros de uma vez
    )
    // altera a instancia de arguments
    event[argsType] = value

    // arguments serve pra pegar todos os argumentos que vieram na função
    // e mandar pra frente
    // o apply vai retornar a função que será executada posteriormente
    if(!error) return fn.apply(this, arguments)

    return {
      statusCode: 422,
      body: error.message
    }
  }
}
module.exports = decoratorValidator
