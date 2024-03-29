# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="20d1ddbc73e0d901f675ed498a1077ede19f7fe3"

DESCRIPTION="pulse audio binding"
HOMEPAGE="https://github.com/snmsts/cl-pulseaudio/"
SRC_URI="https://github.com/snmsts/cl-pulseaudio/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/osicat
	media-sound/pulseaudio
"
