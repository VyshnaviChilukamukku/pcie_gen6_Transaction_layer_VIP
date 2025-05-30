
class pcie_g6_tlp_agent_config extends uvm_object;
  `uvm_object_utils(pcie_g6_tlp_agent_config)
  
  uvm_active_passive_enum is_active = UVM_ACTIVE;
  virtual pcie_g6_tlp_if vif;
  
  function new(string name="pcie_g6_tlp_agent_config");
    super.new(name);
  endfunction
  
endclass
