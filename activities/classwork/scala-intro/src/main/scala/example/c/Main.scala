package example.c

import example.c.model.Box
object Main {

  val numbers: List[Int] = List(1,2,3,4,5)
  def procedure: Box[Int]=
    numbers.map(num => Box(num).foldRight(Box(0))){
      case (elm, z) => z.concat(elm).map(_.toInt)
    }
  def main(args: Array[String]): unit = args match{
    case valid if args.length > 0 => procedure(args.map(_.toInt)).show()
      case_=>printInt("Invalis argument.")
  }
  //def procedure Int = numbers.foldRight(0){case (elm,acc) => elm + acc}

}
