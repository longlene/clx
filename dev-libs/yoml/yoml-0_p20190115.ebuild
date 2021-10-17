# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="5d78aa949c0ddea0cc842a64123e8c54fddc2856"

DESCRIPTION="YAML Object Model Layer - a DOM-like interface for YAML"
HOMEPAGE="https://github.com/h2o/yoml"
SRC_URI="https://github.com/h2o/yoml/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="dev-libs/libyaml"
RDEPEND="${DEPEND}"

src_compile() {
	:
}

src_install() {
	insinto /usr/include
	doins yoml.h yoml-parser.h
	dodoc README.md
}
