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

(*****Begin*****)
val num = getInt();
val list = getIntTable(num);
fun compare([], n) = (0, 0)
    | compare(x :: xs, n) =
    if(hd xs > x) then compare(xs, n + 1)
    else (hd xs, n);
fun findp([], n, x1) = 0
    | findp(x :: xs, n, x1) = 
    if(x > x1) then (x)
    else findp(xs, n + 1, x1);
fun exchange([], x1 : int, x2 : int) = []
    |exchange(x :: xs, x1 : int, x2 : int) =
    if x = x1 then x2 :: exchange(xs, x1, x2)
    else if x = x2 then x1 :: exchange(xs, x1, x2)
    else x :: exchange(xs, x1, x2);
val v1 = compare(list, 0);
val x1 = #1 v1;
val x2 = findp(list, 0, x1);
val p1 = exchange(list, x1, x2);
val p2 = List.take(p1, #2 v1 + 1);
val p3 = List.drop(p1, #2 v1 + 1);
val p4 = List.rev(p2);
val result = p4 @ p3;
printIntTable(result);
(*****End*****)
