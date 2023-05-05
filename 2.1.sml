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
fun insert (x:int,[])=[x]
    | insert (x,xk::xs)=
        if x<=xk then x::xk::xs
        else xk::insert(x,xs);

fun ite_insert ([],l:int list)=l
    | ite_insert (x::xs,l)=
            ite_insert (xs,insert(x,l));

fun sort(l)=ite_insert(l,[]);

val n=getInt();
val tit=getIntTable(n);
val ans=sort(tit);
printIntTable(ans);		
(*****End*****)

