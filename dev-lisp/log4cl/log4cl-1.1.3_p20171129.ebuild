# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6a857b0b41c030a8a3b04096205e221baaa1755f"

DESCRIPTION="Common Lisp logging framework, modeled after Log4J"
HOMEPAGE="https://github.com/sharplispers/log4cl"
SRC_URI="https://github.com/sharplispers/log4cl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bordeaux-threads
	test? ( dev-lisp/stefil )
"

src_prepare() {
	eapply_user
	use example || rm -rf ${PN}-examples.asd examples
	if ! use test ; then
		sed -i '/defsystem :log4cl\/test/,$d' log4cl.asd
		rm -r tests
	fi
}
