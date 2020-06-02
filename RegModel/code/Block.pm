#====================================================
#   Autor: qingfeng sun
#   Mail: qf.sun@foxmail.com
#====================================================
package Block;
sub new {
    my $class = shift;
    my ($block_name, $baseaddr) = @_;
    my $self = {
        block_name => $block_name,
        baseaddr => $baseaddr,
        range   => 0,
        registers => [],
    };
    bless $self, $class;
    return $self;
}

sub add_reg {
  my $self = shift;
  my $reg = @_;
  push @{$self->{registers}}, @_;
}


sub deref {
    my $self = shift;
    my %uhash = %$self;
    return \%uhash;
}


sub set_range {
  my $self = shift;
  my $tmp = scalar  @{$self->{registers}};
  $self->{range} = $tmp + 1;
}
return 1;
