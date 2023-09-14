# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_4 python3_5 python3_6 python3_7 )

inherit multilib python-single-r1 mount-boot

DESCRIPTION="Funtoo Core Boot Framework for global boot loader configuration"
HOMEPAGE="https://www.funtoo.org/Package:Boot-Update"
SRC_URI="
	https://github.com/funtoo/boot-update/archive/${PV}.tar.gz -> ${P}.tar.gz
	http://www.memtest.org/download/5.01/memtest86+-5.01.bin.gz
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="${PYTHON_DEPS}"
RDEPEND="${DEPEND} >=sys-boot/grub-2.02[fonts]"
BDEPEND=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

src_prepare() {
	default
	rm -r python/modules/funtoo/old
}

src_compile() {
	:
}

src_install() {
	insinto $(python_get_sitedir)
	doins -r python/modules/*

	dodoc doc/*.rst

	doman doc/{boot-update.8,boot.conf.5}

	into /
	dosbin sbin/boot-update
	#sed -i -e "1 s:^.*$:${PYTHON}:" -e "s:^version = .*$:version = \"${PV}\":" ${D}/sbin/boot-update
	sed -i -e "s:^version = .*$:version = \"${PV}\":" ${D}/sbin/boot-update

	python_fix_shebang "${ED}"
	python_optimize "${ED}"

	dodoc etc/boot.conf.example
	insinto /etc
	doins etc/boot.conf
	doins etc/boot.conf.defaults
	doins etc/boot.conf.example

	insinto /boot
	newins ${WORKDIR}/memtest86+-5.01.bin memtest86.bin
}
