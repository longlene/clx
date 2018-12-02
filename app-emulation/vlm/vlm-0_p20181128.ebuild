# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="8c907b8584c289bea5cbffdeaa9652fae0d87bce"

DESCRIPTION="Symbolics Virtual Lisp Machine"
HOMEPAGE="https://github.com/longlene/vlm"
SRC_URI="https://github.com/longlene/vlm/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	x11-libs/libX11
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin genera
}
