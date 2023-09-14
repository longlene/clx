# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/op/go-nanomsg"
EGIT_COMMIT="48d7bb6353dec050b3020e54028984eea4d350d1"

DESCRIPTION="Language bindings for nanomsg in Go"
HOMEPAGE="https://github.com/op/go-nanomsg"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-libs/nanomsg
"
RDEPEND="${DEPEND}"
