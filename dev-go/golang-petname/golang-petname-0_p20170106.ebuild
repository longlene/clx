# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/dustinkirkland/golang-petname/..."
EGIT_COMMIT="242afa0b4f8af1fa581e7ea7f4b6d51735fa3fef"

DESCRIPTION="This utility will generate \"pet names\""
HOMEPAGE="https://github.com/dustinkirkland/golang-petname"
SRC_URI="https://github.com/dustinkirkland/golang-petname/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	golang-build_src_install
	dobin bin/petname
	doman src/${EGO_PN%/*}/golang-petname.1
}
