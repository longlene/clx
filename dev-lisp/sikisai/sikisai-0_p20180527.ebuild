# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="aa5a7dd08139eb094360e281e2ac07f3cc3f0bf3"

DESCRIPTION="Sikisai, the light-weight graphics library"
HOMEPAGE="https://github.com/singy15/sikisai"
SRC_URI="https://github.com/singy15/sikisai/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-opengl
"
