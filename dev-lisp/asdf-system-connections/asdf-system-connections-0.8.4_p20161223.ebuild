# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9f085240febccccff99d9d3bb687fcaafffd3f5e"

DESCRIPTION="Provides auto-loading of systems that only make sense when others are loaded."
HOMEPAGE="http://common-lisp.net/project/cl-containers/asdf-system-connections/"
SRC_URI="https://github.com/gwkkwg/asdf-system-connections/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

