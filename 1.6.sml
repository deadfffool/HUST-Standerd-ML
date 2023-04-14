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

fun printEndOfLine () =
    print("\n");

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
val l1 = getIntTable(x1);
val x2 = getInt();
val l2 = getIntTable(x2);
val a1 = Array.fromList(l1);
val lena = Array.length(a1);
val a2 = Array.fromList(l2);
val lenb = Array.length(a2);
val a = lenb + lena + 2;
val b1 = Array.array(a, 0);
val b2 = Array.array(a, 0);
fun max(x1 : int, x2 : int) = 
if x1 > x2 then x1
else x2;

fun min(x1 : int, x2 : int) = 
if x1 > x2 then x2
else x1;

fun plus(a1, a2, y1 : int, y2 : int, a : int, b)= 
if max(y1, y2) = ~1 then b
else if y1 = ~1 andalso y1 < y2 then 
let val k = Array.sub(a2, y2) + Array.sub(b, a - 1)
in if k > 9 andalso (a - 2) >= 0 then (Array.update(b, a - 1, k - 10); Array.update(b, a - 2, Array.sub(b, a - 2) + 1))
    else Array.update(b, a - 1, k);
plus(a1, a2, y1, y2 - 1, a - 1, b)
end
else if y2 = ~1 andalso y1 >= y2 then 
let val k = Array.sub(a1, y1) + Array.sub(b, a - 1)
in if k > 9 andalso (a - 2) >= 0 then (Array.update(b, a - 1, k - 10); Array.update(b, a - 2, Array.sub(b, a - 2) + 1))
    else Array.update(b, a - 1, k);
plus(a1, a2, y1 - 1, y2, a - 1, b)
end
else
let val k = Array.sub(a1, y1) + Array.sub(a2, y2) + Array.sub(b, a - 1)
in if k > 9 andalso (a - 2) >= 0 then (Array.update(b, a - 1, k - 10); Array.update(b, a - 2, Array.sub(b, a - 2) + 1))
    else Array.update(b, a - 1, k);
plus(a1, a2, y1 - 1, y2 - 1, a - 1, b)
end;


fun printt(b, n : int, m : int, sign : int) =
if n < m then let val k = Array.sub(b,n)
in
    if(k <= 0 andalso sign = 1) then printt(b, n + 1, m, sign)
    else (printInt(k);
    printt(b, n + 1, m, 0)) 
end
else if sign = 1 then printInt(0)
else ();

printt(plus(a1, a2, lena - 1, lenb - 1, a, b2), 0, a, 1);
printEndOfLine();

fun minus(a1, a2, y1 : int, y2 : int, a : int, b) =
if min(y1, y2) = ~1 then b
else
let val k1 = Array.sub(a1, y1) - Array.sub(a2, y2) + Array.sub(b, a - 1)
in if k1 < 0 then (Array.update(b, a - 1, 10 + k1); Array.update(b, a - 2, Array.sub(b, a - 2) - 1))
else Array.update(b, a - 1, k1);
minus(a1, a2, y1 - 1, y2 - 1, a - 1, b)
end;

printt(minus(a1, a2, lena - 1, lenb - 1, a, b1), 0, a, 1);
printEndOfLine();

fun mul(a1, a2, y1 : int, y2 : int, x1 : int, x2 : int, b, x : int) = 
let val k1 = Array.sub(b, y1 + y2 - 1) + Array.sub(a1, y1) * Array.sub(a2, y2)
in Array.update(b, y1 + y2 - 1, k1);
    Array.update(b, y1 + y2, Array.sub(b, y1 + y2) + k1 div 10);
    Array.update(b, y1 + y2 - 1, k1 mod 10);
if (y1 <= x1 andalso y2 < x2) then
mul(a1, a2, y1, y2 + 1, x1, x2, b, x)
else if (y2 = x2 andalso y1 < x1) then mul(a1, a2, y1 + 1, 1, x1, x2, b, x)
else b
end;


val l3 = l1 @ [0];
val l4 = l2 @ [0]; 
val a1 = Array.fromList(List.rev(l3));
val lena = Array.length(a1) - 1;
val a2 = Array.fromList(List.rev(l4));
val lenb = Array.length(a2) - 1;
val b3 = Array.array(lena + lenb + 1, 0);
val b4 = mul(a1, a2, 1, 1, lena, lenb, b3, 0);
fun lenc(b, l : int) = 
if (Array.sub(b, l) = 0 andalso l >= 1) then lenc(b, l - 1)
else l;
fun p(b, l) =
if l >= 1 then (printInt(Array.sub(b, l)); p(b, l - 1))
else ();
val k = lenc(b4, lena + lenb);
if k > 0 then p(b4, k)
else printInt(0);


(*****End*****)

