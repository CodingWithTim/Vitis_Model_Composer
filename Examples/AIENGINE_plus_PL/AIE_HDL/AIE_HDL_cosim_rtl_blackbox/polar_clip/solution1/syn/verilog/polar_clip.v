// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2020.1
// Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="polar_clip_polar_clip,hls_ip_2020_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcvu11p-flga2577-1-e,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=3.300000,HLS_SYN_LAT=18,HLS_SYN_TPT=none,HLS_SYN_MEM=2,HLS_SYN_DSP=0,HLS_SYN_FF=213,HLS_SYN_LUT=1222,HLS_VERSION=2020_1}" *)

module polar_clip (
        ap_clk,
        ap_rst_n,
        in_sample_TDATA,
        in_sample_TVALID,
        in_sample_TREADY,
        in_sample_TKEEP,
        in_sample_TSTRB,
        in_sample_TLAST,
        out_sample_TDATA,
        out_sample_TVALID,
        out_sample_TREADY,
        out_sample_TKEEP,
        out_sample_TSTRB,
        out_sample_TLAST
);

parameter    ap_ST_fsm_state1 = 14'd1;
parameter    ap_ST_fsm_state2 = 14'd2;
parameter    ap_ST_fsm_state3 = 14'd4;
parameter    ap_ST_fsm_state4 = 14'd8;
parameter    ap_ST_fsm_state5 = 14'd16;
parameter    ap_ST_fsm_state6 = 14'd32;
parameter    ap_ST_fsm_state7 = 14'd64;
parameter    ap_ST_fsm_state8 = 14'd128;
parameter    ap_ST_fsm_state9 = 14'd256;
parameter    ap_ST_fsm_state10 = 14'd512;
parameter    ap_ST_fsm_state11 = 14'd1024;
parameter    ap_ST_fsm_state12 = 14'd2048;
parameter    ap_ST_fsm_state13 = 14'd4096;
parameter    ap_ST_fsm_state14 = 14'd8192;

input   ap_clk;
input   ap_rst_n;
input  [31:0] in_sample_TDATA;
input   in_sample_TVALID;
output   in_sample_TREADY;
input  [3:0] in_sample_TKEEP;
input  [3:0] in_sample_TSTRB;
input  [0:0] in_sample_TLAST;
output  [31:0] out_sample_TDATA;
output   out_sample_TVALID;
input   out_sample_TREADY;
output  [3:0] out_sample_TKEEP;
output  [3:0] out_sample_TSTRB;
output  [0:0] out_sample_TLAST;

 reg    ap_rst_n_inv;
