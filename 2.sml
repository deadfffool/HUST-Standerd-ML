
fun printInt (a:int) =
    print(Int.toString(a)^" ");

fun printReal (a:real) =
    print(Real.toString(a)^" ");

fun printString (a:string) =
    print(a^" ");

fun getInt () =
    Option.valOf (TextIO.scanStream (Int.scan StringCvt.DEC) TextIO.stdIn);
    
fun getReal () =
    Option.valOf (TextIO.scanStream (Real.scan) TextIO.stdIn);
    
(*****Begin*****)
val m = getInt();
val n = getInt();
fun gcd(a, b) =
    if b = 0 then a
    else gcd(b, a mod b);
val result = gcd(n, m);
printInt result;
(*****End*****)
