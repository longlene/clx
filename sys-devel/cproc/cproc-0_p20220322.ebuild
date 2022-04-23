# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="cff37cf15a35cd833d33f26591d99344574a79f0"

DESCRIPTION="C11 compiler"
HOMEPAGE="https://github.com/michaelforney/cproc"
SRC_URI="https://github.com/michaelforney/cproc/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

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
