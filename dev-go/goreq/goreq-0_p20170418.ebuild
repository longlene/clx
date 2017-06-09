# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/franela/goreq"
EGIT_COMMIT="b5b0f5eb2d16f20345cce0a544a75163579c0b00"

DESCRIPTION="Minimal and simple request library for Go language"
HOMEPAGE="https://github.com/franela/goreq"
SRC_URI="https://github.com/franela/goreq/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
