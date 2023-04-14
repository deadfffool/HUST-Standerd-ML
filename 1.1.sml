fun printInt (a:int) =
    print(Int.toString(a)^" ");

fun getInt () =
    Option.valOf (TextIO.scanStream (Int.scan StringCvt.DEC) TextIO.stdIn);

fun printIntTable ( [] ) = ()
  | printIntTable ( x::xs ) = 
    let
	val tmp = printInt(x)
    in
	printIntTable(xs)
    end;

fun getIntTable ( 0 ) = []
  | getIntTable ( N:int) = getInt()::getIntTable(N-1);

(*****Begin*****)			 
val sum = getInt();
val list = getIntTable(sum);
val arr = Array.fromList(list);
fun sortA(arr, i : int, n : int) = 
    if i < n andalso Array.sub(arr, i) > Array.sub(arr, i + 1) then
    let 
    val x1 = Array.sub(arr, i)
    in
    Array.update(arr, i, Array.sub(arr, i + 1));
    Array.update(arr, i + 1, x1);
    sortA(arr, i + 1, n)
    end
    else if i < n andalso Array.sub(arr, i) <= Array.sub(arr, i + 1) then sortA(arr, i + 1, n)
    else Array.array(0, 1);
fun sortAll(arr, i, n) = 
    if i < n then sortAll(sortA(arr, i, n), i + 1, n)
    else Array.array(0, 1);
val array = sortAll(arr, 1, sum);

(*****End*****)

