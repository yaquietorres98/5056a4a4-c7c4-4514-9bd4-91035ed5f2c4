package example.c.model



case class Box[A](value: A) {



  def show(): Unit = print(value)

  def map[B](f: A => B): Box[B] = Box(f(value))



  def flatMap[B](fn: A=> Box[B]): Box[B] = fn(value)



  def concat(other: Box[A]): Box[String]=

    Box(value,toString + other.value.toString)



}