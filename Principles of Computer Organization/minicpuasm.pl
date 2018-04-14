#!/usr/bin/perl

my $pc, %lab, %inst, %op, %type, %funct, %reg;

%op = (
	'add', 0x0, 'sub', 0x0, 'addi', 0x8, 'lw', 0x23, 'sw', 0x2b, 'lb', 0x20,
	'sb', 0x28, 'lui', 0xf, 'beq', 0x4, 'bne', 0x5, 'slt', 0x0, 'slti', 0xa,
	'j', 0x2, 'jr', 0x0, 'jal', 0x3, 'mult', 0x0, 'div', 0x0, 'mfhi', 0x0,
	'mflo', 0x0, 'mthi', 0x0, 'mtlo', 0x0,'and',0x0,'or',0x0,'andi',0xc,
	'ori',0xd,'sll',0x0,'srl',0x0,'lbu',0x24,'sltu',0x0,'sltiu',0xb,
);

%type = (
	'add', 'r3', 'sub', 'r3', 'addi', 'in', 'lw', 'ib', 'sw', 'ib', 'lb', 'ib',
	'sb', 'ib', 'lui', 'ii', 'beq', 'il', 'bne', 'il', 'slt', 'r3', 'slti',
	'in', 'j', 'j', 'jr', 'ra', 'jal', 'j', 'mult', 'r2', 'div', 'r2', 'mfhi',
	'rb', 'mflo', 'rb', 'mthi', 'ra', 'mtlo', 'ra',
	'and','r3','or','r3','andi','in','ori','in','sll','sh','srl','sh',
    'lbu','ib','sltu','r3','sltiu','in',
);

%funct = (
	'add', 0x20, 'sub', 0x22, 'slt', 0x2a, 'jr', 0x8, 'mult', 0x18, 'div',
	0x1a, 'mfhi', 0x10, 'mflo', 0x12, 'mthi', 0x11, 'mtlo', 0x13,
	'and',0x24,'or',0x25,'sll',0x0,'srl',0x2,'sltu',0x2b,
);

%reg = (
	"\$zero", 0, "\$at", 1, "\$v0", 2, "\$v1", 3, "\$a0", 4, "\$a1", 5, "\$a2",
	6, "\$a3", 7, "\$t0", 8, "\$t1", 9, "\$t2", 10, "\$t3", 11, "\$t4", 12,
	"\$t5", 13, "\$t6", 14, "\$t7", 15, "\$s0", 16, "\$s1", 17, "\$s2", 18,
	"\$s3", 19, "\$s4", 20, "\$s5", 21, "\$s6", 22, "\$s7", 23, "\$t8", 24,
	"\$t9", 25, "\$k0", 26, "\$k1", 27, "\$gp", 28, "\$sp", 29, "\$fp", 30,
	"\$ra", 31, "\$0", 0, "\$1", 1, "\$2", 2, "\$3", 3, "\$4", 4, "\$5", 5,
	"\$6", 6, "\$7", 7, "\$8", 8, "\$9", 9, "\$10", 10, "\$11", 11, "\$12", 12,
	"\$13", 13, "\$14", 14, "\$15", 15, "\$16", 16, "\$17", 17, "\$18", 18,
	"\$19", 19, "\$20", 20, "\$21", 21, "\$22", 22, "\$23", 23, "\$24", 24,
	"\$25", 25, "\$26", 26, "\$27", 27, "\$28", 28, "\$29", 29, "\$30", 30,
	"\$31", 31,
);

my $line = 0;

sub len
{
	my $inst = shift;
	return 0 if ($inst =~ /^\s*$/);
	if ($inst =~ /^\s*[^\.]/)
	{
		($instop, @instarg) = split(' ', $inst);
		die "illegal instruction at $line" if (!defined($type{$instop}));
		return 1;
	}
	@count = split(' ', $inst);
	return (scalar(@count) - 1) if ($count[0] eq ".word");
	return sprintf("%d", ((scalar(@count) + 2) / 4)) if ($count[0] eq ".byte");
	die "illegal directive at $line";
}

$i = 0x4000;
$j = 0;

while (<>)
{
	$line = $line + 1;
	s/#.*//;
	next if /^\s*$/;
	chomp($_);
	$j = sprintf("%08x", $i);
	$inst{$j} = $_ if (!(/:/));
	($lab{$1}, $inst{$j}) = ($j, $2) if (/^\s*([^\s]+)\s*:\s*(.*)$/);
	$i = $i + 4 * len($inst{$j});
}

