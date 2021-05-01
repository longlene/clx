# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="fc3e39601605eda37a4f43cf2925f00ea572c668"

DESCRIPTION="Common Lisp wrapper for the libsvm support vector machine library"
HOMEPAGE="https://github.com/melisgl/cl-libsvm"
SRC_URI="https://github.com/melisgl/cl-libsvm/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/trivial-garbage
	sci-libs/libsvm
"
