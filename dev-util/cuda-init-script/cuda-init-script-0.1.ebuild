
DESCRIPTION="Gentoo CUDA init scripts."
HOMEPAGE="http://www.nvidia.com"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="x11-drivers/nvidia-drivers"

src_install() {
    newinitd "${FILESDIR}/cuda-${PV}-init.d" "cuda"
}
