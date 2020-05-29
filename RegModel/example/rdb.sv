// This file is generated using Cadence iregGen version 14.10.s014 

`ifndef RDB_SV
`define RDB_SV

// Input File: ipxact.xml

// Number of AddrMaps = 1
// Number of RegFiles = 1
// Number of Registers = 1
// Number of Memories = 0


//////////////////////////////////////////////////////////////////////////////
// Register definition
//////////////////////////////////////////////////////////////////////////////

class spi_ctrl_type extends uvm_reg;

  rand uvm_reg_field field1;
  rand uvm_reg_field field2;
  rand uvm_reg_field field3;
  rand uvm_reg_field field4;
  rand uvm_reg_field field5;
  rand uvm_reg_field field6;
  rand uvm_reg_field field7;
  rand uvm_reg_field field8;
  rand uvm_reg_field field9;

  virtual function void build();
    field1 = uvm_reg_field::type_id::create("field1");
    field1.configure(this, 2, 0, "RW", 0, `UVM_REG_DATA_WIDTH'd3208179>>0, 1, 1, 1);
    field2 = uvm_reg_field::type_id::create("field2");
    field2.configure(this, 2, 2, "RO", 0, `UVM_REG_DATA_WIDTH'd3208179>>2, 1, 1, 1);
    field3 = uvm_reg_field::type_id::create("field3");
    field3.configure(this, 2, 4, "RO", 0, `UVM_REG_DATA_WIDTH'd3208179>>4, 1, 1, 1);
    field4 = uvm_reg_field::type_id::create("field4");
    field4.configure(this, 2, 6, "RO", 0, `UVM_REG_DATA_WIDTH'd3208179>>6, 1, 1, 1);
    field5 = uvm_reg_field::type_id::create("field5");
    field5.configure(this, 2, 8, "RW", 0, `UVM_REG_DATA_WIDTH'd3208179>>8, 1, 1, 1);
    field6 = uvm_reg_field::type_id::create("field6");
    field6.configure(this, 2, 10, "RO", 0, `UVM_REG_DATA_WIDTH'd3208179>>10, 1, 1, 1);
    field7 = uvm_reg_field::type_id::create("field7");
    field7.configure(this, 2, 12, "RO", 0, `UVM_REG_DATA_WIDTH'd3208179>>12, 1, 1, 1);
    field8 = uvm_reg_field::type_id::create("field8");
    field8.configure(this, 6, 14, "RO", 0, `UVM_REG_DATA_WIDTH'd3208179>>14, 1, 1, 1);
    field9 = uvm_reg_field::type_id::create("field9");
    field9.configure(this, 12, 20, "RO", 0, `UVM_REG_DATA_WIDTH'd3208179>>20, 1, 1, 1);
    wr_cg.set_inst_name($sformatf("%s.wcov", get_full_name()));
    rd_cg.set_inst_name($sformatf("%s.rcov", get_full_name()));
  endfunction

  covergroup wr_cg;
    option.per_instance=1;
    field1 : coverpoint field1.value[1:0];
    field2 : coverpoint field2.value[1:0];
    field3 : coverpoint field3.value[1:0];
    field4 : coverpoint field4.value[1:0];
    field5 : coverpoint field5.value[1:0];
    field6 : coverpoint field6.value[1:0];
    field7 : coverpoint field7.value[1:0];
    field8 : coverpoint field8.value[5:0];
    field9 : coverpoint field9.value[11:0];
  endgroup
  covergroup rd_cg;
    option.per_instance=1;
    field1 : coverpoint field1.value[1:0];
    field2 : coverpoint field2.value[1:0];
    field3 : coverpoint field3.value[1:0];
    field4 : coverpoint field4.value[1:0];
    field5 : coverpoint field5.value[1:0];
    field6 : coverpoint field6.value[1:0];
    field7 : coverpoint field7.value[1:0];
    field8 : coverpoint field8.value[5:0];
    field9 : coverpoint field9.value[11:0];
  endgroup

  protected virtual function void sample(uvm_reg_data_t  data, byte_en, bit is_read, uvm_reg_map map);
    super.sample(data, byte_en, is_read, map);
    if(!is_read) wr_cg.sample();
    if(is_read) rd_cg.sample();
  endfunction

  `uvm_register_cb(spi_ctrl_type, uvm_reg_cbs) 
  `uvm_set_super_type(spi_ctrl_type, uvm_reg)
  `uvm_object_utils(spi_ctrl_type)
  function new(input string name="unnamed-spi_ctrl_type");
    super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
    wr_cg=new;
    rd_cg=new;
  endfunction : new
endclass : spi_ctrl_type

class SPI_TOP_type extends uvm_reg_block;

  rand spi_ctrl_type spi_ctrl;

  virtual function void build();

    // Now create all registers

    spi_ctrl = spi_ctrl_type::type_id::create("spi_ctrl", , get_full_name());

    // Now build the registers. Set parent and hdl_paths

    spi_ctrl.configure(this, null, "");
    spi_ctrl.build();
    // Now define address mappings
    default_map = create_map("default_map", 0, 4, UVM_LITTLE_ENDIAN);
    default_map.add_reg(spi_ctrl, `UVM_REG_ADDR_WIDTH'hacdb, "RW");
  endfunction

  `uvm_object_utils(SPI_TOP_type)
  function new(input string name="unnamed-SPI_TOP");
    super.new(name, UVM_NO_COVERAGE);
  endfunction : new

endclass : SPI_TOP_type

//////////////////////////////////////////////////////////////////////////////
// Address_map definition
//////////////////////////////////////////////////////////////////////////////
class top_reg_type extends uvm_reg_block;

  rand SPI_TOP_type SPI_TOP;

  virtual function void build();
    // Now define address mappings
    default_map = create_map("default_map", 0, 4, UVM_LITTLE_ENDIAN);
    SPI_TOP = SPI_TOP_type::type_id::create("SPI_TOP", , get_full_name());
    SPI_TOP.configure(this, "");
    SPI_TOP.build();
    SPI_TOP.lock_model();
    default_map.add_submap(SPI_TOP.default_map, `UVM_REG_ADDR_WIDTH'hfa12345678);
    this.lock_model();
  endfunction
  `uvm_object_utils(top_reg_type)
  function new(input string name="unnamed-top_reg_type");
    super.new(name, UVM_NO_COVERAGE);
  endfunction
endclass : top_reg_type

`endif // RDB_SV
