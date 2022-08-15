`timescale 1us/1ns

module ALU_tb  () ;
  

// all design inputs are defined in testbench as reg to be used inside initial block 
// all design outputs are defined in testbench as wire   
  reg    [15:0]    A_tb;
  reg    [15:0]    B_tb;
  reg    [3:0]     ALU_FUN_tb;
  reg              CLK_tb;

  wire   [15:0]    ALU_OUT_tb;  
  wire             Arith_flag_tb ,Logic_flag_tb ,CMP_flag_tb ,Shift_flag_tb ;
  
  
//initial block
initial 
  begin
    $dumpfile("ALU.vcd") ;
    $dumpvars ;
    //initial values
    A_tb = 16'd10 ;      // 10 decimal 
    B_tb = 16'd20 ;          //20 decimal
    ALU_FUN_tb = 4'b0000 ;
    CLK_tb = 1'b0 ;
    
    $display ("TEST CASE 1 (Addition test)") ;  
    #10       //after a clock period 
    if (ALU_OUT_TB == 16'd30 && Arith_flag_tb == 1'b1 && Logic_flag_tb == 1'b0 && CMP_flag_tb== 1'b0 && Shift_flag_tb== 1'b0  ) 
      $display ("Addition test IS PASSED") ;
    else 
      $display ("Addition test IS FAILED") ;
  


    $display ("TEST CASE 2 (Subtraction test)") ;  
    A_TB = 16'd20;      //20 decimal
    B_TB = 16'd10;     // 10 decimal 
    ALU_FUN_TB = 4'b0001; 
    #10         //after a clock period
    if (ALU_OUT_TB == 16'd10 && Arith_flag_tb == 1'b1 && Logic_flag_tb == 1'b0 && CMP_flag_tb== 1'b0 && Shift_flag_tb== 1'b0)      
      $display ("Subtraction test IS PASSED") ; 
    else
      $display ("Subtraction test IS FAILED") ;


    $display ("TEST CASE 3 (Multiplication test)") ;  
    A_TB = 16'd20;      //20 decimal
    B_TB = 16'd10;     // 10 decimal 
    ALU_FUN_TB = 4'b0010; 
    #10         //after a clock period
    if (ALU_OUT_TB == 16'd200 && Arith_flag_tb == 1'b1 && Logic_flag_tb == 1'b0 && CMP_flag_tb== 1'b0 && Shift_flag_tb== 1'b0)      
      $display ("Multiplication test IS PASSED") ; 
    else
      $display ("Multiplication test IS FAILED") ;


    $display ("TEST CASE 4 (Division test)") ;  
    A_TB = 16'd20;      //20 decimal
    B_TB = 16'd10;     // 10 decimal 
    ALU_FUN_TB = 4'b0011; 
    #10         //after a clock period
    if (ALU_OUT_TB == 16'd2 && Arith_flag_tb == 1'b1 && Logic_flag_tb == 1'b0 && CMP_flag_tb== 1'b0 && Shift_flag_tb== 1'b0)      
      $display ("Division test IS PASSED") ; 
    else
      $display ("Division test IS FAILED") ;



    $display ("TEST CASE 5 (ANDING test)") ;  
    A_TB = 16'b1001;     
    B_TB = 16'b0011;     
    ALU_FUN_TB = 4'b0100; 
    #10         //after a clock period
    if (ALU_OUT_TB == 16'b0001 && Arith_flag_tb == 1'b0 && Logic_flag_tb == 1'b1 && CMP_flag_tb== 1'b0 && Shift_flag_tb== 1'b0)      
      $display ("ANDING test IS PASSED") ; 
    else
      $display ("ANDING test IS FAILED") ;


    
    $display ("TEST CASE 6 (ORING test)") ;  
    A_TB = 16'b1001;     
    B_TB = 16'b0011;     
    ALU_FUN_TB = 4'b0101; 
    #10         //after a clock period
    if (ALU_OUT_TB == 16'b1011 && Arith_flag_tb == 1'b0 && Logic_flag_tb == 1'b1 && CMP_flag_tb== 1'b0 && Shift_flag_tb== 1'b0)      
      $display ("ORING test IS PASSED") ; 
    else
      $display ("ORING test IS FAILED") ;



    

    $display ("TEST CASE 7 (NANDING test)") ;  
    A_TB = 16'b1001;     
    B_TB = 16'b0011;     
    ALU_FUN_TB = 4'b0110; 
    #10         //after a clock period
    if (ALU_OUT_TB == 16'hfffe && Arith_flag_tb == 1'b0 && Logic_flag_tb == 1'b1 && CMP_flag_tb== 1'b0 && Shift_flag_tb== 1'b0)      
      $display ("NANDING test IS PASSED") ; 
    else
      $display ("NANDING test IS FAILED") ;


    


    $display ("TEST CASE 8 (NORING test)") ;  
    A_TB = 16'b1001;     
    B_TB = 16'b0011;     
    ALU_FUN_TB = 4'b0111; 
    #10         //after a clock period
    if (ALU_OUT_TB == 16'hfff4 && Arith_flag_tb == 1'b0 && Logic_flag_tb == 1'b1 && CMP_flag_tb== 1'b0 && Shift_flag_tb== 1'b0)      
      $display ("NORING test IS PASSED") ; 
    else
      $display ("NORING test IS FAILED") ;




    $display ("TEST CASE 9 (XORING test)") ;  
    A_TB = 16'b1001;     
    B_TB = 16'b0011;     
    ALU_FUN_TB = 4'b1000; 
    #10         //after a clock period
    if (ALU_OUT_TB == 16'h000a && Arith_flag_tb == 1'b0 && Logic_flag_tb == 1'b1 && CMP_flag_tb== 1'b0 && Shift_flag_tb== 1'b0)      
      $display ("XORING test IS PASSED") ; 
    else
      $display ("XORING test IS FAILED") ;





    
    $display ("TEST CASE 10 (XNORING test)") ;  
    A_TB = 16'b1001;     
    B_TB = 16'b0011;     
    ALU_FUN_TB = 4'b1001; 
    #10         //after a clock period
    if (ALU_OUT_TB == 16'hfff5 && Arith_flag_tb == 1'b0 && Logic_flag_tb == 1'b1 && CMP_flag_tb== 1'b0 && Shift_flag_tb== 1'b0)      
      $display ("XNORING test IS PASSED") ; 
    else
      $display ("XNORING test IS FAILED") ;





    $display ("TEST CASE 11 (comp_equal test)") ;  
    A_TB = 16'd20;     //20 decimal
    B_TB = 16'd20;     //20 decimal
    ALU_FUN_TB = 4'b1010; 
    #10         //after a clock period
    if (ALU_OUT_TB == 16'd1 && Arith_flag_tb == 1'b0 && Logic_flag_tb == 1'b0 && CMP_flag_tb== 1'b1 && Shift_flag_tb== 1'b0)      
      $display ("comp_equal test IS PASSED") ; 
    else
      $display ("comp_equal test IS FAILED") ;




    
    $display ("TEST CASE 12 (comp_greater test)") ;  
    A_TB = 16'd20;     //20 decimal
    B_TB = 16'd10;     //10 decimal
    ALU_FUN_TB = 4'b1011; 
    #10         //after a clock period
    if (ALU_OUT_TB == 16'd2 && Arith_flag_tb == 1'b0 && Logic_flag_tb == 1'b0 && CMP_flag_tb== 1'b1 && Shift_flag_tb== 1'b0)      
      $display ("comp_greater test IS PASSED") ; 
    else
      $display ("comp_greater test IS FAILED") ;





    $display ("TEST CASE 13 (comp_smaller test)") ;  
    A_TB = 16'd10;     //10 decimal
    B_TB = 16'd20;     //20 decimal
    ALU_FUN_TB = 4'b1100; 
    #10         //after a clock period
    if (ALU_OUT_TB == 16'd3 && Arith_flag_tb == 1'b0 && Logic_flag_tb == 1'b0 && CMP_flag_tb== 1'b1 && Shift_flag_tb== 1'b0)      
      $display ("comp_smaller test IS PASSED") ; 
    else
      $display ("comp_smaller test IS FAILED") ;





    
    $display ("TEST CASE 14 (shift_right test)") ;  
    A_TB = 16'd10;     //10 decimal
    B_TB = 16'd20;     //20 decimal
    ALU_FUN_TB = 4'b1101; 
    #10         //after a clock period
    if (ALU_OUT_TB == 16'd5 && Arith_flag_tb == 1'b0 && Logic_flag_tb == 1'b0 && CMP_flag_tb == 1'b0 && Shift_flag_tb== 1'b1)      
      $display ("shift_right test IS PASSED") ; 
    else
      $display ("shift_right test IS FAILED") ;

    


    $display ("TEST CASE 15 (shift_left test)") ;  
    A_TB = 16'd10;     //10 decimal
    B_TB = 16'd20;     //20 decimal
    ALU_FUN_TB = 4'b1110; 
    #10         //after a clock period
    if (ALU_OUT_TB == 16'd20 && Arith_flag_tb == 1'b0 && Logic_flag_tb == 1'b0 && CMP_flag_tb== 1'b0 && Shift_flag_tb== 1'b1)      
      $display ("shift_left test IS PASSED") ; 
    else
      $display ("shift_left test IS FAILED") ;





    $display ("TEST CASE 16 (default test)") ;  
    A_TB = 16'd10;     //10 decimal
    B_TB = 16'd20;     //20 decimal
    ALU_FUN_TB = 4'b1111; 
    #10         //after a clock period
    if (ALU_OUT_TB == 16'd0 && Arith_flag_tb == 1'b0 && Logic_flag_tb == 1'b0 && CMP_flag_tb== 1'b0 && Shift_flag_tb== 1'b1)      
      $display ("default test IS PASSED") ; 
    else
      $display ("default test IS FAILED") ;

    #100         //after tens clock period

  end
// Clock Generator  with period =10us (100 KHz)
  always #5 CLK_tb = !CLK_tb ;
  
// instaniate design instance 
  ALU DUT (
    .A(A_tb),
    .B(B_tb),
    .ALU_FUN(ALU_FUN_tb),
    .CLK(CLK_tb),
    .ALU_OUT(ALU_OUT_tb),
    .Arith_flag(Arith_flag_tb),
    .Logic_flag(Logic_flag_tb),
    .CMP_flag(CMP_flag_tb),
    .Shift_flag(Shift_flag_tb)
  );

  
  endmodule
  