wire   [5:0] rotation_sin_lut_address0;
reg    rotation_sin_lut_ce0;
wire   [15:0] rotation_sin_lut_q0;
wire   [5:0] rotation_cos_lut_address0;
reg    rotation_cos_lut_ce0;
wire   [15:0] rotation_cos_lut_q0;
reg    in_sample_TDATA_blk_n;
(* fsm_encoding = "none" *) reg   [13:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    out_sample_TDATA_blk_n;
wire    ap_CS_fsm_state13;
wire    ap_CS_fsm_state14;
wire  signed [15:0] value_real_fu_203_p1;
reg  signed [15:0] value_real_reg_625;
reg  signed [15:0] value_imag_reg_630;
wire  signed [31:0] sext_ln151_fu_217_p1;
reg   [0:0] ret_V_reg_642;
reg   [0:0] tmp_reg_649;
wire  signed [31:0] sext_ln152_fu_237_p1;
wire    ap_CS_fsm_state2;
wire  signed [31:0] grp_fu_592_p2;
wire    ap_CS_fsm_state4;
wire  signed [31:0] grp_fu_598_p3;
reg  signed [31:0] mag_sq_V_reg_667;
wire    ap_CS_fsm_state5;
wire  signed [31:0] sext_ln41_fu_286_p1;
wire   [0:0] xor_ln894_1_fu_296_p2;
reg   [0:0] xor_ln894_1_reg_677;
wire  signed [31:0] sext_ln71_fu_322_p1;
wire   [31:0] select_ln886_fu_406_p3;
wire    ap_CS_fsm_state6;
wire   [0:0] icmp_ln882_fu_326_p2;
wire   [31:0] select_ln886_1_fu_414_p3;
wire   [31:0] select_ln886_2_fu_422_p3;
wire   [2:0] add_ln695_fu_430_p2;
wire    ap_CS_fsm_state7;
wire   [0:0] icmp_ln890_fu_446_p2;
reg   [0:0] icmp_ln890_reg_727;
wire  signed [15:0] cs_fixed_real_V_fu_518_p3;
reg  signed [15:0] cs_fixed_real_V_reg_733;
wire    ap_CS_fsm_state8;
wire  signed [15:0] cs_fixed_imag_V_fu_548_p3;
reg  signed [15:0] cs_fixed_imag_V_reg_738;
(* use_dsp48 = "no" *) wire  signed [15:0] add_ln69_fu_565_p2;
wire    ap_CS_fsm_state10;
reg   [31:0] rotation_index_V_reg_157;
reg   [31:0] X_step_V_1_reg_169;
reg   [31:0] Y_step_V_2_reg_179;
reg   [2:0] i_V_reg_188;
wire   [63:0] zext_ln538_fu_440_p1;
wire  signed [16:0] sext_ln151_1_fu_240_p1;
wire   [16:0] abs_I_V_fu_246_p2;
wire  signed [16:0] select_ln46_fu_252_p3;
wire  signed [16:0] sext_ln152_1_fu_243_p1;
wire   [16:0] abs_Q_V_fu_263_p2;
wire  signed [16:0] select_ln52_fu_269_p3;
wire  signed [17:0] sext_ln890_fu_259_p1;
wire  signed [17:0] sext_ln69_fu_276_p1;
wire   [17:0] X_step_V_fu_280_p2;
wire   [0:0] icmp_ln894_fu_290_p2;
wire   [17:0] Y_step_V_1_fu_308_p2;
wire   [17:0] Y_step_V_fu_302_p2;
wire   [17:0] select_ln63_fu_314_p3;
wire   [31:0] i_V_i_cast3_fu_332_p1;
wire   [5:0] i_V_i_cast_fu_336_p1;
wire   [5:0] shl_ln73_fu_354_p2;
wire   [31:0] zext_ln1465_fu_360_p1;
wire   [31:0] shr_i_i553148_i_fu_370_p2;
wire   [31:0] ashr_ln803_fu_348_p2;
wire   [31:0] ashr_ln803_1_fu_388_p2;
wire   [0:0] tmp_1_fu_340_p3;
wire   [31:0] add_ln69_3_fu_364_p2;
wire   [31:0] add_ln69_5_fu_400_p2;
wire   [31:0] sub_ln69_2_fu_382_p2;
wire   [31:0] sub_ln69_3_fu_394_p2;
wire   [31:0] add_ln69_4_fu_376_p2;
wire   [15:0] sub_ln69_fu_451_p2;
wire   [15:0] sub_ln69_1_fu_469_p2;
wire   [0:0] and_ln95_fu_482_p2;
wire   [15:0] select_ln90_fu_457_p3;
wire   [15:0] select_ln101_fu_475_p3;
wire   [0:0] xor_ln95_fu_464_p2;
wire   [0:0] and_ln95_1_fu_494_p2;
wire   [15:0] select_ln95_fu_486_p3;
wire   [0:0] xor_ln894_fu_507_p2;
wire   [0:0] and_ln106_fu_512_p2;
wire   [15:0] select_ln95_1_fu_499_p3;
wire   [15:0] select_ln95_2_fu_526_p3;
wire   [15:0] sub_ln95_fu_534_p2;
wire   [15:0] select_ln95_3_fu_540_p3;
wire  signed [24:0] grp_fu_606_p2;
wire   [15:0] trunc_ln_fu_556_p4;
wire  signed [15:0] grp_fu_619_p2;
wire  signed [15:0] grp_fu_613_p2;
wire   [15:0] select_ln890_fu_571_p3;
wire   [15:0] select_ln890_1_fu_577_p3;
wire  signed [15:0] grp_fu_592_p0;
wire  signed [15:0] grp_fu_592_p1;
wire  signed [15:0] grp_fu_598_p0;
wire  signed [15:0] grp_fu_598_p1;
wire   [9:0] grp_fu_606_p0;
wire  signed [24:0] grp_fu_606_p1;
reg    grp_fu_592_ce;
wire    ap_CS_fsm_state3;
reg    grp_fu_613_ce;
wire    ap_CS_fsm_state11;
wire    ap_CS_fsm_state12;
reg    grp_fu_619_ce;
reg   [13:0] ap_NS_fsm;
wire    regslice_both_out_sample_V_data_V_U_apdone_blk;
wire    regslice_both_in_sample_V_data_V_U_apdone_blk;
wire   [31:0] in_sample_TDATA_int_regslice;
wire    in_sample_TVALID_int_regslice;
reg    in_sample_TREADY_int_regslice;
wire    regslice_both_in_sample_V_data_V_U_ack_in;
wire    regslice_both_in_sample_V_keep_V_U_apdone_blk;
wire   [3:0] in_sample_TKEEP_int_regslice;
wire    regslice_both_in_sample_V_keep_V_U_vld_out;
wire    regslice_both_in_sample_V_keep_V_U_ack_in;
wire    regslice_both_in_sample_V_strb_V_U_apdone_blk;
wire   [3:0] in_sample_TSTRB_int_regslice;
wire    regslice_both_in_sample_V_strb_V_U_vld_out;
wire    regslice_both_in_sample_V_strb_V_U_ack_in;
wire    regslice_both_in_sample_V_last_V_U_apdone_blk;
wire   [0:0] in_sample_TLAST_int_regslice;
wire    regslice_both_in_sample_V_last_V_U_vld_out;
wire    regslice_both_in_sample_V_last_V_U_ack_in;
wire   [31:0] out_sample_TDATA_int_regslice;
reg    out_sample_TVALID_int_regslice;
wire    out_sample_TREADY_int_regslice;
wire    regslice_both_out_sample_V_data_V_U_vld_out;
wire    regslice_both_out_sample_V_keep_V_U_apdone_blk;
wire    regslice_both_out_sample_V_keep_V_U_ack_in_dummy;
wire    regslice_both_out_sample_V_keep_V_U_vld_out;
wire    regslice_both_out_sample_V_strb_V_U_apdone_blk;
wire    regslice_both_out_sample_V_strb_V_U_ack_in_dummy;
wire    regslice_both_out_sample_V_strb_V_U_vld_out;
wire    regslice_both_out_sample_V_last_V_U_apdone_blk;
wire    regslice_both_out_sample_V_last_V_U_ack_in_dummy;
wire    regslice_both_out_sample_V_last_V_U_vld_out;

// power-on initialization
initial begin
#0 ap_CS_fsm = 14'd1;
end

polar_clip_rotation_sin_lut #(
    .DataWidth( 16 ),
    .AddressRange( 64 ),
    .AddressWidth( 6 ))
