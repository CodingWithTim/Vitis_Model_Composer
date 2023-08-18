-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
-- Version: 2021.2
-- Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity xFMagnitudeKernel_2_2_120_160_3_3_1_5_5_160_2_s is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    start_full_n : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    start_out : OUT STD_LOGIC;
    start_write : OUT STD_LOGIC;
    srcX_obj_449_dout : IN STD_LOGIC_VECTOR (15 downto 0);
    srcX_obj_449_empty_n : IN STD_LOGIC;
    srcX_obj_449_read : OUT STD_LOGIC;
    srcY_obj_450_dout : IN STD_LOGIC_VECTOR (15 downto 0);
    srcY_obj_450_empty_n : IN STD_LOGIC;
    srcY_obj_450_read : OUT STD_LOGIC;
    dst_obj_451_din : OUT STD_LOGIC_VECTOR (15 downto 0);
    dst_obj_451_full_n : IN STD_LOGIC;
    dst_obj_451_write : OUT STD_LOGIC );
end;


architecture behav of xFMagnitudeKernel_2_2_120_160_3_3_1_5_5_160_2_s is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (2 downto 0) := "010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv7_0 : STD_LOGIC_VECTOR (6 downto 0) := "0000000";
    constant ap_const_lv7_78 : STD_LOGIC_VECTOR (6 downto 0) := "1111000";
    constant ap_const_lv7_1 : STD_LOGIC_VECTOR (6 downto 0) := "0000001";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";

attribute shreg_extract : string;
    signal real_start : STD_LOGIC;
    signal start_once_reg : STD_LOGIC := '0';
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (2 downto 0) := "001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal internal_ap_ready : STD_LOGIC;
    signal grp_xFMagnitudeKernel_2_2_120_160_3_3_1_5_5_160_2_Pipeline_colLoop_fu_38_ap_start : STD_LOGIC;
    signal grp_xFMagnitudeKernel_2_2_120_160_3_3_1_5_5_160_2_Pipeline_colLoop_fu_38_ap_done : STD_LOGIC;
    signal grp_xFMagnitudeKernel_2_2_120_160_3_3_1_5_5_160_2_Pipeline_colLoop_fu_38_ap_idle : STD_LOGIC;
    signal grp_xFMagnitudeKernel_2_2_120_160_3_3_1_5_5_160_2_Pipeline_colLoop_fu_38_ap_ready : STD_LOGIC;
    signal grp_xFMagnitudeKernel_2_2_120_160_3_3_1_5_5_160_2_Pipeline_colLoop_fu_38_srcX_obj_449_read : STD_LOGIC;
    signal grp_xFMagnitudeKernel_2_2_120_160_3_3_1_5_5_160_2_Pipeline_colLoop_fu_38_srcY_obj_450_read : STD_LOGIC;
    signal grp_xFMagnitudeKernel_2_2_120_160_3_3_1_5_5_160_2_Pipeline_colLoop_fu_38_dst_obj_451_din : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_xFMagnitudeKernel_2_2_120_160_3_3_1_5_5_160_2_Pipeline_colLoop_fu_38_dst_obj_451_write : STD_LOGIC;
    signal grp_xFMagnitudeKernel_2_2_120_160_3_3_1_5_5_160_2_Pipeline_colLoop_fu_38_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal icmp_ln72_fu_56_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal i_fu_34 : STD_LOGIC_VECTOR (6 downto 0);
    signal i_2_fu_62_p2 : STD_LOGIC_VECTOR (6 downto 0);
    signal ap_block_state1 : BOOLEAN;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component xFMagnitudeKernel_2_2_120_160_3_3_1_5_5_160_2_Pipeline_colLoop IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        srcX_obj_449_dout : IN STD_LOGIC_VECTOR (15 downto 0);
        srcX_obj_449_empty_n : IN STD_LOGIC;
        srcX_obj_449_read : OUT STD_LOGIC;
        srcY_obj_450_dout : IN STD_LOGIC_VECTOR (15 downto 0);
        srcY_obj_450_empty_n : IN STD_LOGIC;
        srcY_obj_450_read : OUT STD_LOGIC;
        dst_obj_451_din : OUT STD_LOGIC_VECTOR (15 downto 0);
        dst_obj_451_full_n : IN STD_LOGIC;
        dst_obj_451_write : OUT STD_LOGIC );
    end component;



