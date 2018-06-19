# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="939a7e9da493c95becb5aef5dd2ea0f9f7914368"

DESCRIPTION="Lazy forms in Common Lisp"
HOMEPAGE="https://github.com/massung/lazy"
SRC_URI="https://github.com/massung/lazy/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
