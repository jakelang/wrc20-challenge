#include <ethereum.h>

void
do_balance(void)
{
	if (eei_getCallDataSize() != 24)
		eei_revert(0, 0);
	
	struct evm_uint256 address;
	struct evm_uint256 balance;

	eei_callDataCopy(address.bytes, 4, 20);
	eei_storageLoad(&address, &balance);

	eei_return(balance.bytes, 8);
}

void 
do_transfer(void)
{
	if (eei_getCallDataSize() != 32)
		eei_revert(0, 0);

	struct evm_uint256 sender;
	struct evm_uint256 recipient;
	struct evm_uint256 value;
	struct evm_uint256 sender_balance;
	struct evm_uint256 recipient_balance;

	/* Use these pointers to treat balance values as normal integers */
	uint64_t *sender_balance_raw;
	uint64_t *recipient_balance_raw;
	uint64_t *value_raw;

	eei_getTxOrigin((struct evm_address *)&sender);
	eei_callDataCopy(recipient.bytes, 4, 20);
	eei_callDataCopy(value.bytes, 24, 8);
	eei_storageLoad(&sender, &sender_balance);
	eei_storageLoad(&recipient, &recipient_balance);
	
	sender_balance_raw = (uint64_t *)&sender_balance;
	recipient_balance_raw = (uint64_t *)&recipient_balance;
	value_raw = (uint64_t *)&value;

	if (*sender_balance_raw < *value_raw)
		eei_revert(0, 0);

	*sender_balance_raw -= *value_raw;
	*recipient_balance_raw += *value_raw;

	eei_storageStore(&sender, &sender_balance);
	eei_storageStore(&recipient, &recipient_balance);
}

void 
main(void)
{
	if (eei_getCallDataSize() < 4)
		eei_revert(0, 0);
	
	uint32_t selector;
	eei_callDataCopy((uint8_t *)&selector, 0, 4);

	switch (selector) {
	case 0x9993021a:
		do_balance();
	case 0x5d359fbd:
		do_transfer();
	default:
		eei_revert(0, 0);
	}
}