begin
    grp_xFMagnitudeKernel_2_2_120_160_3_3_1_5_5_160_2_Pipeline_colLoop_fu_38 : component xFMagnitudeKernel_2_2_120_160_3_3_1_5_5_160_2_Pipeline_colLoop
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_xFMagnitudeKernel_2_2_120_160_3_3_1_5_5_160_2_Pipeline_colLoop_fu_38_ap_start,
        ap_done => grp_xFMagnitudeKernel_2_2_120_160_3_3_1_5_5_160_2_Pipeline_colLoop_fu_38_ap_done,
        ap_idle => grp_xFMagnitudeKernel_2_2_120_160_3_3_1_5_5_160_2_Pipeline_colLoop_fu_38_ap_idle,
        ap_ready => grp_xFMagnitudeKernel_2_2_120_160_3_3_1_5_5_160_2_Pipeline_colLoop_fu_38_ap_ready,
        srcX_obj_449_dout => srcX_obj_449_dout,
        srcX_obj_449_empty_n => srcX_obj_449_empty_n,
        srcX_obj_449_read => grp_xFMagnitudeKernel_2_2_120_160_3_3_1_5_5_160_2_Pipeline_colLoop_fu_38_srcX_obj_449_read,
        srcY_obj_450_dout => srcY_obj_450_dout,
        srcY_obj_450_empty_n => srcY_obj_450_empty_n,
        srcY_obj_450_read => grp_xFMagnitudeKernel_2_2_120_160_3_3_1_5_5_160_2_Pipeline_colLoop_fu_38_srcY_obj_450_read,
        dst_obj_451_din => grp_xFMagnitudeKernel_2_2_120_160_3_3_1_5_5_160_2_Pipeline_colLoop_fu_38_dst_obj_451_din,
        dst_obj_451_full_n => dst_obj_451_full_n,
        dst_obj_451_write => grp_xFMagnitudeKernel_2_2_120_160_3_3_1_5_5_160_2_Pipeline_colLoop_fu_38_dst_obj_451_write);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((icmp_ln72_fu_56_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    grp_xFMagnitudeKernel_2_2_120_160_3_3_1_5_5_160_2_Pipeline_colLoop_fu_38_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_xFMagnitudeKernel_2_2_120_160_3_3_1_5_5_160_2_Pipeline_colLoop_fu_38_ap_start_reg <= ap_const_logic_0;
            else
                if (((icmp_ln72_fu_56_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                    grp_xFMagnitudeKernel_2_2_120_160_3_3_1_5_5_160_2_Pipeline_colLoop_fu_38_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_xFMagnitudeKernel_2_2_120_160_3_3_1_5_5_160_2_Pipeline_colLoop_fu_38_ap_ready = ap_const_logic_1)) then 
                    grp_xFMagnitudeKernel_2_2_120_160_3_3_1_5_5_160_2_Pipeline_colLoop_fu_38_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    start_once_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                start_once_reg <= ap_const_logic_0;
            else
                if (((real_start = ap_const_logic_1) and (internal_ap_ready = ap_const_logic_0))) then 
                    start_once_reg <= ap_const_logic_1;
                elsif ((internal_ap_ready = ap_const_logic_1)) then 
                    start_once_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    i_fu_34_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                i_fu_34 <= ap_const_lv7_0;
            elsif (((icmp_ln72_fu_56_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                i_fu_34 <= i_2_fu_62_p2;
            end if; 
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (real_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, grp_xFMagnitudeKernel_2_2_120_160_3_3_1_5_5_160_2_Pipeline_colLoop_fu_38_ap_done, ap_CS_fsm_state2, icmp_ln72_fu_56_p2, ap_CS_fsm_state3)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((icmp_ln72_fu_56_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state3 => 
                if (((grp_xFMagnitudeKernel_2_2_120_160_3_3_1_5_5_160_2_Pipeline_colLoop_fu_38_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when others =>  
                ap_NS_fsm <= "XXX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);

    ap_ST_fsm_state1_blk_assign_proc : process(real_start, ap_done_reg)
    begin
        if (((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state2_blk <= ap_const_logic_0;

    ap_ST_fsm_state3_blk_assign_proc : process(grp_xFMagnitudeKernel_2_2_120_160_3_3_1_5_5_160_2_Pipeline_colLoop_fu_38_ap_done)
    begin
        if ((grp_xFMagnitudeKernel_2_2_120_160_3_3_1_5_5_160_2_Pipeline_colLoop_fu_38_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state3_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state3_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_block_state1_assign_proc : process(real_start, ap_done_reg)
    begin
                ap_block_state1 <= ((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    ap_done_assign_proc : process(ap_done_reg, ap_CS_fsm_state2, icmp_ln72_fu_56_p2)
    begin
        if (((icmp_ln72_fu_56_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(real_start, ap_CS_fsm_state1)
    begin
        if (((real_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;

    ap_ready <= internal_ap_ready;
    dst_obj_451_din <= grp_xFMagnitudeKernel_2_2_120_160_3_3_1_5_5_160_2_Pipeline_colLoop_fu_38_dst_obj_451_din;

    dst_obj_451_write_assign_proc : process(grp_xFMagnitudeKernel_2_2_120_160_3_3_1_5_5_160_2_Pipeline_colLoop_fu_38_dst_obj_451_write, ap_CS_fsm_state3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            dst_obj_451_write <= grp_xFMagnitudeKernel_2_2_120_160_3_3_1_5_5_160_2_Pipeline_colLoop_fu_38_dst_obj_451_write;
        else 
            dst_obj_451_write <= ap_const_logic_0;
        end if; 
    end process;

    grp_xFMagnitudeKernel_2_2_120_160_3_3_1_5_5_160_2_Pipeline_colLoop_fu_38_ap_start <= grp_xFMagnitudeKernel_2_2_120_160_3_3_1_5_5_160_2_Pipeline_colLoop_fu_38_ap_start_reg;
    i_2_fu_62_p2 <= std_logic_vector(unsigned(i_fu_34) + unsigned(ap_const_lv7_1));
    icmp_ln72_fu_56_p2 <= "1" when (i_fu_34 = ap_const_lv7_78) else "0";

    internal_ap_ready_assign_proc : process(ap_CS_fsm_state2, icmp_ln72_fu_56_p2)
    begin
        if (((icmp_ln72_fu_56_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            internal_ap_ready <= ap_const_logic_1;
        else 
            internal_ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    real_start_assign_proc : process(ap_start, start_full_n, start_once_reg)
    begin
        if (((start_once_reg = ap_const_logic_0) and (start_full_n = ap_const_logic_0))) then 
            real_start <= ap_const_logic_0;
        else 
            real_start <= ap_start;
        end if; 
    end process;


    srcX_obj_449_read_assign_proc : process(grp_xFMagnitudeKernel_2_2_120_160_3_3_1_5_5_160_2_Pipeline_colLoop_fu_38_srcX_obj_449_read, ap_CS_fsm_state3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            srcX_obj_449_read <= grp_xFMagnitudeKernel_2_2_120_160_3_3_1_5_5_160_2_Pipeline_colLoop_fu_38_srcX_obj_449_read;
        else 
            srcX_obj_449_read <= ap_const_logic_0;
        end if; 
    end process;


    srcY_obj_450_read_assign_proc : process(grp_xFMagnitudeKernel_2_2_120_160_3_3_1_5_5_160_2_Pipeline_colLoop_fu_38_srcY_obj_450_read, ap_CS_fsm_state3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            srcY_obj_450_read <= grp_xFMagnitudeKernel_2_2_120_160_3_3_1_5_5_160_2_Pipeline_colLoop_fu_38_srcY_obj_450_read;
        else 
            srcY_obj_450_read <= ap_const_logic_0;
        end if; 
    end process;

    start_out <= real_start;

    start_write_assign_proc : process(real_start, start_once_reg)
    begin
        if (((real_start = ap_const_logic_1) and (start_once_reg = ap_const_logic_0))) then 
            start_write <= ap_const_logic_1;
        else 
            start_write <= ap_const_logic_0;
        end if; 
    end process;

end behav;