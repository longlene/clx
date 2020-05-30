# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

MY_PV=${PV//./_}

DESCRIPTION="minimal CGI and FastCGI library in C"
HOMEPAGE="https://kristaps.bsd.lv/kcgi"
SRC_URI="https://github.com/kristapsdz/kcgi/archive/VERSION_${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="dev-libs/libbsd"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -e "/LIBDIR/{s#lib#$(get_libdir)#}" \
		-e '/MAN3DIR/{s#man/#share/man/#}' \
		-e '/MAN8DIR/{s#man/#share/man/#}' \
		-i GNUmakefile || die
}

src_configure() {
	./configure || die
}

src_install() {
	PREFIX="${D}"/usr emake install
}
