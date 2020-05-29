package Register;
use List::Util qw(min);
use List::Util qw(max);

sub new {
    my $class = shift;
    my ($block_name, $reg_name,  $addr_offset) = @_;
    my $self = {
        block_name => $block_name,
        reg_name => $reg_name,
        addr_offset => $addr_offset,
        size => 0,
        reset => 0,
        fields => [],
    };
    bless $self, $class;
    return $self;
}

sub add_field {
    my $self = shift;  
    my ($field_name, $bit_offset, $width, $reset, $access) = @_;
    my $field = {
        field_name => $field_name,
        bit_offset => $bit_offset,
        width => $width,,
        access => access_type($access)
    };
    $self->update_reset($self->normalize_reset($reset), $bit_offset);
    $self->update_size($width);
    push @{$self->{fields}}, $field;
}

sub update_reset {
    my $self = shift;
    my ($reset, $bit_offset) = @_;
    if(defined $reset && $reset ne "") {
        $self->{reset} += ($reset * (2 ** $bit_offset));
    }
}

sub update_size {
    my $self = shift;
    $self->{size} = 32;
}

sub deref {
    my $self = shift;
    my %uhash = %$self;
    return \%uhash;
}

sub access_type {
    my $type = shift;
    if (defined $type) {
        $type = uc($type);
        if ($type eq "RW") {return "read-write";}
        elsif ($type eq "R") {return "read-only";}
        elsif ($type eq "W") {return "write-only";}
        elsif ($type eq "RWO") {return "read-writeOnce";}
        elsif ($type eq "WO") {return "writeOnce";}
    }
    return undef;
}

sub normalize_reset {
    my $self = shift;
    my ($value) = @_;
    if(defined $value) {
      if($value =~ /^0x[\da-f]+$/i) {
        return hex($value);
      } else {
        die "pls check $self->{block_name} -> $self->{reg_name} -> reset value ($value) !!! \n"
      }
    }
    return $value;
}

sub parse_range {
    my (@ranges, $size, $bit_offset, $width, $max_range, $min_range);
    @ranges = shift =~ /(\d+)/g;
    my ($block_name, $reg_name) = @_;
    $size = scalar(@ranges);
    if ($size == 2) {
        $bit_offset = min(@ranges);
        $width = $ranges[1] - $ranges[0] + 1;
    } elsif ($size == 1) {
        $bit_offset = min(@ranges);
        $width = 1;
    } else {
      die "pls check $block_name -> $reg_name -> bit ranges !!! \n";
    }
    if($ranges[0] > $ranges[1]) {
      die "pls check $block_name -> $reg_name -> BigEndian, shoud be LittleEndian !!! \n";
    }
    $min_range = min(@ranges);
    $max_range = max(@ranges);
    return ($bit_offset, $width, $max_range, $min_range);
}
return 1;
