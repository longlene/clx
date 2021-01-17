# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d26c642212548165a4ab4aee39644b231ff6e797"

DESCRIPTION="Draw Lindenmayer Systems with Common LISP"
HOMEPAGE="https://github.com/FdelMazo/cl-aristid"
SRC_URI="https://github.com/FdelMazo/cl-aristid/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-svg
	dev-lisp/cl-colors
"
BDEPEND=""
