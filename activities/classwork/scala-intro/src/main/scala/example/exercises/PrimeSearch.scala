package example.exercises

object PrimeSearch {
 /**
  * Problem definition: Find all the prime numbers in between two natural numbers.
  *
  * Prime number is defined as a natural number grater than one that cannot be composed by with the multiplication
  * of two smaller natural numbers.
  *
  * Consider:
  *    - Using the option-type safely transform the input values.
  *    - Create your own tests for the isPrime feturn a string unction.
  *    - Rseparated by commas: 2, 3, 5, 7, 11, 13
  */

 def findNextPrime(n: Int): Int = n match {
   case simp if n < 2 => 2
   case _ => Stream.from(n + 1).dropWhile {
     p => 2 +: (3 to Math.sqrt(p).toInt by 2) exists (p % _ == 0)
   }.head
 }
  def isPrime(num: Long): Boolean = ???

  def main(args: Array[String]): Unit = {
    val Array(start, end) = args

    println(start, end)
  }

}