rotation_sin_lut_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .address0(rotation_sin_lut_address0),
    .ce0(rotation_sin_lut_ce0),
    .q0(rotation_sin_lut_q0)
);

polar_clip_rotation_cos_lut #(
    .DataWidth( 16 ),
    .AddressRange( 64 ),
    .AddressWidth( 6 ))
rotation_cos_lut_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .address0(rotation_cos_lut_address0),
    .ce0(rotation_cos_lut_ce0),
    .q0(rotation_cos_lut_q0)
);

polar_clip_mul_mul_16s_16s_32_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 32 ))
mul_mul_16s_16s_32_4_1_U1(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .din0(grp_fu_592_p0),
    .din1(grp_fu_592_p1),
    .ce(grp_fu_592_ce),
    .dout(grp_fu_592_p2)
);

polar_clip_mac_muladd_16s_16s_32s_32_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .din2_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
mac_muladd_16s_16s_32s_32_4_1_U2(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .din0(grp_fu_598_p0),
    .din1(grp_fu_598_p1),
    .din2(grp_fu_592_p2),
    .ce(1'b1),
    .dout(grp_fu_598_p3)
);

polar_clip_mul_mul_10ns_25s_25_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 10 ),
    .din1_WIDTH( 25 ),
    .dout_WIDTH( 25 ))
