# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="aaa1228f3ab60dfce239705e55cc70662d1bbc59"

DESCRIPTION="A stand-alone speech recognizer written in Common Lisp"
HOMEPAGE="https://github.com/belambert/cl-asr"
SRC_URI="https://github.com/belambert/cl-asr/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bordeaux-fft
	dev-lisp/cl-ppcre
	dev-lisp/sbcl
	dev-lisp/cl-lm
	dev-lisp/cl-portaudio
	dev-lisp/port-audio
	dev-lisp/mixalot-mp3
	dev-lisp/ieee-float3
	dev-lisp/alexandria
	dev-lisp/metatilities
	dev-lisp/array-operations
	dev-lisp/cl-fad
	dev-lisp/split-sequence
	dev-lisp/gzip-stream
"
