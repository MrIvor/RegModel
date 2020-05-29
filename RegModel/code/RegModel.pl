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
my (@registers, $register, $i);
my ($pre_max_range, $pre_min_range);
$i=0;
my $bitn=0;
my $pre_block_name;
my $pre_reg_name;
my $first_reg = 0;
foreach my $row (@rows) {
  if($row->[0]){  
    $block_name = validate_blkname($row->[0]); 
    $baseaddr = validate_baseaddr($row->[1]);  
    $bitn = 0;
  }
  elsif($row->[2]) {  
        if($first_reg == 1 && $pre_max_range != 31) {
          die "pls check $pre_block_name -> $pre_reg_name -> bit range is not 0 to 31 !!! \n"
        }
        if($register) {
            push @registers, $register->deref();
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
    } else {
        validate_field($row);
        my ($bit_offset, $width, $max_range, $min_range) = Register::parse_range($row->[4], $pre_block_name, $pre_reg_name);  #bit range
        $register->add_field(
            $row->[3], 
            $bit_offset,
            $width,
            $row->[5], 
            $row->[6]  
        );
        print("bitn : $bitn \n");
        if($bitn > 0) {
          if($min_range != $pre_max_range + 1) {
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

push @registers, $register->deref();

my $tt = Template->new(ABSOLUTE => 1,RELATIVE => 1);
my $templateData = {
    block_name => $block_name,
    baseaddr => $baseaddr,
    range => scalar @registers,
    registers => \@registers
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
