#!/bin/bash
# Copyright 2018 syzkaller project authors. All rights reserved.
# Use of this source code is governed by Apache 2 LICENSE that can be found in the LICENSE file.

echo -e '// AUTOGENERATED FROM executor/common.h\n\n' > generated.go
echo -e 'package csource\nvar commonHeader = `' >> generated.go
cat ../../executor/common.h | \
	sed -e '/#include \"common_linux.h\"/ {' -e 'r ../../executor/common_linux.h' -e 'd' -e '}' | \
	sed -e '/#include \"common_akaros.h\"/ {' -e 'r ../../executor/common_akaros.h' -e 'd' -e '}' | \
	sed -e '/#include \"common_bsd.h\"/ {' -e 'r ../../executor/common_bsd.h' -e 'd' -e '}' | \
	sed -e '/#include \"common_fuchsia.h\"/ {' -e 'r ../../executor/common_fuchsia.h' -e 'd' -e '}' | \
	sed -e '/#include \"common_windows.h\"/ {' -e 'r ../../executor/common_windows.h' -e 'd' -e '}' | \
	sed -e '/#include \"common_test.h\"/ {' -e 'r ../../executor/common_test.h' -e 'd' -e '}' | \
	sed -e '/#include \"common_kvm_amd64.h\"/ {' -e 'r ../../executor/common_kvm_amd64.h' -e 'd' -e '}' | \
	sed -e '/#include \"common_kvm_arm64.h\"/ {' -e 'r ../../executor/common_kvm_arm64.h' -e 'd' -e '}' | \
	sed -e '/#include \"kvm.h\"/ {' -e 'r ../../executor/kvm.h' -e 'd' -e '}' | \
	sed -e '/#include \"kvm.S.h\"/ {' -e 'r ../../executor/kvm.S.h' -e 'd' -e '}' | \
	egrep -v '^[   ]*//' | \
	sed '/^[ 	]*\/\/.*/d' | \
	sed 's#[ 	]*//.*##g' >> generated.go
echo '`' >> generated.go
go fmt generated.go
