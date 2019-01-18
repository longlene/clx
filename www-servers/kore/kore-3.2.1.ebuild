# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

DESCRIPTION="An easy to use web platform for writing scalable, concurrent APIs in C or Python"
HOMEPAGE="https://kore.io"
SRC_URI="https://github.com/jorisvink/kore/archive/${PV}-release.tar.gz -> ${P}.tar.gz"

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

src_compile() {
	local flags=""
	use postgres && flags+=" PGSQL=1 "
	use debug && flags+=" DEBUG=1 "
	use threads && flags+=" TASKS=1 "
	use ssl || flags+=" NOTLS=1 "
	emake PREFIX=/usr $flags
}

src_install() {
	dobin kore
	insinto /usr/include/kore
	doins includes/*.h
	dodoc README.md
}
