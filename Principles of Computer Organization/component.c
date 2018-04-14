
/*
 * Designer:   name, student id, email address
*/

#include "minicpu.h"

/* ALU */
void ALU(unsigned A,unsigned B,char ALUControl,unsigned *ALUresult,char *Zero)
{
	switch(ALUControl){
		case 0x0:
		  *ALUresult = A + B;//add
		  break;
	  case 0x1:
		  *ALUresult = A - B;
			break;
		case 0x2:
		  *ALUresult = (signed) A < (signed) B ? 1 : 0;
			break;
		case 0x3:
		  *ALUresult = A < B ? 1 : 0;
			break;
		case 0x4:
		  *ALUresult = A & B;
			break;
		case 0x5:
		  *ALUresult = A | B;
			break;
		case 0x6:
		  *ALUresult = B << 16;
			break;
		case 0x7:
		  *ALUresult = ! (A | B);
			break;
		default:
		  break;
		}

		*Zero= *ALUresult==0 ? 1 : 0;
}

/* instruction fetch */
int instruction_fetch(unsigned PC,unsigned *Mem,unsigned *instruction)
{
	if (PC >= 65535)
	   return 1;
	if (PC % 4 != 0)
	   return 1;
	*instruction=Mem[PC>>2];
	return 0;
}


/* instruction partition */
void instruction_partition(unsigned instruction, unsigned *op, unsigned *r1,unsigned *r2, unsigned *r3, unsigned *funct, unsigned *offset, unsigned *jsec)
{
	*funct = 0X3F & instruction;        // 0x3f      = 0000 0000 0000 0000 0000 0000 0000 0011 1111
	*offset = 0XFFFF & instruction;     // 0xfffff   = 0000 0000 0000 0000 0000 1111 1111 1111 1111
	*jsec = 0X3FFFFFF & instruction;    // 0x3ffffff = 0000 0011 1111 1111 1111 1111 1111 1111 1111
	*op = instruction >> 26;
	*r1 = (instruction >> 21) & 0x1F;   // 0x1f      = 0000 0000 0000 0000 0000 0000 0000 0001 1111
	*r2 = (instruction >> 16) & 0x1F;   // 0x1f      = 0000 0000 0000 0000 0000 0000 0000 0001 1111
	*r3 = (instruction >> 11) & 0x1F;   // 0x1f      = 0000 0000 0000 0000 0000 0000 0000 0001 1111

}



/* instruction decode */
int instruction_decode(unsigned op,struct_controls *controls)
{
	switch(op){
	case (0x0)://R-format
	        controls->RegDst   = 1;
					controls->Jump     = 0;
					controls->Branch   = 0;
					controls->MemRead  = 0;
					controls->MemtoReg = 0;
		      controls->ALUOp    = 7;
		      controls->MemWrite = 0;
		      controls->ALUSrc   = 0;
					controls->RegWrite = 1;
		      return 0;
	case (0x8)://Addi
        	controls->RegDst   = 0;
					controls->Jump     = 0;
					controls->Branch   = 0;
					controls->MemRead  = 0;
					controls->MemtoReg = 0;
					controls->ALUOp    = 0;
					controls->MemWrite = 0;
					controls->ALUSrc   = 1;
					controls->RegWrite = 1;
		      return 0;
	case (0x23)://Lw
					controls->RegDst   = 0;
					controls->Jump     = 0;
					controls->Branch   = 0;
					controls->MemRead  = 1;
					controls->MemtoReg = 1;
					controls->ALUOp    = 0;
					controls->MemWrite = 0;
					controls->ALUSrc   = 1;
					controls->RegWrite = 1;
					return 0;
	case (0x2B)://Sw
				  controls->RegDst   = 2;
			  	controls->Jump     = 0;
		  		controls->Branch   = 0;
			  	controls->MemRead  = 2;
			  	controls->MemtoReg = 2;
			  	controls->ALUOp    = 0;
			  	controls->MemWrite = 1;
			  	controls->ALUSrc   = 1;
			  	controls->RegWrite = 0;
			  	return 0;
	case (0xF)://Lui
					controls->RegDst   = 0;
					controls->Jump     = 0;
					controls->Branch   = 0;
					controls->MemRead  = 0;
					controls->MemtoReg = 2;
					controls->ALUOp    = 6;
					controls->MemWrite = 0;
					controls->ALUSrc   = 1;
					controls->RegWrite = 1;
					return 0;
  case (0x4)://Beq
					controls->RegDst   = 2;
					controls->Jump     = 0;
					controls->Branch   = 1;
					controls->MemRead  = 2;
					controls->MemtoReg = 2;
					controls->ALUOp    = 1;
					controls->MemWrite = 0;
					controls->ALUSrc   = 0;
					controls->RegWrite = 0;
				  return 0;
  case (0xA)://Slti
			    controls->RegDst   = 0;
			    controls->Jump     = 0;
			    controls->Branch   = 0;
			    controls->MemRead  = 0;
			    controls->MemtoReg = 0;
			    controls->ALUOp    = 2;
			    controls->MemWrite = 0;
			    controls->ALUSrc   = 1;
			    controls->RegWrite = 1;
			    return 0;
	case (0xB)://Sltiu
			    controls->RegDst   = 0;
			    controls->Jump     = 0;
			    controls->Branch   = 0;
			    controls->MemRead  = 0;
			    controls->MemtoReg = 0;
			    controls->ALUOp    = 3;
			    controls->MemWrite = 0;
			    controls->ALUSrc   = 1;
			    controls->RegWrite = 1;
				  return 0;
	case (0x2)://J
			    controls->RegDst   = 2;
			    controls->Jump     = 1;
			    controls->Branch   = 2;
			    controls->MemRead  = 0;
			    controls->MemtoReg = 0;
			    controls->ALUOp    = 0;
			    controls->MemWrite = 2;
			    controls->ALUSrc   = 2;
			    controls->RegWrite = 2;
				  return 0;
	default:
			    return 1;
	}
}

