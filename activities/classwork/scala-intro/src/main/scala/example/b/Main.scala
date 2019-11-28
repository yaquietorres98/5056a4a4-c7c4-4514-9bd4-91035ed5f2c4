package example.b

object Main {
  def main(args: Array[String]): Unit= {
    args match {
      case Array (familyName) => printInt(familyName)
      case Array (familyName, nameA) =>
        val a = Person(nameA, familiName, gender = Person.Gender.underfined)
        printInt(a)
      case Array(familyName, nameA, nameB) =>
        val a = Person(nameA, familyName, gender= Person.Gender.undefined)
        val b = Person(nameB, familyName, gender= Person.Gender.undefined)
        print(a.greeting(b))
      case _=> printIn("Invalid arguments")
    }
  }

}
