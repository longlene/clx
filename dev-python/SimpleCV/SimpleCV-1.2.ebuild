EAPI="3"
PYTHON_DEPEND='2'
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="SimpleCV is a python framework for creating a more human readable programming interface to OpenCV."
HOMEPAGE="http://www.simplecv.org/"
SRC_URI="mirror://sourceforge/simplecv/${PN}-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
DEPEND="dev-python/numpy
	sci-libs/scipy
	dev-python/pygame
	dev-python/imaging
	media-libs/opencv[python]"

pkg_postinst() {
    ewarn "NOTE: To make SimpleCV work sci-libs/scipy *MUST*"
    ewarn "be linked to sci-libs/lapack-atlas:"
    ewarn "http://blog.tremily.us/posts/SciPy_and_ATLAS/"
}
