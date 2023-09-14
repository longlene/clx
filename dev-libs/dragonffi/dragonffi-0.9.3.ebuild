# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

DESCRIPTION="C Foreign Function Interface and JIT using Clang/LLVM"
HOMEPAGE="https://github.com/aguinet/dragonffi"
SRC_URI="https://github.com/aguinet/dragonffi/archive/dffi-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	sys-devel/llvm
"
RDEPEND="${DEPEND}"
BDEPEND=""
