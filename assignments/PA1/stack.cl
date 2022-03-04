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

   show() : String{
      container--只有方法后面的花括号里没有分号
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
         out_string("Welcome to my stack\n> ");   
         while not lstc = "x" loop
         {
            inp <- in_string();
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
                     if inp.substr(i, 1) = "s" 
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
               lstc <- inp.substr(i - 1, 1); 
            };
         }pool;
      }
   };

};

