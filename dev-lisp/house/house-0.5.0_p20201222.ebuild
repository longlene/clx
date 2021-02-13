# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="282bbb9f694da10c3cd765074faeabda21296baa"

DESCRIPTION="Minimal asynchronous CL web server"
HOMEPAGE="https://github.com/Inaimathi/house"
SRC_URI="https://github.com/Inaimathi/house/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/anaphora
	dev-lisp/cl-base64
	dev-lisp/cl-ppcre
	dev-lisp/cl-json
	dev-lisp/bordeaux-threads
	dev-lisp/cl-fad
	dev-lisp/usocket
	dev-lisp/optima
	dev-lisp/flexi-streams
	dev-lisp/lisp-unit
	test? ( dev-lisp/test-utils )
"

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem #:house\/test/,$d' ${PN}.asd
		rm -rf test
	fi
}

