// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Version: 2021.2
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module GradientMag_XMC_120_160_1_Loop_VITIS_LOOP_93_1_proc9 (
        ap_clk,
        ap_rst,
        ap_start,
        start_full_n,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        SobelFilter_XMC_out1_i_dout,
        SobelFilter_XMC_out1_i_empty_n,
        SobelFilter_XMC_out1_i_read,
        SobelFilter_XMC_out2_i_dout,
        SobelFilter_XMC_out2_i_empty_n,
        SobelFilter_XMC_out2_i_read,
        srcX_obj_data_din,
        srcX_obj_data_full_n,
        srcX_obj_data_write,
        srcY_obj_data_din,
        srcY_obj_data_full_n,
        srcY_obj_data_write,
        start_out,
        start_write
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
input   start_full_n;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [15:0] SobelFilter_XMC_out1_i_dout;
input   SobelFilter_XMC_out1_i_empty_n;
output   SobelFilter_XMC_out1_i_read;
input  [15:0] SobelFilter_XMC_out2_i_dout;
input   SobelFilter_XMC_out2_i_empty_n;
output   SobelFilter_XMC_out2_i_read;
output  [15:0] srcX_obj_data_din;
input   srcX_obj_data_full_n;
output   srcX_obj_data_write;
output  [15:0] srcY_obj_data_din;
input   srcY_obj_data_full_n;
output   srcY_obj_data_write;
output   start_out;
output   start_write;

reg ap_idle;
reg SobelFilter_XMC_out1_i_read;
reg SobelFilter_XMC_out2_i_read;
reg srcX_obj_data_write;
reg srcY_obj_data_write;
reg start_write;

reg    real_start;
reg    start_once_reg;
(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    internal_ap_ready;
wire   [0:0] icmp_ln93_fu_78_p2;
reg    ap_done_reg;
reg    ap_block_state1_pp0_stage0_iter0;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    SobelFilter_XMC_out1_i_blk_n;
wire    ap_block_pp0_stage0;
reg    SobelFilter_XMC_out2_i_blk_n;
reg    srcX_obj_data_blk_n;
reg    srcY_obj_data_blk_n;
reg   [15:0] SobelFilter_XMC_out1_i_read_reg_105;
reg    ap_block_pp0_stage0_11001;
reg   [15:0] SobelFilter_XMC_out2_i_read_reg_110;
reg   [14:0] indvar_flatten_fu_40;
wire   [14:0] add_ln93_fu_84_p2;
wire    ap_loop_init;
reg   [14:0] ap_sig_allocacmp_indvar_flatten_load;
reg    ap_block_pp0_stage0_01001;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
reg    ap_condition_125;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 start_once_reg = 1'b0;
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_done_reg = 1'b0;
end

flow_control_loop_pipe flow_control_loop_pipe_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(real_start),
    .ap_ready(internal_ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int),
    .ap_continue(ap_continue)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage0)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        start_once_reg <= 1'b0;
    end else begin
        if (((real_start == 1'b1) & (internal_ap_ready == 1'b0))) begin
            start_once_reg <= 1'b1;
        end else if ((internal_ap_ready == 1'b1)) begin
            start_once_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_125)) begin
        if ((icmp_ln93_fu_78_p2 == 1'd0)) begin
            indvar_flatten_fu_40 <= add_ln93_fu_84_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            indvar_flatten_fu_40 <= 15'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln93_fu_78_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        SobelFilter_XMC_out1_i_read_reg_105 <= SobelFilter_XMC_out1_i_dout;
        SobelFilter_XMC_out2_i_read_reg_110 <= SobelFilter_XMC_out2_i_dout;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_done_reg == 1'b0) & (icmp_ln93_fu_78_p2 == 1'd0) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        SobelFilter_XMC_out1_i_blk_n = SobelFilter_XMC_out1_i_empty_n;
    end else begin
        SobelFilter_XMC_out1_i_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln93_fu_78_p2 == 1'd0) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        SobelFilter_XMC_out1_i_read = 1'b1;
    end else begin
        SobelFilter_XMC_out1_i_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_done_reg == 1'b0) & (icmp_ln93_fu_78_p2 == 1'd0) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        SobelFilter_XMC_out2_i_blk_n = SobelFilter_XMC_out2_i_empty_n;
    end else begin
        SobelFilter_XMC_out2_i_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln93_fu_78_p2 == 1'd0) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        SobelFilter_XMC_out2_i_read = 1'b1;
    end else begin
        SobelFilter_XMC_out2_i_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (icmp_ln93_fu_78_p2 == 1'd1) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_start_int == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_indvar_flatten_load = 15'd0;
    end else begin
        ap_sig_allocacmp_indvar_flatten_load = indvar_flatten_fu_40;
    end
end

always @ (*) begin
    if (((start_full_n == 1'b0) & (start_once_reg == 1'b0))) begin
        real_start = 1'b0;
    end else begin
        real_start = ap_start;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        srcX_obj_data_blk_n = srcX_obj_data_full_n;
    end else begin
        srcX_obj_data_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        srcX_obj_data_write = 1'b1;
    end else begin
        srcX_obj_data_write = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        srcY_obj_data_blk_n = srcY_obj_data_full_n;
    end else begin
        srcY_obj_data_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        srcY_obj_data_write = 1'b1;
    end else begin
        srcY_obj_data_write = 1'b0;
    end
end

always @ (*) begin
    if (((real_start == 1'b1) & (start_once_reg == 1'b0))) begin
        start_write = 1'b1;
    end else begin
        start_write = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln93_fu_84_p2 = (ap_sig_allocacmp_indvar_flatten_load + 15'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((ap_done_reg == 1'b1) | ((ap_enable_reg_pp0_iter1 == 1'b1) & ((srcY_obj_data_full_n == 1'b0) | (srcX_obj_data_full_n == 1'b0))) | ((ap_start_int == 1'b1) & ((ap_done_reg == 1'b1) | ((icmp_ln93_fu_78_p2 == 1'd0) & (1'b0 == SobelFilter_XMC_out2_i_empty_n)) | ((icmp_ln93_fu_78_p2 == 1'd0) & (1'b0 == SobelFilter_XMC_out1_i_empty_n)))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_done_reg == 1'b1) | ((ap_enable_reg_pp0_iter1 == 1'b1) & ((srcY_obj_data_full_n == 1'b0) | (srcX_obj_data_full_n == 1'b0))) | ((ap_start_int == 1'b1) & ((ap_done_reg == 1'b1) | ((icmp_ln93_fu_78_p2 == 1'd0) & (1'b0 == SobelFilter_XMC_out2_i_empty_n)) | ((icmp_ln93_fu_78_p2 == 1'd0) & (1'b0 == SobelFilter_XMC_out1_i_empty_n)))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_done_reg == 1'b1) | ((ap_enable_reg_pp0_iter1 == 1'b1) & ((srcY_obj_data_full_n == 1'b0) | (srcX_obj_data_full_n == 1'b0))) | ((ap_start_int == 1'b1) & ((ap_done_reg == 1'b1) | ((icmp_ln93_fu_78_p2 == 1'd0) & (1'b0 == SobelFilter_XMC_out2_i_empty_n)) | ((icmp_ln93_fu_78_p2 == 1'd0) & (1'b0 == SobelFilter_XMC_out1_i_empty_n)))));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_done_reg == 1'b1) | ((icmp_ln93_fu_78_p2 == 1'd0) & (1'b0 == SobelFilter_XMC_out2_i_empty_n)) | ((icmp_ln93_fu_78_p2 == 1'd0) & (1'b0 == SobelFilter_XMC_out1_i_empty_n)));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = ((srcY_obj_data_full_n == 1'b0) | (srcX_obj_data_full_n == 1'b0));
end

always @ (*) begin
    ap_condition_125 = ((1'b0 == ap_block_pp0_stage0_11001) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign ap_ready = internal_ap_ready;

assign icmp_ln93_fu_78_p2 = ((ap_sig_allocacmp_indvar_flatten_load == 15'd19200) ? 1'b1 : 1'b0);

assign srcX_obj_data_din = SobelFilter_XMC_out1_i_read_reg_105;

assign srcY_obj_data_din = SobelFilter_XMC_out2_i_read_reg_110;

assign start_out = real_start;

endmodule //GradientMag_XMC_120_160_1_Loop_VITIS_LOOP_93_1_proc9