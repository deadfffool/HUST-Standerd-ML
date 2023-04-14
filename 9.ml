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
val m = getInt();
val n = getInt();
val p = n - m;
fun makeList (0, m) = []
    | makeList(p, m) =
        m :: makeList(p - 1, m + 1);
fun printList([]) = ()
    | printList(x :: xs) =
    let 
val a = printInt(x)
    in
printList(xs)
    end;
printList(makeList(p + 1, m));
(*****End*****)

