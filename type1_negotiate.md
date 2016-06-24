% CGC POV API

# NAME
*type1_negotiate* - negotiate a Type 1 POV

# LIBRARY
library "libpov"

# SYNOPSIS
\#include \<libpov.h\>

_int_ **type1_negotiate**(_unsigned int ipmask_, _unsigned int regmask_, _unsigned int regnum_, _type1_vals *t1vals_)

# DESCRIPTION
The *type1_negotiate* function performs a CGC Type 1 POV negotiation by
registering the supplied *ipmask*, *regmask*, and *regnum* values with the
CFE competition framework, which in return specifies register and IP values
that the POV is required to use in order to demonstrate a successful POV.

*ipmask* and *regmask* indicate the callers degree of control over EIP and
a general purpose register named by *regnum* according to the following list:

   0 - eax
   1 - ecx
   2 - edx
   3 - ebx
   4 - esp
   5 - ebp
   6 - esi
   7 - edi

# RETURN VALUE
On success, zero is returned and the *t1vals* structure is populated with the
IP and register value that the POV is required to use in order to demonstrate
a successful POV. At the time of the crash the following must be true of the
crashing CB state:
 (crash_eip & ipmask) == t1vals->ipval 
 (crash_REG & regmask) == t1vals->regval

On error, -1 is returned and t1vals is undefined.

# SEE ALSO
type2_negotiate(3),
type2_submit(3)
