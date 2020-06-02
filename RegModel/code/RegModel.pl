#====================================================
#   Autor: qingfeng sun
#   Mail: qf.sun@foxmail.com
#====================================================
use strict;
use warnings;
use diagnostics;
use Template;
use Data::Dumper;
use File::Basename;
use FindBin qw($Bin);
use Getopt::Long;
use Spreadsheet::Read;
use lib "$Bin";
use Register;
use Block;
my %args;
GetOptions(\%args,
           "input=s",
           "output=s"
) or die "Usage ./script.pl --input input.xls(x)";
die "Missing --input!" unless $args{input};

my $input = $args{input};
if ( !-e $input) {
    die "File not exist!";
}
my @error;
my $inFileName = basename($input);
(my $FileName = $inFileName) =~ s/\.[^.]+$//;
unless (validate($FileName, 'reg_name')) {
    $FileName = "register_File";
    push @error, "register file reg_name error";
}

my $book  = ReadData($input);
my @rows = Spreadsheet::Read::rows ($book->[1]);
splice @rows, 0, 1;
my $baseaddr;
my $block_name;
my (@registers, $register, $i, @blocks, $block);
my ($pre_max_range, $pre_min_range);
my $bitn=0;
my $pre_block_name;
my $pre_reg_name;
my $first_reg = 0;
my @rows_tmp;
my @name_pos;
my $name_num;
$i=0;
$name_num = 0;
foreach my $row (@rows) {
  if($row->[0]){
    $name_num++;
    push @name_pos, $i;
  }
  $i++;
}
push @name_pos, $i;
for( my $a = 0; $a < $name_num; $a = $a + 1 ){
  @rows_tmp = @rows[$name_pos[$a]..$name_pos[$a+1]-1];
  $i=0;
  undef $register;
  undef $block;
  foreach my $row (@rows_tmp) {
    if(!$row->[0] && !$row->[1] && !$row->[2] && !$row->[3]){ next;}
    if($row->[0]){
      $block_name = validate_blkname($row->[0]);
      $baseaddr = validate_baseaddr($row->[1]);
      $block = new Block($block_name, $baseaddr);
    }
    elsif($row->[2]) {
          if($first_reg == 1 && $pre_max_range != 31) {
            die "pls check $pre_block_name -> $pre_reg_name -> bit range is not 0 to 31 !!! \n"
          }
          if($register) {
            $block->add_reg($register->deref());
          }
          validate_register($row);
          $register = new Register(
              $block_name,
              $row->[2],
              $row->[3]
          );
          $pre_block_name = $block_name;
          $pre_reg_name = $row->[2];
          $first_reg = 1;
          $bitn = 0;
      } else {
          validate_field($row);
          my ($bit_offset, $width, $max_range, $min_range) = Register::parse_range($row->[4], $pre_block_name, $pre_reg_name);
          $register->add_field(
              $row->[3],
              $bit_offset,
              $width,
              $row->[5],
              $row->[6]
          );
          if($bitn > 0) {
            if($min_range != $pre_max_range + 1) {
              print "min_range : $min_range;  $pre_max_range ;  $bitn\n";
              die "pls check $block_name -> $pre_reg_name -> field $bitn\n";
            }
          }
          $pre_max_range = $max_range;
          $pre_min_range = $min_range;
          $bitn++;
      }
      $i++
  }
  if($pre_max_range != 31) {
    die "pls check $pre_block_name -> $pre_reg_name -> bit range is not 0 to 31 !!! \n"
  }
  $block->set_range();
  $block->add_reg($register->deref());
  push @blocks, $block->deref();
}

my $tt = Template->new(ABSOLUTE => 1,RELATIVE => 1);
my $templateData = {
  blocks => \@blocks
};


my $size = scalar(@error);
if ($size > 0) {
    print "<errors>\n";
    foreach my $err (@error) {
        print "\t<error>$err</error>\n";
    }
    print "</errors>";
} else {
    if ($args{output}) {
        $tt->process("$Bin/ipxact_template.tt", $templateData, $args{output}) || die $tt->error;
        print "saved to $args{output}\n";
    } else {
        my $xml = $tt->process("$Bin/ipxact_template.tt", $templateData) || die $tt->error;
    }
}


sub validate_register {
    my ($row) = @_;
    unless (validate($row->[2], 'reg_name')) {
        push @error, "register $block_name -> reg_name  ($row->[2]) is not valid at $i";
    }
    unless (validate($row->[3], 'number')) {
        push @error, "register $block_name -> $row->[2] -> offset addr ($row->[3]) is not valid at $i";
    }
}

sub validate_field {
    my ($row) = @_;
    unless (validate($row->[3], 'reg_name')) {
        push @error, "$block_name ->  $pre_reg_name -> field name ($row->[3]) is not valid at $i";
    }
    if ($row->[5]) {
        unless (validate($row->[5], 'number')) {
            push @error, "$block_name -> $pre_reg_name -> $row->[3] -> field reset ($row->[5]) is not valid at $i";
        }
    }
}

sub validate {
    my ($value, $type) = @_;
    if (defined $type) {
        $type = lc($type);
        if ($type eq "reg_name") {
            return $value =~ /^[a-zA-Z_:]([a-zA-Z0-9_:.])*$/;
        } elsif ($type eq "number") {
            return $value =~ /^0x[\da-f]+$/i;
        }
    }
}


sub validate_blkname{
  my $tmp = shift;
  if($tmp =~ /^[A-Z]+_[A-Z]+$/g ) {
    print("Block name is : $tmp  \n");
  } else {
    die "pls check $tmp block name is invalid !!! \n";
  }
  return $tmp;
}
sub validate_baseaddr{
  my $tmp = shift;
  if($tmp =~ /^0x[\da-f]+$/i ) {
    print("baseaddr is : $tmp  \n");
  } else {
    die "pls check $block_name -> baseaddr is invalid!!! \n";
  }
  return $tmp;
}
