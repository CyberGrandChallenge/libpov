% CGC Proof of Vulnerability Support Library
# NAME
*libpov* - CGC POV API

# LIBRARY
library "libpov"

# SYNOPSIS
\#include \<libpov.h\>

Library routines required to support the C translations of CGC CFE XML proof
of vulnerability specifications into equivalent CGC binaries.

# DESCRIPTION

For the DARPA Cyber Grand Challenge final event (CFE), competitors will be
required to submit proofs of vulnerabilities (PoVs) in the form of valid CGC
binaries for the DECREE platform. In an effort to ease the transition from
qualification event (CQE) style XML PoVs to CFE PoVs, the pov-xml2c utility
processes CFE XML PoV specifications and emits C source codes suitable for
linking with libpov and libcgc to create a DECREE binary that is behaviorally
equivalent to the input XML PoV. 

# RETURN VALUE

libpov is not intended to be used directly.

# ERRORS

libpov is not intended to be used directly.

# SEE ALSO

pov-xml2c (1).
type1_negotiate(3)
type2_negotiate(3)
type2_submit(3)


