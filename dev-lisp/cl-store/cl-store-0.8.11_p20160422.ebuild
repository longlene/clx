# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="30c55f389b71f2527c5de7477860ee087ac60718"

DESCRIPTION="CL-STORE is a Common Lisp library for serializing and deserializing Common Lisp objects."
HOMEPAGE="http://common-lisp.net/project/cl-store/"
SRC_URI="https://github.com/skypher/cl-store/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="doc"

DEPEND=""
