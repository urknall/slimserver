package Slim::Plugin::PreventStandby::Win32;

# Copyright 2001-2011 Logitech.
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License,
# version 2.

use strict;
use Win32::API;

my $SetThreadExecutionState;

sub new {
	my $class = shift;

	$SetThreadExecutionState => Win32::API->new('kernel32', 'SetThreadExecutionState', 'N', 'N')
	
	return $class;
}

sub setBusy {
	if ($SetThreadExecutionState) {
		$SetThreadExecutionState->Call(1);
	}
}

sub canSetBusy {
	return $SetThreadExecutionState ? 1 : 0;
}

# some stubs we need for compatibility with the OSX implementation
sub cleanup {};
sub setIdle {};

1;

__END__
