# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/james4k/go-bgfx"
EGIT_COMMIT="5b19e040f0f85dd46f568124470c22fba7697ff6"

DESCRIPTION="bgfx for Go"
HOMEPAGE="https://github.com/james4k/go-bgfx"
SRC_URI="https://github.com/james4k/go-bgfx/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -e '/cgo linux LDFLAGS/{s#$# -lX11#}' \
		-i src/${EGO_PN}/bridge.go
}
