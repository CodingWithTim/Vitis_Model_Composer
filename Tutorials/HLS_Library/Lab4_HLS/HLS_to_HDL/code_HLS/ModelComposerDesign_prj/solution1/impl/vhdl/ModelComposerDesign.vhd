-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
-- Version: 2021.2
-- Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ModelComposerDesign is
port (
    ap_local_block : OUT STD_LOGIC;
    ap_local_deadlock : OUT STD_LOGIC;
    Image_in_TDATA : IN STD_LOGIC_VECTOR (7 downto 0);
    Edge_out_TDATA : OUT STD_LOGIC_VECTOR (7 downto 0);
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    Image_in_TVALID : IN STD_LOGIC;
    Image_in_TREADY : OUT STD_LOGIC;
    Edge_out_TVALID : OUT STD_LOGIC;
    Edge_out_TREADY : IN STD_LOGIC );
end;


architecture behav of ModelComposerDesign is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "ModelComposerDesign,model_composer,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7k325t-ffg900-2,HLS_INPUT_CLOCK=5.000000,HLS_INPUT_ARCH=dataflow,HLS_SYN_CLOCK=3.650000,HLS_SYN_LAT=20690,HLS_SYN_TPT=20688,HLS_SYN_MEM=3,HLS_SYN_DSP=0,HLS_SYN_FF=1820,HLS_SYN_LUT=3061,HLS_VERSION=2021_2}";
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_const_logic_1 : STD_LOGIC := '1';

    signal ap_rst_n_inv : STD_LOGIC;
    signal readStream_unsigned_char_U0_ap_start : STD_LOGIC;
    signal readStream_unsigned_char_U0_ap_done : STD_LOGIC;
    signal readStream_unsigned_char_U0_ap_continue : STD_LOGIC;
    signal readStream_unsigned_char_U0_ap_idle : STD_LOGIC;
    signal readStream_unsigned_char_U0_ap_ready : STD_LOGIC;
    signal readStream_unsigned_char_U0_Image_in_adapter_out1_din : STD_LOGIC_VECTOR (7 downto 0);
    signal readStream_unsigned_char_U0_Image_in_adapter_out1_write : STD_LOGIC;
    signal readStream_unsigned_char_U0_start_out : STD_LOGIC;
    signal readStream_unsigned_char_U0_start_write : STD_LOGIC;
    signal readStream_unsigned_char_U0_Image_in_TREADY : STD_LOGIC;
    signal SobelFilter_XMC_120_160_1_U0_ap_start : STD_LOGIC;
    signal SobelFilter_XMC_120_160_1_U0_start_out : STD_LOGIC;
    signal SobelFilter_XMC_120_160_1_U0_start_write : STD_LOGIC;
    signal SobelFilter_XMC_120_160_1_U0_Image_in_adapter_out1_read : STD_LOGIC;
    signal SobelFilter_XMC_120_160_1_U0_SobelFilter_XMC_out1_i_din : STD_LOGIC_VECTOR (15 downto 0);
    signal SobelFilter_XMC_120_160_1_U0_SobelFilter_XMC_out1_i_write : STD_LOGIC;
    signal SobelFilter_XMC_120_160_1_U0_SobelFilter_XMC_out2_i_din : STD_LOGIC_VECTOR (15 downto 0);
    signal SobelFilter_XMC_120_160_1_U0_SobelFilter_XMC_out2_i_write : STD_LOGIC;
    signal SobelFilter_XMC_120_160_1_U0_ap_done : STD_LOGIC;
    signal SobelFilter_XMC_120_160_1_U0_ap_ready : STD_LOGIC;
    signal SobelFilter_XMC_120_160_1_U0_ap_idle : STD_LOGIC;
    signal SobelFilter_XMC_120_160_1_U0_ap_continue : STD_LOGIC;
    signal GradientMag_XMC_120_160_1_U0_ap_start : STD_LOGIC;
    signal GradientMag_XMC_120_160_1_U0_start_out : STD_LOGIC;
    signal GradientMag_XMC_120_160_1_U0_start_write : STD_LOGIC;
    signal GradientMag_XMC_120_160_1_U0_SobelFilter_XMC_out1_i_read : STD_LOGIC;
    signal GradientMag_XMC_120_160_1_U0_SobelFilter_XMC_out2_i_read : STD_LOGIC;
    signal GradientMag_XMC_120_160_1_U0_GradientMag_XMC_out1_i_din : STD_LOGIC_VECTOR (15 downto 0);
    signal GradientMag_XMC_120_160_1_U0_GradientMag_XMC_out1_i_write : STD_LOGIC;
    signal GradientMag_XMC_120_160_1_U0_ap_done : STD_LOGIC;
    signal GradientMag_XMC_120_160_1_U0_ap_ready : STD_LOGIC;
    signal GradientMag_XMC_120_160_1_U0_ap_idle : STD_LOGIC;
    signal GradientMag_XMC_120_160_1_U0_ap_continue : STD_LOGIC;
    signal p31_U0_ap_start : STD_LOGIC;
    signal p31_U0_ap_done : STD_LOGIC;
    signal p31_U0_ap_continue : STD_LOGIC;
    signal p31_U0_ap_idle : STD_LOGIC;
    signal p31_U0_ap_ready : STD_LOGIC;
    signal p31_U0_GradientMag_XMC_out1_i_read : STD_LOGIC;
    signal p31_U0_ModelComposerDesign_core_Edge_out_din : STD_LOGIC_VECTOR (0 downto 0);
    signal p31_U0_ModelComposerDesign_core_Edge_out_write : STD_LOGIC;
    signal p31_U0_start_out : STD_LOGIC;
    signal p31_U0_start_write : STD_LOGIC;
    signal writeStream_bool_U0_ap_start : STD_LOGIC;
    signal writeStream_bool_U0_ap_done : STD_LOGIC;
    signal writeStream_bool_U0_ap_continue : STD_LOGIC;
    signal writeStream_bool_U0_ap_idle : STD_LOGIC;
    signal writeStream_bool_U0_ap_ready : STD_LOGIC;
    signal writeStream_bool_U0_ModelComposerDesign_core_Edge_out_read : STD_LOGIC;
    signal writeStream_bool_U0_Edge_out_TDATA : STD_LOGIC_VECTOR (7 downto 0);
    signal writeStream_bool_U0_Edge_out_TVALID : STD_LOGIC;
    signal Image_in_adapter_out1_full_n : STD_LOGIC;
    signal Image_in_adapter_out1_dout : STD_LOGIC_VECTOR (7 downto 0);
    signal Image_in_adapter_out1_empty_n : STD_LOGIC;
    signal SobelFilter_XMC_out1_full_n : STD_LOGIC;
    signal SobelFilter_XMC_out1_dout : STD_LOGIC_VECTOR (15 downto 0);
    signal SobelFilter_XMC_out1_empty_n : STD_LOGIC;
    signal SobelFilter_XMC_out2_full_n : STD_LOGIC;
    signal SobelFilter_XMC_out2_dout : STD_LOGIC_VECTOR (15 downto 0);
    signal SobelFilter_XMC_out2_empty_n : STD_LOGIC;
    signal GradientMag_XMC_out1_full_n : STD_LOGIC;
    signal GradientMag_XMC_out1_dout : STD_LOGIC_VECTOR (15 downto 0);
    signal GradientMag_XMC_out1_empty_n : STD_LOGIC;
    signal ModelComposerDesign_core_Edge_out_full_n : STD_LOGIC;
    signal ModelComposerDesign_core_Edge_out_dout : STD_LOGIC_VECTOR (0 downto 0);
    signal ModelComposerDesign_core_Edge_out_empty_n : STD_LOGIC;
    signal start_for_SobelFilter_XMC_120_160_1_U0_din : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_SobelFilter_XMC_120_160_1_U0_full_n : STD_LOGIC;
    signal start_for_SobelFilter_XMC_120_160_1_U0_dout : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_SobelFilter_XMC_120_160_1_U0_empty_n : STD_LOGIC;
    signal start_for_GradientMag_XMC_120_160_1_U0_din : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_GradientMag_XMC_120_160_1_U0_full_n : STD_LOGIC;
    signal start_for_GradientMag_XMC_120_160_1_U0_dout : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_GradientMag_XMC_120_160_1_U0_empty_n : STD_LOGIC;
    signal start_for_p31_U0_din : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_p31_U0_full_n : STD_LOGIC;
    signal start_for_p31_U0_dout : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_p31_U0_empty_n : STD_LOGIC;
    signal start_for_writeStream_bool_U0_din : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_writeStream_bool_U0_full_n : STD_LOGIC;
    signal start_for_writeStream_bool_U0_dout : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_writeStream_bool_U0_empty_n : STD_LOGIC;

    component readStream_unsigned_char_s IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        start_full_n : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        Image_in_TVALID : IN STD_LOGIC;
        Image_in_adapter_out1_din : OUT STD_LOGIC_VECTOR (7 downto 0);
        Image_in_adapter_out1_full_n : IN STD_LOGIC;
        Image_in_adapter_out1_write : OUT STD_LOGIC;
        start_out : OUT STD_LOGIC;
        start_write : OUT STD_LOGIC;
        Image_in_TDATA : IN STD_LOGIC_VECTOR (7 downto 0);
        Image_in_TREADY : OUT STD_LOGIC );
    end component;


    component SobelFilter_XMC_120_160_1_s IS
    port (
        ap_start : IN STD_LOGIC;
        start_full_n : IN STD_LOGIC;
        start_out : OUT STD_LOGIC;
        start_write : OUT STD_LOGIC;
        Image_in_adapter_out1_dout : IN STD_LOGIC_VECTOR (7 downto 0);
        Image_in_adapter_out1_empty_n : IN STD_LOGIC;
        Image_in_adapter_out1_read : OUT STD_LOGIC;
        SobelFilter_XMC_out1_i_din : OUT STD_LOGIC_VECTOR (15 downto 0);
        SobelFilter_XMC_out1_i_full_n : IN STD_LOGIC;
        SobelFilter_XMC_out1_i_write : OUT STD_LOGIC;
        SobelFilter_XMC_out2_i_din : OUT STD_LOGIC_VECTOR (15 downto 0);
        SobelFilter_XMC_out2_i_full_n : IN STD_LOGIC;
        SobelFilter_XMC_out2_i_write : OUT STD_LOGIC;
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC );
    end component;


    component GradientMag_XMC_120_160_1_s IS
    port (
        ap_start : IN STD_LOGIC;
        start_full_n : IN STD_LOGIC;
        start_out : OUT STD_LOGIC;
        start_write : OUT STD_LOGIC;
        SobelFilter_XMC_out1_i_dout : IN STD_LOGIC_VECTOR (15 downto 0);
        SobelFilter_XMC_out1_i_empty_n : IN STD_LOGIC;
        SobelFilter_XMC_out1_i_read : OUT STD_LOGIC;
        SobelFilter_XMC_out2_i_dout : IN STD_LOGIC_VECTOR (15 downto 0);
        SobelFilter_XMC_out2_i_empty_n : IN STD_LOGIC;
        SobelFilter_XMC_out2_i_read : OUT STD_LOGIC;
        GradientMag_XMC_out1_i_din : OUT STD_LOGIC_VECTOR (15 downto 0);
        GradientMag_XMC_out1_i_full_n : IN STD_LOGIC;
        GradientMag_XMC_out1_i_write : OUT STD_LOGIC;
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC );
    end component;


    component p31 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        start_full_n : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        GradientMag_XMC_out1_i_dout : IN STD_LOGIC_VECTOR (15 downto 0);
        GradientMag_XMC_out1_i_empty_n : IN STD_LOGIC;
        GradientMag_XMC_out1_i_read : OUT STD_LOGIC;
        ModelComposerDesign_core_Edge_out_din : OUT STD_LOGIC_VECTOR (0 downto 0);
        ModelComposerDesign_core_Edge_out_full_n : IN STD_LOGIC;
        ModelComposerDesign_core_Edge_out_write : OUT STD_LOGIC;
        start_out : OUT STD_LOGIC;
        start_write : OUT STD_LOGIC );
    end component;


    component writeStream_bool_s IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ModelComposerDesign_core_Edge_out_dout : IN STD_LOGIC_VECTOR (0 downto 0);
        ModelComposerDesign_core_Edge_out_empty_n : IN STD_LOGIC;
        ModelComposerDesign_core_Edge_out_read : OUT STD_LOGIC;
        Edge_out_TREADY : IN STD_LOGIC;
        Edge_out_TDATA : OUT STD_LOGIC_VECTOR (7 downto 0);
        Edge_out_TVALID : OUT STD_LOGIC );
    end component;


    component fifo_w8_d3_S IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (7 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (7 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component fifo_w16_d3_S IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (15 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (15 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component fifo_w1_d3_S IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (0 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (0 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component start_for_SobelFilter_XMC_120_160_1_U0 IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (0 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (0 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component start_for_GradientMag_XMC_120_160_1_U0 IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (0 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (0 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component start_for_p31_U0 IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (0 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (0 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component start_for_writeStream_bool_U0 IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (0 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (0 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;



begin
    readStream_unsigned_char_U0 : component readStream_unsigned_char_s
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => readStream_unsigned_char_U0_ap_start,
        start_full_n => start_for_SobelFilter_XMC_120_160_1_U0_full_n,
        ap_done => readStream_unsigned_char_U0_ap_done,
        ap_continue => readStream_unsigned_char_U0_ap_continue,
        ap_idle => readStream_unsigned_char_U0_ap_idle,
        ap_ready => readStream_unsigned_char_U0_ap_ready,
        Image_in_TVALID => Image_in_TVALID,
        Image_in_adapter_out1_din => readStream_unsigned_char_U0_Image_in_adapter_out1_din,
        Image_in_adapter_out1_full_n => Image_in_adapter_out1_full_n,
        Image_in_adapter_out1_write => readStream_unsigned_char_U0_Image_in_adapter_out1_write,
        start_out => readStream_unsigned_char_U0_start_out,
        start_write => readStream_unsigned_char_U0_start_write,
        Image_in_TDATA => Image_in_TDATA,
        Image_in_TREADY => readStream_unsigned_char_U0_Image_in_TREADY);

    SobelFilter_XMC_120_160_1_U0 : component SobelFilter_XMC_120_160_1_s
    port map (
        ap_start => SobelFilter_XMC_120_160_1_U0_ap_start,
        start_full_n => start_for_GradientMag_XMC_120_160_1_U0_full_n,
        start_out => SobelFilter_XMC_120_160_1_U0_start_out,
        start_write => SobelFilter_XMC_120_160_1_U0_start_write,
        Image_in_adapter_out1_dout => Image_in_adapter_out1_dout,
        Image_in_adapter_out1_empty_n => Image_in_adapter_out1_empty_n,
        Image_in_adapter_out1_read => SobelFilter_XMC_120_160_1_U0_Image_in_adapter_out1_read,
        SobelFilter_XMC_out1_i_din => SobelFilter_XMC_120_160_1_U0_SobelFilter_XMC_out1_i_din,
        SobelFilter_XMC_out1_i_full_n => SobelFilter_XMC_out1_full_n,
        SobelFilter_XMC_out1_i_write => SobelFilter_XMC_120_160_1_U0_SobelFilter_XMC_out1_i_write,
        SobelFilter_XMC_out2_i_din => SobelFilter_XMC_120_160_1_U0_SobelFilter_XMC_out2_i_din,
        SobelFilter_XMC_out2_i_full_n => SobelFilter_XMC_out2_full_n,
        SobelFilter_XMC_out2_i_write => SobelFilter_XMC_120_160_1_U0_SobelFilter_XMC_out2_i_write,
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_done => SobelFilter_XMC_120_160_1_U0_ap_done,
        ap_ready => SobelFilter_XMC_120_160_1_U0_ap_ready,
        ap_idle => SobelFilter_XMC_120_160_1_U0_ap_idle,
        ap_continue => SobelFilter_XMC_120_160_1_U0_ap_continue);

    GradientMag_XMC_120_160_1_U0 : component GradientMag_XMC_120_160_1_s
    port map (
        ap_start => GradientMag_XMC_120_160_1_U0_ap_start,
        start_full_n => start_for_p31_U0_full_n,
        start_out => GradientMag_XMC_120_160_1_U0_start_out,
        start_write => GradientMag_XMC_120_160_1_U0_start_write,
        SobelFilter_XMC_out1_i_dout => SobelFilter_XMC_out1_dout,
        SobelFilter_XMC_out1_i_empty_n => SobelFilter_XMC_out1_empty_n,
        SobelFilter_XMC_out1_i_read => GradientMag_XMC_120_160_1_U0_SobelFilter_XMC_out1_i_read,
        SobelFilter_XMC_out2_i_dout => SobelFilter_XMC_out2_dout,
        SobelFilter_XMC_out2_i_empty_n => SobelFilter_XMC_out2_empty_n,
        SobelFilter_XMC_out2_i_read => GradientMag_XMC_120_160_1_U0_SobelFilter_XMC_out2_i_read,
        GradientMag_XMC_out1_i_din => GradientMag_XMC_120_160_1_U0_GradientMag_XMC_out1_i_din,
        GradientMag_XMC_out1_i_full_n => GradientMag_XMC_out1_full_n,
        GradientMag_XMC_out1_i_write => GradientMag_XMC_120_160_1_U0_GradientMag_XMC_out1_i_write,
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_done => GradientMag_XMC_120_160_1_U0_ap_done,
        ap_ready => GradientMag_XMC_120_160_1_U0_ap_ready,
        ap_idle => GradientMag_XMC_120_160_1_U0_ap_idle,
        ap_continue => GradientMag_XMC_120_160_1_U0_ap_continue);

    p31_U0 : component p31
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => p31_U0_ap_start,
        start_full_n => start_for_writeStream_bool_U0_full_n,
        ap_done => p31_U0_ap_done,
        ap_continue => p31_U0_ap_continue,
        ap_idle => p31_U0_ap_idle,
        ap_ready => p31_U0_ap_ready,
        GradientMag_XMC_out1_i_dout => GradientMag_XMC_out1_dout,
        GradientMag_XMC_out1_i_empty_n => GradientMag_XMC_out1_empty_n,
        GradientMag_XMC_out1_i_read => p31_U0_GradientMag_XMC_out1_i_read,
        ModelComposerDesign_core_Edge_out_din => p31_U0_ModelComposerDesign_core_Edge_out_din,
        ModelComposerDesign_core_Edge_out_full_n => ModelComposerDesign_core_Edge_out_full_n,
        ModelComposerDesign_core_Edge_out_write => p31_U0_ModelComposerDesign_core_Edge_out_write,
        start_out => p31_U0_start_out,
        start_write => p31_U0_start_write);

    writeStream_bool_U0 : component writeStream_bool_s
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => writeStream_bool_U0_ap_start,
        ap_done => writeStream_bool_U0_ap_done,
        ap_continue => writeStream_bool_U0_ap_continue,
        ap_idle => writeStream_bool_U0_ap_idle,
        ap_ready => writeStream_bool_U0_ap_ready,
        ModelComposerDesign_core_Edge_out_dout => ModelComposerDesign_core_Edge_out_dout,
        ModelComposerDesign_core_Edge_out_empty_n => ModelComposerDesign_core_Edge_out_empty_n,
        ModelComposerDesign_core_Edge_out_read => writeStream_bool_U0_ModelComposerDesign_core_Edge_out_read,
        Edge_out_TREADY => Edge_out_TREADY,
        Edge_out_TDATA => writeStream_bool_U0_Edge_out_TDATA,
        Edge_out_TVALID => writeStream_bool_U0_Edge_out_TVALID);

    Image_in_adapter_out1_U : component fifo_w8_d3_S
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => readStream_unsigned_char_U0_Image_in_adapter_out1_din,
        if_full_n => Image_in_adapter_out1_full_n,
        if_write => readStream_unsigned_char_U0_Image_in_adapter_out1_write,
        if_dout => Image_in_adapter_out1_dout,
        if_empty_n => Image_in_adapter_out1_empty_n,
        if_read => SobelFilter_XMC_120_160_1_U0_Image_in_adapter_out1_read);

    SobelFilter_XMC_out1_U : component fifo_w16_d3_S
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => SobelFilter_XMC_120_160_1_U0_SobelFilter_XMC_out1_i_din,
        if_full_n => SobelFilter_XMC_out1_full_n,
        if_write => SobelFilter_XMC_120_160_1_U0_SobelFilter_XMC_out1_i_write,
        if_dout => SobelFilter_XMC_out1_dout,
        if_empty_n => SobelFilter_XMC_out1_empty_n,
        if_read => GradientMag_XMC_120_160_1_U0_SobelFilter_XMC_out1_i_read);

    SobelFilter_XMC_out2_U : component fifo_w16_d3_S
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => SobelFilter_XMC_120_160_1_U0_SobelFilter_XMC_out2_i_din,
        if_full_n => SobelFilter_XMC_out2_full_n,
        if_write => SobelFilter_XMC_120_160_1_U0_SobelFilter_XMC_out2_i_write,
        if_dout => SobelFilter_XMC_out2_dout,
        if_empty_n => SobelFilter_XMC_out2_empty_n,
        if_read => GradientMag_XMC_120_160_1_U0_SobelFilter_XMC_out2_i_read);

    GradientMag_XMC_out1_U : component fifo_w16_d3_S
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => GradientMag_XMC_120_160_1_U0_GradientMag_XMC_out1_i_din,
        if_full_n => GradientMag_XMC_out1_full_n,
        if_write => GradientMag_XMC_120_160_1_U0_GradientMag_XMC_out1_i_write,
        if_dout => GradientMag_XMC_out1_dout,
        if_empty_n => GradientMag_XMC_out1_empty_n,
        if_read => p31_U0_GradientMag_XMC_out1_i_read);

    ModelComposerDesign_core_Edge_out_U : component fifo_w1_d3_S
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => p31_U0_ModelComposerDesign_core_Edge_out_din,
        if_full_n => ModelComposerDesign_core_Edge_out_full_n,
        if_write => p31_U0_ModelComposerDesign_core_Edge_out_write,
        if_dout => ModelComposerDesign_core_Edge_out_dout,
        if_empty_n => ModelComposerDesign_core_Edge_out_empty_n,
        if_read => writeStream_bool_U0_ModelComposerDesign_core_Edge_out_read);

    start_for_SobelFilter_XMC_120_160_1_U0_U : component start_for_SobelFilter_XMC_120_160_1_U0
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => start_for_SobelFilter_XMC_120_160_1_U0_din,
        if_full_n => start_for_SobelFilter_XMC_120_160_1_U0_full_n,
        if_write => readStream_unsigned_char_U0_start_write,
        if_dout => start_for_SobelFilter_XMC_120_160_1_U0_dout,
        if_empty_n => start_for_SobelFilter_XMC_120_160_1_U0_empty_n,
        if_read => SobelFilter_XMC_120_160_1_U0_ap_ready);

    start_for_GradientMag_XMC_120_160_1_U0_U : component start_for_GradientMag_XMC_120_160_1_U0
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => start_for_GradientMag_XMC_120_160_1_U0_din,
        if_full_n => start_for_GradientMag_XMC_120_160_1_U0_full_n,
        if_write => SobelFilter_XMC_120_160_1_U0_start_write,
        if_dout => start_for_GradientMag_XMC_120_160_1_U0_dout,
        if_empty_n => start_for_GradientMag_XMC_120_160_1_U0_empty_n,
        if_read => GradientMag_XMC_120_160_1_U0_ap_ready);

    start_for_p31_U0_U : component start_for_p31_U0
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => start_for_p31_U0_din,
        if_full_n => start_for_p31_U0_full_n,
        if_write => GradientMag_XMC_120_160_1_U0_start_write,
        if_dout => start_for_p31_U0_dout,
        if_empty_n => start_for_p31_U0_empty_n,
        if_read => p31_U0_ap_ready);

    start_for_writeStream_bool_U0_U : component start_for_writeStream_bool_U0
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => start_for_writeStream_bool_U0_din,
        if_full_n => start_for_writeStream_bool_U0_full_n,
        if_write => p31_U0_start_write,
        if_dout => start_for_writeStream_bool_U0_dout,
        if_empty_n => start_for_writeStream_bool_U0_empty_n,
        if_read => writeStream_bool_U0_ap_ready);




    Edge_out_TDATA <= writeStream_bool_U0_Edge_out_TDATA;
    Edge_out_TVALID <= writeStream_bool_U0_Edge_out_TVALID;
    GradientMag_XMC_120_160_1_U0_ap_continue <= ap_const_logic_1;
    GradientMag_XMC_120_160_1_U0_ap_start <= start_for_GradientMag_XMC_120_160_1_U0_empty_n;
    Image_in_TREADY <= readStream_unsigned_char_U0_Image_in_TREADY;
    SobelFilter_XMC_120_160_1_U0_ap_continue <= ap_const_logic_1;
    SobelFilter_XMC_120_160_1_U0_ap_start <= start_for_SobelFilter_XMC_120_160_1_U0_empty_n;
    ap_local_block <= ap_const_logic_0;
    ap_local_deadlock <= ap_const_logic_0;

    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;

    p31_U0_ap_continue <= ap_const_logic_1;
    p31_U0_ap_start <= start_for_p31_U0_empty_n;
    readStream_unsigned_char_U0_ap_continue <= ap_const_logic_1;
    readStream_unsigned_char_U0_ap_start <= ap_const_logic_1;
    start_for_GradientMag_XMC_120_160_1_U0_din <= (0=>ap_const_logic_1, others=>'-');
    start_for_SobelFilter_XMC_120_160_1_U0_din <= (0=>ap_const_logic_1, others=>'-');
    start_for_p31_U0_din <= (0=>ap_const_logic_1, others=>'-');
    start_for_writeStream_bool_U0_din <= (0=>ap_const_logic_1, others=>'-');
    writeStream_bool_U0_ap_continue <= ap_const_logic_1;
    writeStream_bool_U0_ap_start <= start_for_writeStream_bool_U0_empty_n;
end behav;
