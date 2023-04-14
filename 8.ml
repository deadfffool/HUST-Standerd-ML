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
val x1 = getIntInf();
val y1 = getIntInf();
val x2 = getIntInf();
val y2 = getIntInf();
val son = x1 * y2 + x2 * y1;
val parent = y1 * y2;
fun gcd(a : IntInf.int, b : IntInf.int) =
    if b = 0 then a
    else gcd(b, a mod b);
val a = gcd(son, parent);
printIntInf(son div a);
printIntInf(parent div a); 
(*****End*****)
