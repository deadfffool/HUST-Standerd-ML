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
val sum = getInt();
val checkSum = getInt();
val vList = getIntVector(sum);
val vCheck = getIntVector(checkSum);
fun check(n : int, v : int vector, startN : int, endN : int) = 
    if startN <= endN then
        let val temp = (startN + endN) div 2
        in
        if n > Vector.sub(v, temp) then check(n, v, temp + 1, endN)
        else if n = Vector.sub(v, temp) then temp
        else check(n, v, startN, temp - 1)
        end
    else ~1;
fun fprint(v1 : int vector, v2 : int vector, n : int, i : int) = 
    if(n > 0) then
        let val h = printInt(check(Vector.sub(v2, i), v1, 0, Vector.length(v1) - 1))
        in fprint(v1, v2, n - 1, i + 1)
        end
    else 0;
fprint(vList, vCheck, checkSum, 0);

(*****End*****)

