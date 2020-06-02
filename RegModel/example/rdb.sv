// This file is generated using Cadence iregGen version 14.10.s014 

`ifndef RDB_SV
`define RDB_SV

// Input File: ipxact.xml

// Number of AddrMaps = 1
// Number of RegFiles = 2
// Number of Registers = 5
// Number of Memories = 0


//////////////////////////////////////////////////////////////////////////////
// Register definition
//////////////////////////////////////////////////////////////////////////////

class spi_ctrl_type extends uvm_reg;

  rand uvm_reg_field spi_ctrl0;
  rand uvm_reg_field spi_ctrl1;
  rand uvm_reg_field spi_ctrl2;
  rand uvm_reg_field spi_ctrl3;
  rand uvm_reg_field spi_ctrl4;
  rand uvm_reg_field spi_ctrl5;
  rand uvm_reg_field spi_ctrl6;
  rand uvm_reg_field spi_ctrl7;
  rand uvm_reg_field spi_ctrl8;

  virtual function void build();
    spi_ctrl0 = uvm_reg_field::type_id::create("spi_ctrl0");
    spi_ctrl0.configure(this, 2, 0, "RW", 0, `UVM_REG_DATA_WIDTH'd3208179>>0, 1, 1, 1);
    spi_ctrl1 = uvm_reg_field::type_id::create("spi_ctrl1");
    spi_ctrl1.configure(this, 2, 2, "RO", 0, `UVM_REG_DATA_WIDTH'd3208179>>2, 1, 1, 1);
    spi_ctrl2 = uvm_reg_field::type_id::create("spi_ctrl2");
    spi_ctrl2.configure(this, 2, 4, "RO", 0, `UVM_REG_DATA_WIDTH'd3208179>>4, 1, 1, 1);
    spi_ctrl3 = uvm_reg_field::type_id::create("spi_ctrl3");
    spi_ctrl3.configure(this, 2, 6, "RO", 0, `UVM_REG_DATA_WIDTH'd3208179>>6, 1, 1, 1);
    spi_ctrl4 = uvm_reg_field::type_id::create("spi_ctrl4");
    spi_ctrl4.configure(this, 2, 8, "RW", 0, `UVM_REG_DATA_WIDTH'd3208179>>8, 1, 1, 1);
    spi_ctrl5 = uvm_reg_field::type_id::create("spi_ctrl5");
    spi_ctrl5.configure(this, 2, 10, "RO", 0, `UVM_REG_DATA_WIDTH'd3208179>>10, 1, 1, 1);
    spi_ctrl6 = uvm_reg_field::type_id::create("spi_ctrl6");
    spi_ctrl6.configure(this, 2, 12, "RO", 0, `UVM_REG_DATA_WIDTH'd3208179>>12, 1, 1, 1);
    spi_ctrl7 = uvm_reg_field::type_id::create("spi_ctrl7");
    spi_ctrl7.configure(this, 6, 14, "RO", 0, `UVM_REG_DATA_WIDTH'd3208179>>14, 1, 1, 1);
    spi_ctrl8 = uvm_reg_field::type_id::create("spi_ctrl8");
    spi_ctrl8.configure(this, 12, 20, "RO", 0, `UVM_REG_DATA_WIDTH'd3208179>>20, 1, 1, 1);
    wr_cg.set_inst_name($sformatf("%s.wcov", get_full_name()));
    rd_cg.set_inst_name($sformatf("%s.rcov", get_full_name()));
  endfunction

  covergroup wr_cg;
    option.per_instance=1;
    spi_ctrl0 : coverpoint spi_ctrl0.value[1:0];
    spi_ctrl1 : coverpoint spi_ctrl1.value[1:0];
    spi_ctrl2 : coverpoint spi_ctrl2.value[1:0];
    spi_ctrl3 : coverpoint spi_ctrl3.value[1:0];
    spi_ctrl4 : coverpoint spi_ctrl4.value[1:0];
    spi_ctrl5 : coverpoint spi_ctrl5.value[1:0];
    spi_ctrl6 : coverpoint spi_ctrl6.value[1:0];
    spi_ctrl7 : coverpoint spi_ctrl7.value[5:0];
    spi_ctrl8 : coverpoint spi_ctrl8.value[11:0];
  endgroup
  covergroup rd_cg;
    option.per_instance=1;
    spi_ctrl0 : coverpoint spi_ctrl0.value[1:0];
    spi_ctrl1 : coverpoint spi_ctrl1.value[1:0];
    spi_ctrl2 : coverpoint spi_ctrl2.value[1:0];
    spi_ctrl3 : coverpoint spi_ctrl3.value[1:0];
    spi_ctrl4 : coverpoint spi_ctrl4.value[1:0];
    spi_ctrl5 : coverpoint spi_ctrl5.value[1:0];
    spi_ctrl6 : coverpoint spi_ctrl6.value[1:0];
    spi_ctrl7 : coverpoint spi_ctrl7.value[5:0];
    spi_ctrl8 : coverpoint spi_ctrl8.value[11:0];
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

//////////////////////////////////////////////////////////////////////////////
// Register definition
//////////////////////////////////////////////////////////////////////////////

class spi_dat_type extends uvm_reg;

  rand uvm_reg_field spi_dat0;
  rand uvm_reg_field spi_dat1;
  rand uvm_reg_field spi_dat2;
  rand uvm_reg_field spi_dat3;
  rand uvm_reg_field spi_dat4;
  rand uvm_reg_field spi_dat5;

  virtual function void build();
    spi_dat0 = uvm_reg_field::type_id::create("spi_dat0");
    spi_dat0.configure(this, 1, 0, "RW", 0, `UVM_REG_DATA_WIDTH'd6295311>>0, 1, 1, 1);
    spi_dat1 = uvm_reg_field::type_id::create("spi_dat1");
    spi_dat1.configure(this, 1, 1, "RO", 0, `UVM_REG_DATA_WIDTH'd6295311>>1, 1, 1, 1);
    spi_dat2 = uvm_reg_field::type_id::create("spi_dat2");
    spi_dat2.configure(this, 6, 2, "RO", 0, `UVM_REG_DATA_WIDTH'd6295311>>2, 1, 1, 1);
    spi_dat3 = uvm_reg_field::type_id::create("spi_dat3");
    spi_dat3.configure(this, 2, 8, "RO", 0, `UVM_REG_DATA_WIDTH'd6295311>>8, 1, 1, 1);
    spi_dat4 = uvm_reg_field::type_id::create("spi_dat4");
    spi_dat4.configure(this, 11, 10, "RW", 0, `UVM_REG_DATA_WIDTH'd6295311>>10, 1, 1, 1);
    spi_dat5 = uvm_reg_field::type_id::create("spi_dat5");
    spi_dat5.configure(this, 11, 21, "RO", 0, `UVM_REG_DATA_WIDTH'd6295311>>21, 1, 1, 1);
    wr_cg.set_inst_name($sformatf("%s.wcov", get_full_name()));
    rd_cg.set_inst_name($sformatf("%s.rcov", get_full_name()));
  endfunction

  covergroup wr_cg;
    option.per_instance=1;
    spi_dat0 : coverpoint spi_dat0.value[0:0];
    spi_dat1 : coverpoint spi_dat1.value[0:0];
    spi_dat2 : coverpoint spi_dat2.value[5:0];
    spi_dat3 : coverpoint spi_dat3.value[1:0];
    spi_dat4 : coverpoint spi_dat4.value[10:0];
    spi_dat5 : coverpoint spi_dat5.value[10:0];
  endgroup
  covergroup rd_cg;
    option.per_instance=1;
    spi_dat0 : coverpoint spi_dat0.value[0:0];
    spi_dat1 : coverpoint spi_dat1.value[0:0];
    spi_dat2 : coverpoint spi_dat2.value[5:0];
    spi_dat3 : coverpoint spi_dat3.value[1:0];
    spi_dat4 : coverpoint spi_dat4.value[10:0];
    spi_dat5 : coverpoint spi_dat5.value[10:0];
  endgroup

  protected virtual function void sample(uvm_reg_data_t  data, byte_en, bit is_read, uvm_reg_map map);
    super.sample(data, byte_en, is_read, map);
    if(!is_read) wr_cg.sample();
    if(is_read) rd_cg.sample();
  endfunction

  `uvm_register_cb(spi_dat_type, uvm_reg_cbs) 
  `uvm_set_super_type(spi_dat_type, uvm_reg)
  `uvm_object_utils(spi_dat_type)
  function new(input string name="unnamed-spi_dat_type");
    super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
    wr_cg=new;
    rd_cg=new;
  endfunction : new
endclass : spi_dat_type

//////////////////////////////////////////////////////////////////////////////
// Register definition
//////////////////////////////////////////////////////////////////////////////

class spi_clk_type extends uvm_reg;

  rand uvm_reg_field spi_clk0;
  rand uvm_reg_field spi_clk1;
  rand uvm_reg_field spi_clk2;

  virtual function void build();
    spi_clk0 = uvm_reg_field::type_id::create("spi_clk0");
    spi_clk0.configure(this, 1, 0, "RW", 0, `UVM_REG_DATA_WIDTH'd6442450947>>0, 1, 1, 1);
    spi_clk1 = uvm_reg_field::type_id::create("spi_clk1");
    spi_clk1.configure(this, 30, 1, "RO", 0, `UVM_REG_DATA_WIDTH'd6442450947>>1, 1, 1, 1);
    spi_clk2 = uvm_reg_field::type_id::create("spi_clk2");
    spi_clk2.configure(this, 1, 31, "RO", 0, `UVM_REG_DATA_WIDTH'd6442450947>>31, 1, 1, 1);
    wr_cg.set_inst_name($sformatf("%s.wcov", get_full_name()));
    rd_cg.set_inst_name($sformatf("%s.rcov", get_full_name()));
  endfunction

  covergroup wr_cg;
    option.per_instance=1;
    spi_clk0 : coverpoint spi_clk0.value[0:0];
    spi_clk1 : coverpoint spi_clk1.value[29:0];
    spi_clk2 : coverpoint spi_clk2.value[0:0];
  endgroup
  covergroup rd_cg;
    option.per_instance=1;
    spi_clk0 : coverpoint spi_clk0.value[0:0];
    spi_clk1 : coverpoint spi_clk1.value[29:0];
    spi_clk2 : coverpoint spi_clk2.value[0:0];
  endgroup

  protected virtual function void sample(uvm_reg_data_t  data, byte_en, bit is_read, uvm_reg_map map);
    super.sample(data, byte_en, is_read, map);
    if(!is_read) wr_cg.sample();
    if(is_read) rd_cg.sample();
  endfunction

  `uvm_register_cb(spi_clk_type, uvm_reg_cbs) 
  `uvm_set_super_type(spi_clk_type, uvm_reg)
  `uvm_object_utils(spi_clk_type)
  function new(input string name="unnamed-spi_clk_type");
    super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
    wr_cg=new;
    rd_cg=new;
  endfunction : new
endclass : spi_clk_type

class SPI_TOP_type extends uvm_reg_block;

  rand spi_ctrl_type spi_ctrl;
  rand spi_dat_type spi_dat;
  rand spi_clk_type spi_clk;

  virtual function void build();

    // Now create all registers

    spi_ctrl = spi_ctrl_type::type_id::create("spi_ctrl", , get_full_name());
    spi_dat = spi_dat_type::type_id::create("spi_dat", , get_full_name());
    spi_clk = spi_clk_type::type_id::create("spi_clk", , get_full_name());

    // Now build the registers. Set parent and hdl_paths

    spi_ctrl.configure(this, null, "");
    spi_ctrl.build();
    spi_dat.configure(this, null, "");
    spi_dat.build();
    spi_clk.configure(this, null, "");
    spi_clk.build();
    // Now define address mappings
    default_map = create_map("default_map", 0, 4, UVM_LITTLE_ENDIAN);
    default_map.add_reg(spi_ctrl, `UVM_REG_ADDR_WIDTH'h4, "RW");
    default_map.add_reg(spi_dat, `UVM_REG_ADDR_WIDTH'h8, "RW");
    default_map.add_reg(spi_clk, `UVM_REG_ADDR_WIDTH'ha, "RW");
  endfunction

  `uvm_object_utils(SPI_TOP_type)
  function new(input string name="unnamed-SPI_TOP");
    super.new(name, UVM_NO_COVERAGE);
  endfunction : new

endclass : SPI_TOP_type

//////////////////////////////////////////////////////////////////////////////
// Register definition
//////////////////////////////////////////////////////////////////////////////

class uart_dat_type extends uvm_reg;

  rand uvm_reg_field uart_dat0;
  rand uvm_reg_field uart_dat1;
  rand uvm_reg_field uart_dat2;
  rand uvm_reg_field uart_dat3;
  rand uvm_reg_field uart_dat4;
  rand uvm_reg_field uart_dat5;

  virtual function void build();
    uart_dat0 = uvm_reg_field::type_id::create("uart_dat0");
    uart_dat0.configure(this, 1, 0, "RW", 0, `UVM_REG_DATA_WIDTH'd6295311>>0, 1, 1, 1);
    uart_dat1 = uvm_reg_field::type_id::create("uart_dat1");
    uart_dat1.configure(this, 1, 1, "RO", 0, `UVM_REG_DATA_WIDTH'd6295311>>1, 1, 1, 1);
    uart_dat2 = uvm_reg_field::type_id::create("uart_dat2");
    uart_dat2.configure(this, 6, 2, "RO", 0, `UVM_REG_DATA_WIDTH'd6295311>>2, 1, 1, 1);
    uart_dat3 = uvm_reg_field::type_id::create("uart_dat3");
    uart_dat3.configure(this, 2, 8, "RO", 0, `UVM_REG_DATA_WIDTH'd6295311>>8, 1, 1, 1);
    uart_dat4 = uvm_reg_field::type_id::create("uart_dat4");
    uart_dat4.configure(this, 11, 10, "RW", 0, `UVM_REG_DATA_WIDTH'd6295311>>10, 1, 1, 1);
    uart_dat5 = uvm_reg_field::type_id::create("uart_dat5");
    uart_dat5.configure(this, 11, 21, "RO", 0, `UVM_REG_DATA_WIDTH'd6295311>>21, 1, 1, 1);
    wr_cg.set_inst_name($sformatf("%s.wcov", get_full_name()));
    rd_cg.set_inst_name($sformatf("%s.rcov", get_full_name()));
  endfunction

  covergroup wr_cg;
    option.per_instance=1;
    uart_dat0 : coverpoint uart_dat0.value[0:0];
    uart_dat1 : coverpoint uart_dat1.value[0:0];
    uart_dat2 : coverpoint uart_dat2.value[5:0];
    uart_dat3 : coverpoint uart_dat3.value[1:0];
    uart_dat4 : coverpoint uart_dat4.value[10:0];
    uart_dat5 : coverpoint uart_dat5.value[10:0];
  endgroup
  covergroup rd_cg;
    option.per_instance=1;
    uart_dat0 : coverpoint uart_dat0.value[0:0];
    uart_dat1 : coverpoint uart_dat1.value[0:0];
    uart_dat2 : coverpoint uart_dat2.value[5:0];
    uart_dat3 : coverpoint uart_dat3.value[1:0];
    uart_dat4 : coverpoint uart_dat4.value[10:0];
    uart_dat5 : coverpoint uart_dat5.value[10:0];
  endgroup

  protected virtual function void sample(uvm_reg_data_t  data, byte_en, bit is_read, uvm_reg_map map);
    super.sample(data, byte_en, is_read, map);
    if(!is_read) wr_cg.sample();
    if(is_read) rd_cg.sample();
  endfunction

  `uvm_register_cb(uart_dat_type, uvm_reg_cbs) 
  `uvm_set_super_type(uart_dat_type, uvm_reg)
  `uvm_object_utils(uart_dat_type)
  function new(input string name="unnamed-uart_dat_type");
    super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
    wr_cg=new;
    rd_cg=new;
  endfunction : new
endclass : uart_dat_type

//////////////////////////////////////////////////////////////////////////////
// Register definition
//////////////////////////////////////////////////////////////////////////////

class uart_ctrl_type extends uvm_reg;

  rand uvm_reg_field uart_ctrl0;
  rand uvm_reg_field uart_ctrl1;
  rand uvm_reg_field uart_ctrl2;
  rand uvm_reg_field uart_ctrl3;
  rand uvm_reg_field uart_ctrl4;
  rand uvm_reg_field uart_ctrl5;
  rand uvm_reg_field uart_ctrl6;
  rand uvm_reg_field uart_ctrl7;
  rand uvm_reg_field uart_ctrl8;

  virtual function void build();
    uart_ctrl0 = uvm_reg_field::type_id::create("uart_ctrl0");
    uart_ctrl0.configure(this, 2, 0, "RW", 0, `UVM_REG_DATA_WIDTH'd3208179>>0, 1, 1, 1);
    uart_ctrl1 = uvm_reg_field::type_id::create("uart_ctrl1");
    uart_ctrl1.configure(this, 2, 2, "RO", 0, `UVM_REG_DATA_WIDTH'd3208179>>2, 1, 1, 1);
    uart_ctrl2 = uvm_reg_field::type_id::create("uart_ctrl2");
    uart_ctrl2.configure(this, 2, 4, "RO", 0, `UVM_REG_DATA_WIDTH'd3208179>>4, 1, 1, 1);
    uart_ctrl3 = uvm_reg_field::type_id::create("uart_ctrl3");
    uart_ctrl3.configure(this, 2, 6, "RO", 0, `UVM_REG_DATA_WIDTH'd3208179>>6, 1, 1, 1);
    uart_ctrl4 = uvm_reg_field::type_id::create("uart_ctrl4");
    uart_ctrl4.configure(this, 2, 8, "RW", 0, `UVM_REG_DATA_WIDTH'd3208179>>8, 1, 1, 1);
    uart_ctrl5 = uvm_reg_field::type_id::create("uart_ctrl5");
    uart_ctrl5.configure(this, 2, 10, "RO", 0, `UVM_REG_DATA_WIDTH'd3208179>>10, 1, 1, 1);
    uart_ctrl6 = uvm_reg_field::type_id::create("uart_ctrl6");
    uart_ctrl6.configure(this, 2, 12, "RO", 0, `UVM_REG_DATA_WIDTH'd3208179>>12, 1, 1, 1);
    uart_ctrl7 = uvm_reg_field::type_id::create("uart_ctrl7");
    uart_ctrl7.configure(this, 6, 14, "RO", 0, `UVM_REG_DATA_WIDTH'd3208179>>14, 1, 1, 1);
    uart_ctrl8 = uvm_reg_field::type_id::create("uart_ctrl8");
    uart_ctrl8.configure(this, 12, 20, "RO", 0, `UVM_REG_DATA_WIDTH'd3208179>>20, 1, 1, 1);
    wr_cg.set_inst_name($sformatf("%s.wcov", get_full_name()));
    rd_cg.set_inst_name($sformatf("%s.rcov", get_full_name()));
  endfunction

  covergroup wr_cg;
    option.per_instance=1;
    uart_ctrl0 : coverpoint uart_ctrl0.value[1:0];
    uart_ctrl1 : coverpoint uart_ctrl1.value[1:0];
    uart_ctrl2 : coverpoint uart_ctrl2.value[1:0];
    uart_ctrl3 : coverpoint uart_ctrl3.value[1:0];
    uart_ctrl4 : coverpoint uart_ctrl4.value[1:0];
    uart_ctrl5 : coverpoint uart_ctrl5.value[1:0];
    uart_ctrl6 : coverpoint uart_ctrl6.value[1:0];
    uart_ctrl7 : coverpoint uart_ctrl7.value[5:0];
    uart_ctrl8 : coverpoint uart_ctrl8.value[11:0];
  endgroup
  covergroup rd_cg;
    option.per_instance=1;
    uart_ctrl0 : coverpoint uart_ctrl0.value[1:0];
    uart_ctrl1 : coverpoint uart_ctrl1.value[1:0];
    uart_ctrl2 : coverpoint uart_ctrl2.value[1:0];
    uart_ctrl3 : coverpoint uart_ctrl3.value[1:0];
    uart_ctrl4 : coverpoint uart_ctrl4.value[1:0];
    uart_ctrl5 : coverpoint uart_ctrl5.value[1:0];
    uart_ctrl6 : coverpoint uart_ctrl6.value[1:0];
    uart_ctrl7 : coverpoint uart_ctrl7.value[5:0];
    uart_ctrl8 : coverpoint uart_ctrl8.value[11:0];
  endgroup

  protected virtual function void sample(uvm_reg_data_t  data, byte_en, bit is_read, uvm_reg_map map);
    super.sample(data, byte_en, is_read, map);
    if(!is_read) wr_cg.sample();
    if(is_read) rd_cg.sample();
  endfunction

  `uvm_register_cb(uart_ctrl_type, uvm_reg_cbs) 
  `uvm_set_super_type(uart_ctrl_type, uvm_reg)
  `uvm_object_utils(uart_ctrl_type)
  function new(input string name="unnamed-uart_ctrl_type");
    super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
    wr_cg=new;
    rd_cg=new;
  endfunction : new
endclass : uart_ctrl_type

class UART_TOP_type extends uvm_reg_block;

  rand uart_dat_type uart_dat;
  rand uart_ctrl_type uart_ctrl;

  virtual function void build();

    // Now create all registers

    uart_dat = uart_dat_type::type_id::create("uart_dat", , get_full_name());
    uart_ctrl = uart_ctrl_type::type_id::create("uart_ctrl", , get_full_name());

    // Now build the registers. Set parent and hdl_paths

    uart_dat.configure(this, null, "");
    uart_dat.build();
    uart_ctrl.configure(this, null, "");
    uart_ctrl.build();
    // Now define address mappings
    default_map = create_map("default_map", 0, 4, UVM_LITTLE_ENDIAN);
    default_map.add_reg(uart_dat, `UVM_REG_ADDR_WIDTH'h8, "RW");
    default_map.add_reg(uart_ctrl, `UVM_REG_ADDR_WIDTH'h2680, "RW");
  endfunction

  `uvm_object_utils(UART_TOP_type)
  function new(input string name="unnamed-UART_TOP");
    super.new(name, UVM_NO_COVERAGE);
  endfunction : new

endclass : UART_TOP_type

//////////////////////////////////////////////////////////////////////////////
// Address_map definition
//////////////////////////////////////////////////////////////////////////////
class top_reg_type extends uvm_reg_block;

  rand SPI_TOP_type SPI_TOP;
  rand UART_TOP_type UART_TOP;

  virtual function void build();
    // Now define address mappings
    default_map = create_map("default_map", 0, 4, UVM_LITTLE_ENDIAN);
    SPI_TOP = SPI_TOP_type::type_id::create("SPI_TOP", , get_full_name());
    SPI_TOP.configure(this, "");
    SPI_TOP.build();
    SPI_TOP.lock_model();
    default_map.add_submap(SPI_TOP.default_map, `UVM_REG_ADDR_WIDTH'hfa12345678);
    UART_TOP = UART_TOP_type::type_id::create("UART_TOP", , get_full_name());
    UART_TOP.configure(this, "");
    UART_TOP.build();
    UART_TOP.lock_model();
    default_map.add_submap(UART_TOP.default_map, `UVM_REG_ADDR_WIDTH'heeeeaaaa);
    this.lock_model();
  endfunction
  `uvm_object_utils(top_reg_type)
  function new(input string name="unnamed-top_reg_type");
    super.new(name, UVM_NO_COVERAGE);
  endfunction
endclass : top_reg_type

`endif // RDB_SV
