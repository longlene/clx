# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f67f8a05d583174662a594b79356b201c1d9d750"

DESCRIPTION="Set of extensions for documentation-utils"
HOMEPAGE="https://github.com/sirherrbatka/documentation-utils-extensions"
SRC_URI="https://github.com/sirherrbatka/documentation-utils-extensions/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/documentation-utils
"
BDEPEND=""