/* Read Register */
void read_register(unsigned r1,unsigned r2,unsigned *Reg,unsigned *data1,unsigned *data2)
{
  	*data1 = Reg[r1];
  	*data2 = Reg[r2];
}


/* Sign Extend */
void sign_extend(unsigned offset,unsigned *extended_value)
{
   if (offset <=0X8000)        // add 0
	     *extended_value = offset;
	   else                      // add 1
		   *extended_value = offset || (0XFFFF0000);
}

/* ALU operations */
int ALU_operations(unsigned data1,unsigned data2,unsigned extended_value,unsigned funct,char ALUOp,char ALUSrc,unsigned *ALUresult,char *Zero)
{
	int ALUControl = ALUOp;
	if (ALUOp == 7)
	{
		switch(funct)
		{
			case (0x20): //add
				ALUControl = 0;
				break;
			case (0x22): //sub
				ALUControl = 1;
				break;
			case (0x2A): //slt
				ALUControl = 2;
				break;
			case (0x2B): //sltu
				ALUControl = 3;
				break;
			case (0x24): //and
				ALUControl = 4;
				break;
			case (0x25): //or
				ALUControl = 5;
				break;
			case (0x27): //nor
				ALUControl = 7;
				break;
			default:
				return 1;
		}
	}
	if(ALUSrc)
		ALU(data1, extended_value, ALUControl, ALUresult, Zero);
	else
		ALU(data1, data2, ALUControl, ALUresult, Zero);

	return 0;
}

/* Read / Write Memory */
int rw_memory(unsigned ALUresult,unsigned data2,char MemWrite,char MemRead,unsigned *memdata,unsigned *Mem)
{
	if(MemRead == 1){                                             // do the read job
		if ((ALUresult % 4 == 0 ) &&  (ALUresult < 65536))          // check if legal address
		 *memdata = Mem[ALUresult >> 2];                            // read the data
 		else
	   return 1;                                                 // if illegal stop
	}
	if(MemWrite == 1){                                           // do the write job
		if ((ALUresult % 4  == 0) &&  (ALUresult < 65536))         // check if legal address
		  Mem[ALUresult >> 2] = data2;                             // store the data
		else
		  return 1;                                                // if illegal stop
	}
	return 0;
}


/* Write Register */
void write_register(unsigned r2,unsigned r3,unsigned memdata,unsigned ALUresult,char RegWrite,char RegDst,char MemtoReg,unsigned *Reg)
{
	if (RegWrite == 1)
		if (RegDst == 0)        //r2 is the destination
		   if (MemtoReg == 1)   //data comes from Memory
          Reg[r2] = memdata;
			 else                 //data comes from ALU
			    Reg[r2] = ALUresult;

		else                    //r3 is the destination
		  if (MemtoReg == 1)    //data comes from Memory
				 Reg[r3] = memdata;
		  else                  //data comes from ALU
				 Reg[r3] = ALUresult;


}

/* PC update */
void PC_update(unsigned jsec,unsigned extended_value,char Branch,char Jump,char Zero,unsigned *PC)
{
	*PC += 4;                  //normal case
	if (Branch == 1 && Zero != 0)  //beq or bne && imm!=0
	   *PC += (4*extended_value);
	if (Jump==1){              // J instruction
	   *PC = *PC & 0XF0000000; // keep top 4 bits {0xf0000000 = 1111 0000 0000 0000 0000 0000 0000 0000}
		 jsec = jsec << 2;       // cut top 2 bits
		 *PC +=jsec;             // do the combination
}
}
