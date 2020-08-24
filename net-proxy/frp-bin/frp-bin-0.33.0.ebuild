# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
MY_PV=v${PV}
inherit systemd

DESCRIPTION="A fast reverse proxy to help you expose a local server behind a NAT or firewall to the internet."
HOMEPAGE="https://github.com/fatedier/frp"
SRC_URI="
	amd64?	( https://github.com/fatedier/frp/releases/download/${MY_PV}/frp_${PV}_linux_amd64.tar.gz )
	x86?	( https://github.com/fatedier/frp/releases/download/${MY_PV}/frp_${PV}_linux_386.tar.gz )
	arm?	( https://github.com/fatedier/frp/releases/download/${MY_PV}/frp_${PV}_linux_arm.tar.gz )
	arm64?	( https://github.com/fatedier/frp/releases/download/${MY_PV}/frp_${PV}_linux_arm.tar.gz )
	mips?	( https://github.com/fatedier/frp/releases/download/${MY_PV}/frp_${PV}_linux_mips.tar.gz )
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86 ~mips"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	if [ "${A}" != "" ]; then
		unpack ${A}
	fi
	mv * "${PN}"-"${PV}"
}

src_install() {
	cd ${S}
	dobin frpc frps

	insinto /etc/frp
	doins *.ini

	newinitd "${FILESDIR}/frps.initd" frps
	newinitd "${FILESDIR}/frpc.initd" frpc
	systemd_dounit systemd/*.service
}
