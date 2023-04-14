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
val a = getIntInf();
val n = getIntInf();
val m = getIntInf();
fun square p : IntInf.int =
    p * p;
fun quick (a : IntInf.int, n : IntInf.int, m : IntInf.int) : IntInf.int = 
    if n = 0 then 1
    else if n mod 2 = 0 then square((quick(a, n div 2, m) mod m)) mod m
    else square(quick(a, (n - 1) div 2, m)) * a mod m;
printIntInf(quick(a, n, m)); 
(*****End*****)
