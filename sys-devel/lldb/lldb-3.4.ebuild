# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} pypy{1_9,2_0} )

inherit cmake-utils eutils multilib python-r1

DESCRIPTION="LLDB is a next generation, high-performance debugger"
HOMEPAGE="http://lldb.llvm.org/"
SRC_URI="http://www.llvm.org/releases/3.3/lldb-${PV}.src.tar.gz"

# check http://lab.llvm.org:8011/builders/lldb-x86_64-linux/
# when build fails

LICENSE="UoI-NCSA"
SLOT="0"
KEYWORDS="~amd64"
IUSE="debug +python"

DEPEND="${PYTHON_DEPS}"
RDEPEND="sys-devel/llvm[lldb]
>sys-devel/clang-${PV}
dev-libs/libedit
${PYTHON_DEPS}"


