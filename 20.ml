fun printInt (a:int) =
    print(Int.toString(a)^" ");

fun printIntInf (a:IntInf.int) =
    print(IntInf.toString(a)^" ");


fun printReal (a:real) =
    print(Real.toString(a)^" ");

fun printString (a:string) =
    print(a^" ");

fun getInt () =
    Option.valOf (TextIO.scanStream (Int.scan StringCvt.DEC) TextIO.stdIn);

fun getIntInf () =
    Option.valOf (TextIO.scanStream (IntInf.scan StringCvt.DEC) TextIO.stdIn);

fun getReal () =
    Option.valOf (TextIO.scanStream (Real.scan) TextIO.stdIn);


fun printIntTable ( [] ) = ()
  | printIntTable ( x::xs ) = 
    let
	val tmp = printInt(x)
    in
	printIntTable(xs)
    end;

fun printIntInfTable ( [] ) = ()
  | printIntInfTable ( x::xs ) = 
    let
	val tmp = printIntInf(x)
    in
	printIntInfTable(xs)
    end;

fun getIntTable ( 0 ) = []
  | getIntTable ( N:int) = getInt()::getIntTable(N-1);

fun getIntInfTable ( 0 ) = []
  | getIntInfTable ( N:int) = getIntInf()::getIntInfTable(N-1);

fun getIntVector ( 0 ) =  Vector.fromList []
  | getIntVector ( N:int) = Vector.fromList(getIntTable(N));

fun getIntInfVector ( 0 ) = Vector.fromList []
  | getIntInfVector ( N:int) = Vector.fromList(getIntInfTable(N));


(*****Begin*****)
val x1 = getInt();
val y1 = getInt();
val x2 = getInt();
val y2 = getInt();
fun cross(x2 : int, y2 : int, i : int, j : int) = 
    if i = 0 andalso j = 0 then 1
    else if (i = x2 andalso j = y2) orelse
    (i = x2 - 2 andalso (j = y2 - 1 orelse j = y2 + 1)) orelse
    (i = x2 + 2 andalso (j = y2 - 1 orelse j = y2 + 1)) orelse
    (i = x2 - 1 andalso (j = y2 - 2 orelse j = y2 + 2)) orelse
    (i = x2 + 1 andalso (j = y2 - 2 orelse j = y2 + 2)) orelse
    (i < 0 orelse j < 0) then 0
    else if (j = 0 andalso i = 0)  then 1
    else cross(x2, y2, i - 1, j) + cross(x2, y2, i, j - 1);
printInt(cross(x2, y2, x1, y1));
(*****End*****)

