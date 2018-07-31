# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="795ca3352ad981e6773fac89b3884d0eda701cee"

DESCRIPTION="A Common Lisp library for manipulating ELF files"
HOMEPAGE="https://github.com/GrammaTech/elf"
SRC_URI="https://github.com/GrammaTech/elf/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/monkeylib-binary-data
	dev-lisp/metabang-bind
	dev-lisp/split-sequence
	dev-lisp/trivial-shell
	dev-lisp/cl-ppcre
	dev-lisp/flexi-streams
	test? ( dev-lisp/stefil dev-lisp/trivial-timeout )
"

src_prepare() {
	eapply_user
	if ! use test ; then
		sed -i '/defsystem\ :elf-test/,$d' ${PN}.asd
		rm -r test
	fi
}

src_install() {
	common-lisp-3_src_install
	use test || common-lisp-install-sources -t all COPYING
}
