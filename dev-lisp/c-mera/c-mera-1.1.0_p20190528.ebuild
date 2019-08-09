# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools vcs-snapshot

EGIT_COMMIT="31e5edcc503a118dbd32ea3c78e80e7ec37e98af"

DESCRIPTION="C-Mera is a very simple source-to-source compiler"
HOMEPAGE="https://github.com/kiselgra/c-mera"
SRC_URI="https://github.com/kiselgra/c-mera/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-lisp/sbcl
	dev-lisp/net-didierverna-clon
"
RDEPEND="${DEPEND}"

QA_PRESTRIPPED="
	/usr/bin/cm-c
	/usr/bin/cm-cxx
	/usr/bin/cm-glsl
	/usr/bin/cm-cuda
	/usr/bin/cm-opencl
"


src_prepare() {
	eapply_user
	eautoreconf
}

src_configure() {
	econf --with-sbcl
}

src_compile() {
	emake -j1
}
