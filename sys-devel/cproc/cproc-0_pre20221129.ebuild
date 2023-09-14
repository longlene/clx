# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="9ae9aa6dce652ab62c1c9ca34e8419e5dc510de1"

DESCRIPTION="C11 compiler"
HOMEPAGE="https://github.com/michaelforney/cproc"
SRC_URI="https://git.sr.ht/~mcf/cproc/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	sys-devel/qbe
"
BDEPEND=""

src_configure() {
	./configure --prefix=/usr || die "configure failed"
}

src_install() {
	emake DESTDIR="${D}" install
}
