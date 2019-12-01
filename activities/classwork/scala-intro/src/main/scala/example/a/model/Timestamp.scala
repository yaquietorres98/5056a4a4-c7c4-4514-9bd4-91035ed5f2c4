

package example.a.model



case class Timestamp(seconds: Int){

  def +(other: Timestamp): Timestamp =

    Timestamp(seconds + other.seconds)

  //def add(other: Timestamp): Timestamp =

  //Timestamp(seconds + other.seconds)

}



object Timestamp {

  val secondsInHour: Int = 60*60

  val secondsInMinutes: Int = 60



  def apply(hours:Int, minutes: Int, seconds: Int): Timestamp =

    Timestamp(seconds= secondsInHour*hours + secondsInMinutes*minutes + seconds)




}