# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Replacement for /sbin/init that launches an Erlang/OTP Release"
HOMEPAGE="https://github.com/nerves-project/erlinit"
SRC_URI="https://github.com/nerves-project/erlinit/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin erlinit
	dodoc README.md
}
