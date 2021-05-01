# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="4dfb89fa1af6b305b6492b8af042f5190c11e9fc"

DESCRIPTION="A Common Lisp library that provides a namespace for readtables."
HOMEPAGE="http://common-lisp.net/project/editor-hints/"
SRC_URI="https://github.com/melisgl/named-readtables/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
KEYWORDS="~amd64 ~arm ~x86"
SLOT="0"
IUSE="doc"

