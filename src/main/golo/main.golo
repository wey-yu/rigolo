module rigolo

import spark.Spark

function main = |args| {
  let port =  Integer.parseInt(System.getenv(): get("PORT")) orIfNull 8080
  Spark.setPort(port)

  get("/", |request, response| {
    response: type("application/json;charset=UTF-8")
    return gololang.JSON.stringify(DynamicObject(): message("🐼 ❤️ Golo"))
  })
  
  println("🌍 listening on " + port + "...")

}
