# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/yhirose/go-peg/..."
EGIT_COMMIT="510a9c376b0c44771fe575e9ddc589dfbcae8e7b"

DESCRIPTION="Yet another PEG parser generator for Go"
HOMEPAGE="https://github.com/yhirose/go-peg"
SRC_URI="https://github.com/yhirose/go-peg/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	golang-build_src_install
	dobin bin/peglint
}
