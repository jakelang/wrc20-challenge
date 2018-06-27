(module
  (type $t0 (func (result i32)))
  (type $t1 (func (param i32 i32)))
  (type $t2 (func (param i32 i32 i32)))
  (type $t3 (func (param i32)))
  (type $t4 (func))
  (import "ethereum" "callDataCopy" (func $ethereum.callDataCopy (type $t2)))
  (import "ethereum" "getCallDataSize" (func $ethereum.getCallDataSize (type $t0)))
  (import "ethereum" "getTxOrigin" (func $ethereum.getTxOrigin (type $t3)))
  (import "ethereum" "return" (func $ethereum.return (type $t1)))
  (import "ethereum" "revert" (func $ethereum.revert (type $t1)))
  (import "ethereum" "storageLoad" (func $ethereum.storageLoad (type $t1)))
  (import "ethereum" "storageStore" (func $ethereum.storageStore (type $t1)))
  (table $T0 0 anyfunc)
  (func $do_balance (export "do_balance") (type $t4)
    (local $l0 i32)
    (set_local $l0
      (i32.sub
        (i32.load offset=4
          (i32.const 0))
        (i32.const 64)))
    (i32.store offset=4
      (i32.const 0)
      (get_local $l0))
    (block $B0
      (br_if $B0
        (i32.eq
          (call $ethereum.getCallDataSize)
          (i32.const 24)))
      (call $ethereum.revert
        (i32.const 0)
        (i32.const 0)))
    (call $ethereum.callDataCopy
      (i32.add
        (get_local $l0)
        (i32.const 32))
      (i32.const 4)
      (i32.const 20))
    (call $ethereum.storageLoad
      (i32.add
        (get_local $l0)
        (i32.const 32))
      (get_local $l0))
    (call $ethereum.return
      (get_local $l0)
      (i32.const 8))
    (i32.store offset=4
      (i32.const 0)
      (i32.add
        (get_local $l0)
        (i32.const 64))))
  (func $do_transfer (export "do_transfer") (type $t4)
    (local $l0 i32) (local $l1 i64) (local $l2 i64)
    (set_local $l0
      (i32.sub
        (i32.load offset=4
          (i32.const 0))
        (i32.const 160)))
    (i32.store offset=4
      (i32.const 0)
      (get_local $l0))
    (block $B0
      (br_if $B0
        (i32.eq
          (call $ethereum.getCallDataSize)
          (i32.const 32)))
      (call $ethereum.revert
        (i32.const 0)
        (i32.const 0)))
    (call $ethereum.getTxOrigin
      (i32.add
        (get_local $l0)
        (i32.const 128)))
    (call $ethereum.callDataCopy
      (i32.add
        (get_local $l0)
        (i32.const 96))
      (i32.const 4)
      (i32.const 20))
    (call $ethereum.callDataCopy
      (i32.add
        (get_local $l0)
        (i32.const 64))
      (i32.const 24)
      (i32.const 8))
    (call $ethereum.storageLoad
      (i32.add
        (get_local $l0)
        (i32.const 128))
      (i32.add
        (get_local $l0)
        (i32.const 32)))
    (call $ethereum.storageLoad
      (i32.add
        (get_local $l0)
        (i32.const 96))
      (get_local $l0))
    (set_local $l2
      (i64.load offset=64
        (get_local $l0)))
    (set_local $l1
      (i64.load offset=32
        (get_local $l0)))
    (block $B1
      (br_if $B1
        (i64.ge_u
          (get_local $l1)
          (get_local $l2)))
      (call $ethereum.revert
        (i32.const 0)
        (i32.const 0))
      (set_local $l1
        (i64.load offset=32
          (get_local $l0)))
      (set_local $l2
        (i64.load offset=64
          (get_local $l0))))
    (i64.store offset=32
      (get_local $l0)
      (i64.sub
        (get_local $l1)
        (get_local $l2)))
    (i64.store
      (get_local $l0)
      (i64.add
        (i64.load
          (get_local $l0))
        (get_local $l2)))
    (call $ethereum.storageStore
      (i32.add
        (get_local $l0)
        (i32.const 128))
      (i32.add
        (get_local $l0)
        (i32.const 32)))
    (call $ethereum.storageStore
      (i32.add
        (get_local $l0)
        (i32.const 96))
      (get_local $l0))
    (i32.store offset=4
      (i32.const 0)
      (i32.add
        (get_local $l0)
        (i32.const 160))))
  (func $main (export "main") (type $t4)
    (local $l0 i32) (local $l1 i32)
    (set_local $l1
      (i32.sub
        (i32.load offset=4
          (i32.const 0))
        (i32.const 80)))
    (i32.store offset=4
      (i32.const 0)
      (get_local $l1))
    (block $B0
      (br_if $B0
        (i32.gt_u
          (call $ethereum.getCallDataSize)
          (i32.const 3)))
      (call $ethereum.revert
        (i32.const 0)
        (i32.const 0)))
    (call $ethereum.callDataCopy
      (i32.add
        (get_local $l1)
        (i32.const 12))
      (i32.const 0)
      (i32.const 4))
    (set_local $l0
      (i32.load offset=12
        (get_local $l1)))
    (block $B1
      (block $B2
        (br_if $B2
          (i32.eq
            (get_local $l0)
            (i32.const 1563795389)))
        (br_if $B1
          (i32.ne
            (get_local $l0)
            (i32.const -1718418918)))
        (block $B3
          (br_if $B3
            (i32.eq
              (call $ethereum.getCallDataSize)
              (i32.const 24)))
          (call $ethereum.revert
            (i32.const 0)
            (i32.const 0)))
        (call $ethereum.callDataCopy
          (i32.add
            (get_local $l1)
            (i32.const 48))
          (i32.const 4)
          (i32.const 20))
        (call $ethereum.storageLoad
          (i32.add
            (get_local $l1)
            (i32.const 48))
          (i32.add
            (get_local $l1)
            (i32.const 16)))
        (call $ethereum.return
          (i32.add
            (get_local $l1)
            (i32.const 16))
          (i32.const 8)))
      (call $do_transfer))
    (call $ethereum.revert
      (i32.const 0)
      (i32.const 0))
    (i32.store offset=4
      (i32.const 0)
      (i32.add
        (get_local $l1)
        (i32.const 80))))
  (memory $memory (export "memory") 1))
