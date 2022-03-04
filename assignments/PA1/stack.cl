(*
 *  CS164 Fall 94
 *
 *  Programming Assignment 1
 *    Implementation of a simple stack machine.
 *
 *  Skeleton file
 *)


class Stack inherits IO{
   container : String <- "";--类属性后面要有分号
   pointer : Int <- ~1;

   show() : String{--只有方法后面的花括号里没有分号
      let i : Int <- pointer, out : String <- "" in
      {
         while 0 <= i loop{
            out <- out.concat(container.substr(i, 1)).concat("\n");
            i <- i-1;
         }pool;
         out;
      }
   };

   push(s : String) : String
   {
      {
         --out_string("Entered push\n");
         let i : Int <- 0, len : Int <- s.length() in 
            while not i = len loop{--一般的花括号要有分号
               pointer <- pointer + 1;
               container <- container.concat(s.substr(i, 1));
               i <- i + 1;
            }pool;
         --out_string("now container\n");
         --out_string(container);
         --out_string("\n");
         container;
      }
   };
};

class Main inherits IO {

   s : Stack <- new Stack;
   lstc : String <- "";
   inp : String <- "";

   main() : Object 
   {
      {
         out_string("Welcome to my stack\n");   
         while not lstc = "x" loop
         {
            out_string("> ");
            inp <- in_string();
            --out_int(inp.length());
            let i : Int <- 0, len : Int <- inp.length() in
            {
               while not i = len 
               loop
                  if inp.substr(i, 1) = "x" 
                  then 
                  {
                     len <- i+1;
                     i <- i+1;
                  } 
                  else
                  {
                     if inp.substr(i, 1) = "d" 
                     then 
                     {
                        --out_string("trying to out \n");
                        out_string(s.show());
                     }
                     else
                     {
                        --out_string(inp.substr(i, 1));
                        s.push(inp.substr(i, 1));
                        self;
                     }fi;
                     i <- i + 1;
                  }fi
               pool;
               lstc <- if 0 < i then inp.substr(i - 1, 1) else "" fi; 
            };
         }pool;
      }
   };

};

