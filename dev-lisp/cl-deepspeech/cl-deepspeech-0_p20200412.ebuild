# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="72584851ca165ee522a6f816180a752ad6a9d93e"

DESCRIPTION="DeepSpeech bindings for Common Lisp"
HOMEPAGE="https://github.com/death/cl-deepspeech"
SRC_URI="https://github.com/death/cl-deepspeech/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	sci-libs/deepspeech
	dev-lisp/cffi
	dev-lisp/trivial-garbage
"
BDEPEND=""