mul_mul_10ns_25s_25_4_1_U3(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .din0(grp_fu_606_p0),
    .din1(grp_fu_606_p1),
    .ce(1'b1),
    .dout(grp_fu_606_p2)
);

polar_clip_mul_mul_16s_16s_16_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
mul_mul_16s_16s_16_4_1_U4(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .din0(cs_fixed_real_V_reg_733),
    .din1(add_ln69_fu_565_p2),
    .ce(grp_fu_613_ce),
    .dout(grp_fu_613_p2)
);

polar_clip_mul_mul_16s_16s_16_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
mul_mul_16s_16s_16_4_1_U5(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .din0(cs_fixed_imag_V_reg_738),
    .din1(add_ln69_fu_565_p2),
    .ce(grp_fu_619_ce),
    .dout(grp_fu_619_p2)
);

regslice_both #(
    .DataWidth( 32 ))
regslice_both_in_sample_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(in_sample_TDATA),
    .vld_in(in_sample_TVALID),
    .ack_in(regslice_both_in_sample_V_data_V_U_ack_in),
    .data_out(in_sample_TDATA_int_regslice),
    .vld_out(in_sample_TVALID_int_regslice),
    .ack_out(in_sample_TREADY_int_regslice),
    .apdone_blk(regslice_both_in_sample_V_data_V_U_apdone_blk)
);

regslice_both #(
    .DataWidth( 4 ))
regslice_both_in_sample_V_keep_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(in_sample_TKEEP),
    .vld_in(in_sample_TVALID),
    .ack_in(regslice_both_in_sample_V_keep_V_U_ack_in),
    .data_out(in_sample_TKEEP_int_regslice),
    .vld_out(regslice_both_in_sample_V_keep_V_U_vld_out),
    .ack_out(in_sample_TREADY_int_regslice),
    .apdone_blk(regslice_both_in_sample_V_keep_V_U_apdone_blk)
);

regslice_both #(
    .DataWidth( 4 ))
regslice_both_in_sample_V_strb_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(in_sample_TSTRB),
    .vld_in(in_sample_TVALID),
    .ack_in(regslice_both_in_sample_V_strb_V_U_ack_in),
    .data_out(in_sample_TSTRB_int_regslice),
    .vld_out(regslice_both_in_sample_V_strb_V_U_vld_out),
    .ack_out(in_sample_TREADY_int_regslice),
    .apdone_blk(regslice_both_in_sample_V_strb_V_U_apdone_blk)
);

regslice_both #(
    .DataWidth( 1 ))
regslice_both_in_sample_V_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(in_sample_TLAST),
    .vld_in(in_sample_TVALID),
    .ack_in(regslice_both_in_sample_V_last_V_U_ack_in),
    .data_out(in_sample_TLAST_int_regslice),
    .vld_out(regslice_both_in_sample_V_last_V_U_vld_out),
    .ack_out(in_sample_TREADY_int_regslice),
    .apdone_blk(regslice_both_in_sample_V_last_V_U_apdone_blk)
);

regslice_both #(
    .DataWidth( 32 ))
regslice_both_out_sample_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(out_sample_TDATA_int_regslice),
    .vld_in(out_sample_TVALID_int_regslice),
    .ack_in(out_sample_TREADY_int_regslice),
    .data_out(out_sample_TDATA),
    .vld_out(regslice_both_out_sample_V_data_V_U_vld_out),
    .ack_out(out_sample_TREADY),
    .apdone_blk(regslice_both_out_sample_V_data_V_U_apdone_blk)
);

