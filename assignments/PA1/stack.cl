(*
 *  CS164 Fall 94
 *
 *  Programming Assignment 1
 *    Implementation of a simple stack machine.
 *
 *  Skeleton file
 *)

class Stack inherits IO{
   (*
   * 一个字符串即为整个栈的内存空间，每个栈帧占据多个字符，一个栈帧有两部分组成：
   * 1. 栈内容 2. 3位的上一个栈帧的尾部内存索引（这个位置会是上一个栈帧的2索引或是栈顶）
   *)
   container : String <- "";
   pointer : Int <- ~3; --栈顶指针，指向最后一个栈帧的索引位第一位，初始时为栈顶-3
   atoi : A2I <- new A2I;

   (* show(flag:Bool) : look up all the frame in the stack
    * in a top to bottom order
    * with blank line as a seperator
    * return a String same to the output
    * set output flag true to output the result to standard IO
    *)
   show(flag : Bool) : String{
      let i : Int <- pointer, last : Int, out : String <- "" in
      {
         while 0 <= i loop{
            last <- atoi.a2i(container.substr(i, 3));
            out <- out.concat(container.substr(last+3, i-last-3)).concat("\n");
            i <- last;
         }pool;
         if flag then out_string(out) else self fi;
         out;
      }
   };

   (* isempty(): return true if the stack is empty, false if not *)
   isempty() : Bool{
      pointer = ~3
   };

   (* push(s:String): push String s to the stack 
    * with no return value
   *)
   push(s : String) : Object
   {
      let last : Int <- container.length() - 3 , index : String <- "" in
      {
         if last < 0 then index <- "-03" else
         {
            if last < 100 then index <- index.concat("0") else self fi;
            if last < 10 then index <- index.concat("0") else self fi;
            index <- index.concat(atoi.i2a(last));
         }fi;
         container <- container.concat(s.concat(index));
         pointer <- container.length() - 3;
      }
   };

   (* pop(): pop the stack's top frame 
    * return this frame's content
    * Trying to pop an empty stack will output error and abort
    *)
   pop() : String{
      if isempty()
      then
      {
         out_string("Error: popped empty stack\n");
         abort();
         "";
      }
      else
         let out : String <- "", last : Int in
         {
            last <- atoi.a2i(container.substr(pointer, 3));
            out <- container.substr(last + 3, pointer-last-3);
            container <- container.substr(0, container.length() - (pointer-last));
            pointer <- last;
            out;
         }
      fi
   };

   opr_add() : Int{
      1
   };
};

class Main inherits IO {

   s : Stack <- new Stack;
   lstc : String <- "";
   inp : String <- "";

   main() : Object 
   {
      {
         out_string("Welcome to my stack.\n");
         out_string("> ");
         inp <- in_string();   
         while not inp = "x" loop
         {
            if inp.length() = 0 then self else s.push(inp) fi;
            out_string("> ");
            inp <- in_string();
         }pool;
         s.show(true);
         while not s.isempty() loop s.pop() pool;
         s.show(true);
      }
   };

};

