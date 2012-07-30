# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=2
inherit linux-mod

DESCRIPTION="adpinv Adaptec SAS controller kernel modules"
HOMEPAGE="http://www.adaptec.com/en-US/support/sas/sas/ASC-1405/"
SRC_URI="http://download.adaptec.com/sas/linux/adpinv_linux_src_2.0.0.0.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

RDEPEND=""
DEPEND="virtual/linux-sources"

MODULE_NAMES="asc1xx5 asc_init asc_64xx asc_sas"

S=${WORKDIR}/${P}/modules

src_compile() {
	cd asc1xx5
	set_arch_to_kernel
	emake KERNEL_LOCATION="${KERNEL_DIR}" || die
}

src_install() {

	for file in $(find -name \*.ko); do
		insinto "/lib/modules/${KV_FULL}/updates/$(dirname ${file})"
		doins "${file}" || die "failed to install module ${file}"
	done
}

pkg_postinst() {
	        update_depmod
	        update_moduledb
	        einfo 'You may have problem if you do not run "depmod -ae" after this installation'
}
	
pkg_postrm() {
	        remove_moduledb
}
