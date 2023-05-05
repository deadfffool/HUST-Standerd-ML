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

(*****Begin*****)
val n = getIntInf();
fun cal (n : IntInf.int, m : IntInf.int) = 
    if n = 0 then m
    else cal (n - 1, getIntInf() + m);
val m = getIntInf();
val result = cal(n - 1, m);
printIntInf(result);
(*****End*****)