sub enc
{
	my $inst = shift;
	my $addr = shift;
	my $encode = "";
	if ($inst =~ /^\s*[^\.]/)
	{
		if ($inst =~ /^\s*([^\s]+)\s+([^\s,]+)[\s,]+([^\s,]+)\s*\(\s*([^\s]+)\s*\)\s*$/)
		{
			if ($type{$1} eq 'ib')
			{
				if (defined $lab{$3})
				{
					$base = substr(sprintf("%08x", hex($lab{$3})), -4);
				}
				else
				{
					$base = substr(sprintf("%08x", $3), -4);
				}
				$encode = sprintf("%08x", ($op{$1} << 26) + ($reg{$2} << 16) + ($reg{$4} << 21) + hex($base));
			}
			else
			{
				die "illegal instruction $inst";
			}
		}
		elsif ($inst =~ /^\s*([^\s]+)\s+([^\s,]+)[\s,]+([^\s,]+)[\s,]+([^\s]+)\s*$/)
		{
			if ($type{$1} eq 'r3')
			{
				$encode = sprintf("%08x", ($op{$1} << 26) + $funct{$1} + ($reg{$2} << 11) + ($reg{$3} << 21) + ($reg{$4} << 16));
			}
			elsif ($type{$1} eq 'sh')
			{
				if ($4 > 31)
				{
					die "illegal instruction $inst";
				}
				$encode = sprintf("%08x", ($op{$1} << 26) + $funct{$1} + ($reg{$2} << 11) + ($reg{$3} << 16) + ($4 << 6));
			}
			elsif ($type{$1} eq 'in')
			{
				if (defined $lab{$4})
				{
					$base = substr(sprintf("%08x", hex($lab{$4})), -4);
				}
				else
				{
					$base = substr(sprintf("%08x", $4), -4);
				}
				$encode = sprintf("%08x", ($op{$1} << 26) + ($reg{$2} << 16) + ($reg{$3} << 21) + hex($base));
			}
			elsif ($type{$1} eq 'il')
			{
				if (defined $lab{$4})
				{
					$base = substr(sprintf("%08x", (hex($lab{$4}) - hex($addr) - 4) / 4), -4);
				}
				else
				{
					$base = substr(sprintf("%08x", $4), -4);
				}
				$encode = sprintf("%08x", ($op{$1} << 26) + ($reg{$2} << 21) + ($reg{$3} << 16) + hex($base));
			}
			else
			{
				die "illegal instruction $inst";
			}
		}
		elsif ($inst =~ /^\s*([^\s]+)\s+([^\s,]+)[\s,]+([^\s,]+)\s*$/)
		{
			if ($type{$1} eq 'r2')
			{
				$encode = sprintf("%08x", ($op{$1} << 26) + $funct{$1} + ($reg{$2} << 21) + ($reg{$3} << 16));
			}
			elsif ($type{$1} eq 'ii')
			{
				if (defined $lab{$3})
				{
					$base = substr(sprintf("%08x", hex($lab{$3})), -4);
				}
				else
				{
					$base = substr(sprintf("%08x", $3), -4);
				}
				$encode = sprintf("%08x", ($op{$1} << 26) + ($reg{$2} << 16) + hex($base));
			}
			else
			{
				die "illegal instruction $inst";
			}
		}
		elsif ($inst =~ /^\s*([^\s]+)\s+([^\s]+)\s*$/)
		{
			if ($type{$1} eq 'ra')
			{
				$encode = sprintf("%08x", ($op{$1} << 26) + $funct{$1} + ($reg{$2} << 21));
			}
			elsif ($type{$1} eq 'rb')
			{
				$encode = sprintf("%08x", ($op{$1} << 26) + $funct{$1} + ($reg{$2} << 11));
			}
			elsif ($type{$1} eq 'j')
			{
				if (defined $lab{$2})
				{
					$base = sprintf("%08x", hex($lab{$2}) / 4);
				}
				else
				{
					$base = sprintf("%08x", $2 / 4);
				}
				$encode = sprintf("%08x", ($op{$1} << 26) + (hex($base) & 0x03ffffff));
			}
			else
			{
				die "illegal instruction $inst";
			}
		}
		else
		{
			die "illegal instruction $inst";
		}
		@instsplit = split(' ', $inst);
		@instsplit2 = ();
		foreach (@instsplit)
		{
			@instsplit2 = (@instsplit2, split(',', $_));
		}
		$encode .= "\t# $addr @instsplit2\n";
	}
	else
	{
		($dir, @count) = split(' ', $inst);
		if ($dir eq ".word")
		{
			foreach (@count)
			{
				$encode .= sprintf("%08x", $_);
				$encode .= "\t# $addr $dir @count\n";
				$addr = sprintf("%08x", hex($addr) + 4);
			}
		}
		else
		{
			my $word;
			my $i = 0;
			foreach (@count)
			{
				$word = "00000000" if ($i % 4 == 0);
				substr($word, (3 - ($i % 4)) * 2, 2) = substr(sprintf("%02x", $_), -2);
				$i = $i + 1;
				$encode .= "$word\t# $addr $dir @count\n" if ($i % 4 == 0);
				$addr = sprintf("%08x", hex($addr) + 4) if ($i % 4 == 0);
			}
			$encode .= "$word\t# $addr $inst\n" if ($i % 4 != 0);
		}
	}
	return $encode;
}

foreach (sort keys %inst)
{
	print enc($inst{$_}, $_);
}
