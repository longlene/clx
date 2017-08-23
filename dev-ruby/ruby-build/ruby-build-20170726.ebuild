# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Compile and install Ruby"
HOMEPAGE="https://github.com/rbenv/ruby-build"
SRC_URI="https://github.com/rbenv/ruby-build/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-ruby/rbenv
"

src_install() {
	dobin bin/*
	insinto /usr
	doins -r share
	dodoc README.md
}
	
