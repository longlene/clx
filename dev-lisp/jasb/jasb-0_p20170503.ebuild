# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e9d07305806443e71a7df449123e7cddca74a37e"

DESCRIPTION="Just Another Slack Bot"
HOMEPAGE="https://github.com/dptd/jasb"
SRC_URI="https://github.com/dptd/jasb/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/jasaw
"
