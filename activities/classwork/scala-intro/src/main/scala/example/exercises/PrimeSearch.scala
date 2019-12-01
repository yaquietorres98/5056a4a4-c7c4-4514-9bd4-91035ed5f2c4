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
  *    - Create your own tests for the isPrime function.
  *    - Return a string separated by commas: 2, 3, 5, 7, 11, 13
  */


 def isPrime(i: Int): Boolean = {

   if (i <= 1)

     false

   else if (i == 2)

     true

   else

     !(2 to (i - 1)).exists(x => i % x == 0)

 }                                               //> isPrime: (i: Int)Boolean

  def getListOfPrimesToN(n : Int) = {



  }
