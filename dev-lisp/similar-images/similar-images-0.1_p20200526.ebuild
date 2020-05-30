# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="2328ca87574f5f4c020cec3e9994fc4b83198819"

DESCRIPTION="Common Lisp library for finding similar images"
HOMEPAGE="https://github.com/shamazmazum/similar-images"
SRC_URI="https://github.com/shamazmazum/similar-images/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-fad
	dev-lisp/perceptual-hashes
	dev-lisp/vp-trees
	dev-lisp/cl-sqlite
	dev-lisp/eager-future2
"
BDEPEND=""
