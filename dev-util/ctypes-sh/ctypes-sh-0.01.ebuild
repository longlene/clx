# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

MY_PN=${PN/-/.}

DESCRIPTION="A foreign function interface for bash"
HOMEPAGE="https://github.com/taviso/ctypes.sh"
SRC_URI="https://github.com/taviso/ctypes.sh/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
#KEYWORDS="~amd64"
IUSE=""

DEPEND="
	app-shells/bash[plugins]
	virtual/libffi
"
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${MY_PN}-${PV}
