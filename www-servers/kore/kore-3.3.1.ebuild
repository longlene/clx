# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

DESCRIPTION="An easy to use web platform for writing scalable, concurrent APIs in C or Python"
HOMEPAGE="https://kore.io"
SRC_URI="https://kore.io/releases/${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="debug postgres +ssl +threads"

DEPEND="
	sys-libs/zlib
	ssl? ( dev-libs/openssl )
	postgres? ( dev-db/postgresql )
"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	sed -i 's#-Werror##' Makefile
}

src_compile() {
	local flags=""
	use postgres && flags+=" PGSQL=1 "
	use debug && flags+=" DEBUG=1 "
	use threads && flags+=" TASKS=1 "
	use ssl || flags+=" NOTLS=1 "
	emake PREFIX=/usr $flags
}

src_install() {
	dobin kore kodev/kodev
	insinto /usr/include
	doins -r include/kore
	doman share/man/kodev.1
	insinto /usr/share/kore
	doins kore.features
	dodoc README.md
}