regslice_both #(
    .DataWidth( 4 ))
regslice_both_out_sample_V_keep_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(4'd0),
    .vld_in(out_sample_TVALID_int_regslice),
    .ack_in(regslice_both_out_sample_V_keep_V_U_ack_in_dummy),
    .data_out(out_sample_TKEEP),
    .vld_out(regslice_both_out_sample_V_keep_V_U_vld_out),
    .ack_out(out_sample_TREADY),
    .apdone_blk(regslice_both_out_sample_V_keep_V_U_apdone_blk)
);

regslice_both #(
    .DataWidth( 4 ))
regslice_both_out_sample_V_strb_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(4'd0),
    .vld_in(out_sample_TVALID_int_regslice),
    .ack_in(regslice_both_out_sample_V_strb_V_U_ack_in_dummy),
    .data_out(out_sample_TSTRB),
    .vld_out(regslice_both_out_sample_V_strb_V_U_vld_out),
    .ack_out(out_sample_TREADY),
    .apdone_blk(regslice_both_out_sample_V_strb_V_U_apdone_blk)
);

regslice_both #(
    .DataWidth( 1 ))
regslice_both_out_sample_V_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(1'd0),
    .vld_in(out_sample_TVALID_int_regslice),
    .ack_in(regslice_both_out_sample_V_last_V_U_ack_in_dummy),
    .data_out(out_sample_TLAST),
    .vld_out(regslice_both_out_sample_V_last_V_U_vld_out),
    .ack_out(out_sample_TREADY),
    .apdone_blk(regslice_both_out_sample_V_last_V_U_apdone_blk)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        X_step_V_1_reg_169 <= sext_ln41_fu_286_p1;
    end else if (((1'b1 == ap_CS_fsm_state6) & (icmp_ln882_fu_326_p2 == 1'd0))) begin
        X_step_V_1_reg_169 <= select_ln886_2_fu_422_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        Y_step_V_2_reg_179 <= sext_ln71_fu_322_p1;
    end else if (((1'b1 == ap_CS_fsm_state6) & (icmp_ln882_fu_326_p2 == 1'd0))) begin
        Y_step_V_2_reg_179 <= select_ln886_1_fu_414_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        i_V_reg_188 <= 3'd1;
    end else if (((1'b1 == ap_CS_fsm_state6) & (icmp_ln882_fu_326_p2 == 1'd0))) begin
        i_V_reg_188 <= add_ln695_fu_430_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        rotation_index_V_reg_157 <= 32'd1;
    end else if (((1'b1 == ap_CS_fsm_state6) & (icmp_ln882_fu_326_p2 == 1'd0))) begin
        rotation_index_V_reg_157 <= select_ln886_fu_406_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state8) & (icmp_ln890_reg_727 == 1'd1))) begin
        cs_fixed_imag_V_reg_738 <= cs_fixed_imag_V_fu_548_p3;
        cs_fixed_real_V_reg_733 <= cs_fixed_real_V_fu_518_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        icmp_ln890_reg_727 <= icmp_ln890_fu_446_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        mag_sq_V_reg_667 <= grp_fu_598_p3;
        xor_ln894_1_reg_677 <= xor_ln894_1_fu_296_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((in_sample_TVALID_int_regslice == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ret_V_reg_642 <= in_sample_TDATA_int_regslice[32'd31];
        tmp_reg_649 <= in_sample_TDATA_int_regslice[32'd15];
        value_imag_reg_630 <= {{in_sample_TDATA_int_regslice[31:16]}};
        value_real_reg_625 <= value_real_fu_203_p1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state2) | (1'b1 == ap_CS_fsm_state3) | ((in_sample_TVALID_int_regslice == 1'b1) & (1'b1 == ap_CS_fsm_state1)))) begin
        grp_fu_592_ce = 1'b1;
    end else begin
        grp_fu_592_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state12) | (1'b1 == ap_CS_fsm_state11) | (1'b1 == ap_CS_fsm_state10) | ((out_sample_TREADY_int_regslice == 1'b1) & (1'b1 == ap_CS_fsm_state13)))) begin
        grp_fu_613_ce = 1'b1;
    end else begin
        grp_fu_613_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state12) | (1'b1 == ap_CS_fsm_state11) | (1'b1 == ap_CS_fsm_state10) | ((out_sample_TREADY_int_regslice == 1'b1) & (1'b1 == ap_CS_fsm_state13)))) begin
        grp_fu_619_ce = 1'b1;
    end else begin
        grp_fu_619_ce = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        in_sample_TDATA_blk_n = in_sample_TVALID_int_regslice;
    end else begin
        in_sample_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((in_sample_TVALID_int_regslice == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        in_sample_TREADY_int_regslice = 1'b1;
    end else begin
        in_sample_TREADY_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state14) | (1'b1 == ap_CS_fsm_state13))) begin
        out_sample_TDATA_blk_n = out_sample_TREADY_int_regslice;
    end else begin
        out_sample_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((out_sample_TREADY_int_regslice == 1'b1) & (1'b1 == ap_CS_fsm_state13))) begin
        out_sample_TVALID_int_regslice = 1'b1;
    end else begin
        out_sample_TVALID_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        rotation_cos_lut_ce0 = 1'b1;
    end else begin
        rotation_cos_lut_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        rotation_sin_lut_ce0 = 1'b1;
    end else begin
        rotation_sin_lut_ce0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((in_sample_TVALID_int_regslice == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            if (((1'b1 == ap_CS_fsm_state6) & (icmp_ln882_fu_326_p2 == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state9;
        end
        ap_ST_fsm_state9 : begin
            ap_NS_fsm = ap_ST_fsm_state10;
        end
        ap_ST_fsm_state10 : begin
            ap_NS_fsm = ap_ST_fsm_state11;
        end
        ap_ST_fsm_state11 : begin
            ap_NS_fsm = ap_ST_fsm_state12;
        end
        ap_ST_fsm_state12 : begin
            ap_NS_fsm = ap_ST_fsm_state13;
        end
        ap_ST_fsm_state13 : begin
            if (((out_sample_TREADY_int_regslice == 1'b1) & (1'b1 == ap_CS_fsm_state13))) begin
                ap_NS_fsm = ap_ST_fsm_state14;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state13;
            end
        end
        ap_ST_fsm_state14 : begin
            if ((~((out_sample_TREADY_int_regslice == 1'b0) | (regslice_both_out_sample_V_data_V_U_apdone_blk == 1'b1)) & (1'b1 == ap_CS_fsm_state14))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state14;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign X_step_V_fu_280_p2 = ($signed(sext_ln890_fu_259_p1) + $signed(sext_ln69_fu_276_p1));

assign Y_step_V_1_fu_308_p2 = ($signed(sext_ln890_fu_259_p1) - $signed(sext_ln69_fu_276_p1));

assign Y_step_V_fu_302_p2 = ($signed(sext_ln69_fu_276_p1) - $signed(sext_ln890_fu_259_p1));

assign abs_I_V_fu_246_p2 = ($signed(17'd0) - $signed(sext_ln151_1_fu_240_p1));

assign abs_Q_V_fu_263_p2 = ($signed(17'd0) - $signed(sext_ln152_1_fu_243_p1));

assign add_ln695_fu_430_p2 = (i_V_reg_188 + 3'd1);

assign add_ln69_3_fu_364_p2 = (zext_ln1465_fu_360_p1 + rotation_index_V_reg_157);

assign add_ln69_4_fu_376_p2 = (shr_i_i553148_i_fu_370_p2 + X_step_V_1_reg_169);

assign add_ln69_5_fu_400_p2 = (ashr_ln803_fu_348_p2 + Y_step_V_2_reg_179);

assign add_ln69_fu_565_p2 = ($signed(16'd53910) + $signed(trunc_ln_fu_556_p4));

assign and_ln106_fu_512_p2 = (xor_ln95_fu_464_p2 & xor_ln894_fu_507_p2);

assign and_ln95_1_fu_494_p2 = (xor_ln95_fu_464_p2 & xor_ln894_1_reg_677);

assign and_ln95_fu_482_p2 = (xor_ln894_1_reg_677 & ret_V_reg_642);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_state11 = ap_CS_fsm[32'd10];

assign ap_CS_fsm_state12 = ap_CS_fsm[32'd11];

assign ap_CS_fsm_state13 = ap_CS_fsm[32'd12];

assign ap_CS_fsm_state14 = ap_CS_fsm[32'd13];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign ashr_ln803_1_fu_388_p2 = $signed(Y_step_V_2_reg_179) >>> i_V_i_cast3_fu_332_p1;

assign ashr_ln803_fu_348_p2 = $signed(X_step_V_1_reg_169) >>> i_V_i_cast3_fu_332_p1;

assign cs_fixed_imag_V_fu_548_p3 = ((and_ln106_fu_512_p2[0:0] === 1'b1) ? rotation_sin_lut_q0 : select_ln95_3_fu_540_p3);

assign cs_fixed_real_V_fu_518_p3 = ((and_ln106_fu_512_p2[0:0] === 1'b1) ? select_ln101_fu_475_p3 : select_ln95_1_fu_499_p3);

assign grp_fu_592_p0 = sext_ln151_fu_217_p1;

assign grp_fu_592_p1 = sext_ln151_fu_217_p1;

assign grp_fu_598_p0 = sext_ln152_fu_237_p1;

assign grp_fu_598_p1 = sext_ln152_fu_237_p1;

assign grp_fu_606_p0 = 25'd311;

assign grp_fu_606_p1 = X_step_V_1_reg_169[24:0];

assign i_V_i_cast3_fu_332_p1 = i_V_reg_188;

assign i_V_i_cast_fu_336_p1 = i_V_reg_188;

assign icmp_ln882_fu_326_p2 = ((i_V_reg_188 == 3'd6) ? 1'b1 : 1'b0);

assign icmp_ln890_fu_446_p2 = (($signed(mag_sq_V_reg_667) > $signed(32'd135163876)) ? 1'b1 : 1'b0);

assign icmp_ln894_fu_290_p2 = (($signed(select_ln52_fu_269_p3) < $signed(select_ln46_fu_252_p3)) ? 1'b1 : 1'b0);

assign in_sample_TREADY = regslice_both_in_sample_V_data_V_U_ack_in;

assign out_sample_TDATA_int_regslice = {{select_ln890_fu_571_p3}, {select_ln890_1_fu_577_p3}};

assign out_sample_TVALID = regslice_both_out_sample_V_data_V_U_vld_out;

assign rotation_cos_lut_address0 = zext_ln538_fu_440_p1;

assign rotation_sin_lut_address0 = zext_ln538_fu_440_p1;

assign select_ln101_fu_475_p3 = ((tmp_reg_649[0:0] === 1'b1) ? sub_ln69_1_fu_469_p2 : rotation_cos_lut_q0);

assign select_ln46_fu_252_p3 = ((tmp_reg_649[0:0] === 1'b1) ? abs_I_V_fu_246_p2 : sext_ln151_1_fu_240_p1);

assign select_ln52_fu_269_p3 = ((ret_V_reg_642[0:0] === 1'b1) ? abs_Q_V_fu_263_p2 : sext_ln152_1_fu_243_p1);

assign select_ln63_fu_314_p3 = ((xor_ln894_1_fu_296_p2[0:0] === 1'b1) ? Y_step_V_1_fu_308_p2 : Y_step_V_fu_302_p2);

assign select_ln886_1_fu_414_p3 = ((tmp_1_fu_340_p3[0:0] === 1'b1) ? add_ln69_5_fu_400_p2 : sub_ln69_2_fu_382_p2);

assign select_ln886_2_fu_422_p3 = ((tmp_1_fu_340_p3[0:0] === 1'b1) ? sub_ln69_3_fu_394_p2 : add_ln69_4_fu_376_p2);

assign select_ln886_fu_406_p3 = ((tmp_1_fu_340_p3[0:0] === 1'b1) ? rotation_index_V_reg_157 : add_ln69_3_fu_364_p2);

assign select_ln890_1_fu_577_p3 = ((icmp_ln890_reg_727[0:0] === 1'b1) ? grp_fu_613_p2 : 16'd0);

assign select_ln890_fu_571_p3 = ((icmp_ln890_reg_727[0:0] === 1'b1) ? grp_fu_619_p2 : 16'd0);

assign select_ln90_fu_457_p3 = ((tmp_reg_649[0:0] === 1'b1) ? sub_ln69_fu_451_p2 : rotation_sin_lut_q0);

assign select_ln95_1_fu_499_p3 = ((and_ln95_1_fu_494_p2[0:0] === 1'b1) ? select_ln90_fu_457_p3 : select_ln95_fu_486_p3);

assign select_ln95_2_fu_526_p3 = ((and_ln95_fu_482_p2[0:0] === 1'b1) ? rotation_cos_lut_q0 : rotation_sin_lut_q0);

assign select_ln95_3_fu_540_p3 = ((and_ln95_1_fu_494_p2[0:0] === 1'b1) ? rotation_cos_lut_q0 : sub_ln95_fu_534_p2);

assign select_ln95_fu_486_p3 = ((and_ln95_fu_482_p2[0:0] === 1'b1) ? select_ln90_fu_457_p3 : select_ln101_fu_475_p3);

assign sext_ln151_1_fu_240_p1 = value_real_reg_625;

assign sext_ln151_fu_217_p1 = value_real_fu_203_p1;

assign sext_ln152_1_fu_243_p1 = value_imag_reg_630;

assign sext_ln152_fu_237_p1 = value_imag_reg_630;

assign sext_ln41_fu_286_p1 = $signed(X_step_V_fu_280_p2);

assign sext_ln69_fu_276_p1 = select_ln52_fu_269_p3;

assign sext_ln71_fu_322_p1 = $signed(select_ln63_fu_314_p3);

assign sext_ln890_fu_259_p1 = select_ln46_fu_252_p3;

assign shl_ln73_fu_354_p2 = 6'd1 << i_V_i_cast_fu_336_p1;

assign shr_i_i553148_i_fu_370_p2 = Y_step_V_2_reg_179 >> i_V_i_cast3_fu_332_p1;

assign sub_ln69_1_fu_469_p2 = (16'd0 - rotation_cos_lut_q0);

assign sub_ln69_2_fu_382_p2 = (Y_step_V_2_reg_179 - ashr_ln803_fu_348_p2);

assign sub_ln69_3_fu_394_p2 = (X_step_V_1_reg_169 - ashr_ln803_1_fu_388_p2);

assign sub_ln69_fu_451_p2 = (16'd0 - rotation_sin_lut_q0);

assign sub_ln95_fu_534_p2 = (16'd0 - select_ln95_2_fu_526_p3);

assign tmp_1_fu_340_p3 = Y_step_V_2_reg_179[32'd31];

assign trunc_ln_fu_556_p4 = {{grp_fu_606_p2[24:9]}};

assign value_real_fu_203_p1 = in_sample_TDATA_int_regslice[15:0];

assign xor_ln894_1_fu_296_p2 = (icmp_ln894_fu_290_p2 ^ 1'd1);

assign xor_ln894_fu_507_p2 = (xor_ln894_1_reg_677 ^ 1'd1);

assign xor_ln95_fu_464_p2 = (ret_V_reg_642 ^ 1'd1);

assign zext_ln1465_fu_360_p1 = shl_ln73_fu_354_p2;

assign zext_ln538_fu_440_p1 = rotation_index_V_reg_157;

endmodule //polar_clip
