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
val m = getIntInf();
fun mem (a : IntInf.int,b : IntInf.int,m : IntInf.int) =
    ((a+b) mod m, a mod m , m)
fun f (a : IntInf.int,m : IntInf.int) =
    if a=1 then (1,0,m)
    else if a=2 then (1,1,m)
    else mem(f(a-1,m));
val result = f(n,m);
val result1 = #1 result;
printIntInf(result1);
(*****End*****)
