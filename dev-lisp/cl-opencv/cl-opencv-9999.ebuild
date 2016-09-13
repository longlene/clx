# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="OpenCV bindings for SBCL"
HOMEPAGE="https://github.com/longlene/cl-opencv"
SRC_URI=""

EGIT_REPO_URI="git://github.com/longlene/cl-opencv.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cffi
dev-lisp/sbcl
media-libs/opencv
virtual/libffi"

src_compile() {
	emake ||  die "Make failed!"
}
src_install() {
	dolib.so glue/libcl-opencv-glue.so
	common-lisp-install *.lisp ${PN}.asd
	common-lisp-symlink-asdf
	dodoc README.md LICENSE
}


