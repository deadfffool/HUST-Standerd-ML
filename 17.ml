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
fun compare([], n) = (0, n)
    | compare(x :: xs, n) =
    if(hd xs > x) then compare(xs, n + 1)
    else (hd xs, n+1);

fun findp([], n : int, x1 : int) = (0,n)
    | findp(x :: xs, n : int , x1 : int ) = 
    if(x > x1) then (x,n)
    else findp(xs, n + 1, x1);
    
val v1 = compare(list, 0);
val x1 = #1 v1 ;
val n1 = #2 v1;
val v2 = findp(list, 0, x1);
val x2 = #1 v2 ;
val n2 = #2 v2;

val p1 = List.take(list,n2);
val p2 = List.take(List.drop(list,n2+1),n1-n2-1);
val p3 = List.drop(list,n1+1);

val p4 = List.rev(p1 @ (x1 :: []) @ p2);
printIntTable(p4 @ (x2 :: []) @ p3);

printIntTable(List.take(list,0));
(*****End*****)
