# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_COMMIT="860cb70ffd8cef03615aa3e0e2a169e647fd8358"

inherit common-lisp-3

DESCRIPTION="Tools for the representation of graphs and flowcharts"
HOMEPAGE="https://codeberg.org/shinmera/flow"
SRC_URI="https://codeberg.org/shinmera/flow/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/documentation-utils
	dev-lisp/text-draw
	dev-lisp/closer-mop
"
BDEPEND=""

S="${WORKDIR}"/${PN}
