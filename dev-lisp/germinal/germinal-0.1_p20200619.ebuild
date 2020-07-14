# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="fc76df612958de873a80448925f401a2c609956e"

DESCRIPTION=""
HOMEPAGE="https://github.com/jfmcbrayer/germinal"
SRC_URI="https://git.carcosa.net/jmcbray/germinal/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
