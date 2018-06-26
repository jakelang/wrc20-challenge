#include <ethereum.h>

void 
main(void)
{
	if (ethereum_callDataSize < 4)
		ethereum_revert(0, 0);
	
	uint32_t selector;
	ethereum_callDataCopy(&selector, 0, 4);

	switch (selector) {
	case 0x9993021a:
		do_balance();
	case 0x5d359fbd:
		do_transfer();
	default:
		ethereum_revert(0, 0);
	}
}

void 
do_balance()
{
	if (ethereum_callDataSize != 24)
		ethereum_revert(0, 0);

	struct evm_uint256 sender;
	struct evm_uint256 recipient;
	struct evm_value value;
	struct evm_value sender_balance;
	struct evm_value recipient_balance;

	ethereum_getTxOrigin(&sender);
	ethereum_callDataCopy(&recipient, 4, 20);
	ethereum_callDataCopy(&value, 24, 8);
	ethereum_storageLoad(&sender, &sender_balance);
	ethereum_storageLoad(&recipient, &recipient_balance);

	// if sender balance < val
	// revert (0,0)
}
