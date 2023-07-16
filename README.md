# External Contract Attack Vector

## Description

This attack vector is used to exploit a contract code that is not malicious itself, but relies on an external contract which can be poisoned.

Essentially, if an attacker deploys a malicious contract, which matches the ABI of the external contract; he/she can deploy a copy of the good contract, which would look completely fine on the surface, but would be poisoned with malicious code due to external calls.

## Remediation

The best way to avoid this attack is to remove the possibility of supplying an external contract, and to deploy a new contract explicitly. This way, the contract will not be able to be poisoned by an external contract.

This will make the deployment process a bit more expensive, but it will be well worth it.
