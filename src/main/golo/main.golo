module rigolo

import gololang.Errors
import spark.Spark

augment spark.Response {
  function jsonPayLoad = |this, content| {
    this: type("application/json")
    return gololang.JSON.stringify(content)
  }
}

function main = |args| {
  let port = System.getenv(): get("PORT") orIfNull 9090

  Spark.setPort(port)

  get("/", |request, response| -> trying({
    return DynamicObject(): message("🐼 ❤️ Golo")
  })
  : either(
    |content| -> response: jsonPayLoad(content),
    |error| -> response: jsonPayLoad(DynamicObject(): message(error: message()))
  ))

  get("/hello", |request, response| -> trying({
    return DynamicObject(): message("Hello 🌍!")
  })
  : either(
    |content| -> response: jsonPayLoad(content),
    |error| -> response: jsonPayLoad(DynamicObject(): message(error: message()))
  ))

  println("🌍 listening on " + port)

}
