# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/d4l3k/go-pry"
EGIT_COMMIT="0aea8bacf00adf27fe6e5f2a0f0236b716814ae3"

DESCRIPTION="An interactive REPL for Go that allows you to drop into your code at any point"
HOMEPAGE="https://github.com/d4l3k/go-pry"
SRC_URI="https://github.com/d4l3k/go-pry/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-go/ansi
	dev-go/errors
"
RDEPEND="${DEPEND}"

src_install() {
	golang-build_src_install
	dobin bin/go-pry
	dodoc src/${EGO_PN}/README.md
}
