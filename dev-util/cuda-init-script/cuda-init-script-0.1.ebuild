
DESCRIPTION="Gentoo CUDA init scripts."
HOMEPAGE="http://www.nvidia.com"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 ~amd64"

RDEPEND="x11-drivers/nvidia-drivers"

src_install() {
	newinitd "${FILESDIR}/cuda-${PV}-init.d" "cuda"
}
