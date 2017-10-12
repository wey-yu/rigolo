module rigolo

import gololang.Errors
import spark.Spark

augment spark.Response {
  function json = |this, content| {
    this: type("application/json;charset=UTF-8")
    return gololang.JSON.stringify(content)
  }
}

function main = |args| {
  let port =  Integer.parseInt(System.getenv(): get("PORT")) orIfNull 9090
  
  Spark.setPort(port)

  get("/", |request, response| -> trying({
    return DynamicObject(): message("🐼 ❤️ Golo")
  })
  : either(
    |content| -> response: json(content),
    |error| -> response: json(DynamicObject(): message(error: message()))
  ))

  println("🌍 listening on " + port + "...")

}
