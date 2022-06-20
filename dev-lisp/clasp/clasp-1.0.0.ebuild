# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_9 )
PYTHON_REQ_USE="threads(+)"
#inherit llvm vcs-snapshot toolchain-funcs
inherit python-any-r1 waf-utils

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/clasp-developers/clasp/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	sys-devel/llvm
	sys-devel/clang
"
RDEPEND="${DEPEND}"

#LLVM_MAX_SLOT=6
#
#LLVM_BIN_DIR=${EPREFIX}/usr/lib/llvm/${LLVM_MAX_SLOT}/bin
#
#CXX=${LLVM_BIN_DIR}/clang++
#CC=${LLVM_BIN_DIR}/clang

pkg_setup() {
#	llvm_pkg_setup
	python-any-r1_pkg_setup
}

