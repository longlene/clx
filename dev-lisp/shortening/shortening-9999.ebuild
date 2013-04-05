# Distributed under the terms of the GNU General Public License v2

EAPI=4

DESCRIPTION=""
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/hunchentoot
dev-lisp/alexandria
dev-lisp/py-configparser
dev-lisp/yaclml"

src_compile() {
	sbcl --noinform --no-userinit --no-sysinit --disable-debugger \
		--eval "(require 'asdf)" \
		--eval "(require 'shortening)" \
		--eval "(sb-ext:save-lisp-and-die "shortening" :executable t :toplevel #'shortening:init)" \
		--eval "(exit)"
}
