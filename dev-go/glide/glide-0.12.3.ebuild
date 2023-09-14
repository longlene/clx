# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8
EGO_PN="github.com/Masterminds/glide"

inherit golang-build golang-vcs-snapshot

DESCRIPTION="Package Management for Golang"
HOMEPAGE="https://glide.sh"
SRC_URI="https://github.com/Masterminds/glide/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	golang-build_src_install
	dobin bin/glide
	dodoc README.md
}
