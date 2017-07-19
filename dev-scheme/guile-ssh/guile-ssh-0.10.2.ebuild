# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit autotools

DESCRIPTION="Guile-SSH is a library that provides access to the SSH protocol for GNU Guile programs"
HOMEPAGE="https://github.com/artyom-poptsov/guile-ssh"
SRC_URI="https://github.com/artyom-poptsov/guile-ssh/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND="
	net-libs/libssh[server]
"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}
