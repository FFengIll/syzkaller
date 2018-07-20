// AUTOGENERATED FILE

package gen

import . "github.com/google/syzkaller/prog"

var Target_64_fork = &Target{OS: "test", Arch: "64_fork", Revision: revision_64_fork, PtrSize: 8, PageSize: 8192, NumPages: 2048, DataOffset: 536870912, Syscalls: syscalls_64_fork, Resources: resources_64_fork, Structs: structDescs_64_fork, Consts: consts_64_fork}

var resources_64_fork = []*ResourceDesc(nil)

var structDescs_64_fork = []*KeyedStruct(nil)

var syscalls_64_fork = []*Syscall{
	{Name: "syz_mmap", CallName: "syz_mmap", Args: []Type{
		&VmaType{TypeCommon: TypeCommon{TypeName: "vma", FldName: "addr", TypeSize: 8}},
		&LenType{IntTypeCommon: IntTypeCommon{TypeCommon: TypeCommon{TypeName: "len", FldName: "len", TypeSize: 8}}, Buf: "addr"},
	}},
}

var consts_64_fork = []ConstValue{
	{Name: "IPPROTO_ICMPV6", Value: 58},
	{Name: "IPPROTO_TCP", Value: 6},
	{Name: "IPPROTO_UDP", Value: 17},
}

const revision_64_fork = "96f1f19d85a4d091cba7b036633c3b48ccfe4439"
