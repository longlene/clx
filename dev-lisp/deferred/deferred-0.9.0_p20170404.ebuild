# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6828e3d974218f171e1c0929cda2777c9c06d7ca"

DESCRIPTION="A simple library allowing you to write code using deferred libraries"
HOMEPAGE="https://github.com/Shinmera/deferred/"
SRC_URI="https://github.com/Shinmera/deferred/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/named-readtables
"
