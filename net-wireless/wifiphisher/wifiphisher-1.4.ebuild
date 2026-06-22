# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="Automated phishing attacks against Wi-Fi networks"
HOMEPAGE="https://wifiphisher.org https://github.com/wifiphisher/wifiphisher"
SRC_URI="https://github.com/wifiphisher/wifiphisher/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	net-wireless/hostapd
	net-dns/dnsmasq
	$(python_gen_cond_dep '
		dev-python/dbus-python[${PYTHON_USEDEP}]
		dev-python/pbkdf2[${PYTHON_USEDEP}]
		dev-python/tornado[${PYTHON_USEDEP}]
		dev-python/pyric[${PYTHON_USEDEP}]
		dev-python/roguehostapd[${PYTHON_USEDEP}]
		net-analyzer/scapy[${PYTHON_USEDEP}]
	')
"
BDEPEND="
	$(python_gen_cond_dep '
		dev-python/setuptools[${PYTHON_USEDEP}]
	')
"

RESTRICT="test"

python_prepare_all() {
	# Remove Python 2-only interactive prompts that run after setup()
	sed -i '/^# Get hostapd/,$ d' setup.py || die
	distutils-r1_python_prepare_all
}
