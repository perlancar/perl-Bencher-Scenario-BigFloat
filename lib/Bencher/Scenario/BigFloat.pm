package Bencher::Scenario::BigFloat;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    summary => 'Benchmark arbitrary size floating point arithmetics',
    participants => [
        {
            name => '1k-Math::BigFloat',
            module=>'Math::BigFloat',
            code_template => 'my $val; for (1..1000) { $val = Math::BigFloat->new(q(<num1>))+Math::BigFloat->new(q(<num2>)) + Math::BigFloat->new(q(<num1>)) * Math::BigFloat->new(q(<num2>)) } "$val"'
        },
        {
            name => '1k-native',
            tags => ['no-big'],
            code_template => 'my $val; for (1..1000) { $val = <num1>+<num2> + <num1> * <num2> } $val'
        },
    ],
    datasets => [
        {name=>'0dec_digits', args=>{num1=>"10", num2=>"20"}, result=>"230" },
        {name=>'100dec_digits', args=>{num1=>"1.".("12"x50),num2=>"2"}, result=>"5.".("36"x50), exclude_participant_tags=>['no-big'] },
    ],
};

1;
# ABSTRACT:
