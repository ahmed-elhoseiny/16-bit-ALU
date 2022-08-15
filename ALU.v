module ALU (
input   wire   [15:0]    A,
input   wire   [15:0]    B,
input   wire   [3:0]     ALU_FUN,
input   wire             CLK,   

output  reg   [15:0]     ALU_OUT,
output  reg             Arith_flag,Logic_flag,CMP_flag,Shift_flag
); 

always @(posedge CLK)
begin
    Arith_flag <= 1'b0;
    Logic_flag <= 1'b0;
    CMP_flag <= 1'b0;
    Shift_flag <= 1'b0;
    
	case (ALU_FUN)
    4'b0000:begin
        ALU_OUT <= A+B;
        Arith_flag <= 1'b1;
    end 

    4'b0001:begin
        ALU_OUT <= A-B;
        Arith_flag <= 1'b1;
    end

    4'b0010:begin
        ALU_OUT <= A*B;
        Arith_flag <= 1'b1;
    end

    4'b0011:begin
        ALU_OUT <= A/B;
        Arith_flag <= 1'b1;
    end

    4'b0100:begin
        ALU_OUT <= A & B;
        Logic_flag <= 1'b1;
    end

    4'b0101:begin
        ALU_OUT <= A | B;
        Logic_flag <= 1'b1;
    end

    4'b0110:begin
        ALU_OUT <= ~(A & B);
        Logic_flag <= 1'b1;
    end

    4'b0111:begin
        ALU_OUT <= ~(A | B);
        Logic_flag <= 1'b1;
    end

    4'b1000:begin
        ALU_OUT <= A ^ B;
        Logic_flag <= 1'b1;
    end

    4'b1001:begin
        ALU_OUT  <= A ~^ B;
        Logic_flag <= 1'b1;
    end

    4'b1010:begin
        CMP_flag <= 1'b1;
        if (A == B)
        begin
            ALU_OUT <= 16'd1;
        end
        else
        begin
            ALU_OUT <= 16'd0;
        end
    end


    4'b1011:begin
        CMP_flag <= 1'b1;
        if (A > B)
        begin
            ALU_OUT <= 16'd2;
        end
        else
        begin
            ALU_OUT <= 16'd0;
        end
    end


    4'b1100:begin
        CMP_flag <= 1'b1;
        if (A < B)
        begin
            ALU_OUT <= 16'd3;
        end
        else
        begin
            ALU_OUT <= 16'd0;
        end
    end

    4'b1101:begin
        Shift_flag <= 1'b1;
        ALU_OUT  <= A >> 1 ;
    end

    4'b1110:begin
        Shift_flag <= 1'b1;
        ALU_OUT  <= A << 1 ;
    end

    default:begin
        Shift_flag <= 1'b1;
        ALU_OUT  <= 16'd0 ;
    end
    endcase
 end


endmodule