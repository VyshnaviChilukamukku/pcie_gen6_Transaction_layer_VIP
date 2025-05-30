
`include "pcie_g6_tlp_package.sv"
`include "pcie_g6_tlp_if.sv"

module tb_top;
  bit i_tlp_clk, i_tlp_rst;
  pcie_g6_tlp_if tl_intf(i_tlp_clk, i_tlp_rst);
  
  initial begin 
    i_tlp_clk = 0; 
    forever #5 i_tlp_clk = ~i_tlp_clk;
  end
  
  initial begin
    tl_intf.i_linkup=0;
    #10 tl_intf.i_linkup=1;
  end
  
  initial begin
    // MUST use this exact name that matches what the test looks for
    uvm_config_db#(virtual pcie_g6_tlp_if)::set(null, "*", "pcie_g6_tlp_vif", tl_intf);
    
    run_test("pcie_g6_tlp_test");
//      run_test("pcie_g6_tlp_cfg_rd_vseq");
  end
  
  initial begin
  $display("[TB] Setting interface at time %0t", $time);
  uvm_config_db#(virtual pcie_g6_tlp_if)::set(null, "*", "pcie_g6_tlp_vif", tl_intf);
end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
    
