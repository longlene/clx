# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="fee42604ae36884d2f7c5e8ffc3441fdb8ec77b7"

DESCRIPTION="An HTML parser written in Common Lisp."
HOMEPAGE="http://common-lisp.net/project/closure/closure-html/"
SRC_URI="https://github.com/lokedhs/closure-html/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

RDEPEND="
	dev-lisp/closure-common
	dev-lisp/flexi-streams"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all resources
}
