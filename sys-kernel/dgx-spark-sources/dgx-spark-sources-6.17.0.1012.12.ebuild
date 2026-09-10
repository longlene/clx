# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# Upstream (RageLtd/linux-dgx-spark) is an Arch PKGBUILD, not a kernel fork:
# it reassembles Ubuntu's "linux-nvidia" flavour for the DGX Spark (GB10)
# from Launchpad's orig tarball + debian diff, then layers its own config.
# ${PV} tracks that Ubuntu kernel package version (upstream-kernelver.ubuntupkgver).
MY_KV_FULL="${PV%.*.*}"
MY_UBUNTU_PKG="${PV#${MY_KV_FULL}.}"
MY_KV_SERIES="${MY_KV_FULL%.*}"

MY_LP_PKG="linux-nvidia-${MY_KV_SERIES}"
MY_LP_BASE="https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/${MY_LP_PKG}/${MY_KV_FULL}-${MY_UBUNTU_PKG}"
MY_ORIG="${MY_LP_PKG}_${MY_KV_FULL}.orig.tar.gz"
MY_DIFF="${MY_LP_PKG}_${MY_KV_FULL}-${MY_UBUNTU_PKG}.diff.gz"

# Pin to the commit the ebuild was written against; this repo has no releases/tags.
DGX_COMMIT="2f74023ce225559d1da4d71795274dedab1fc32c"
DGX_P="linux-dgx-spark-${DGX_COMMIT}"

DESCRIPTION="Ubuntu NVIDIA kernel sources patched for the DGX Spark (GB10 Grace-Blackwell)"
HOMEPAGE="https://github.com/RageLtd/linux-dgx-spark"
SRC_URI="
	${MY_LP_BASE}/${MY_ORIG}
	${MY_LP_BASE}/${MY_DIFF}
	https://github.com/RageLtd/linux-dgx-spark/archive/${DGX_COMMIT}.tar.gz -> ${DGX_P}.gh.tar.gz
"
S="${WORKDIR}/linux-${MY_KV_SERIES}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~arm64"
RESTRICT="binchecks mirror strip"

KV_DIR="linux-${MY_KV_FULL}-dgx-spark"

src_prepare() {
	# The Ubuntu diff carries "new file" hunks for a few files that were
	# merged upstream between the vanilla and Ubuntu trees (e.g. pinctrl and
	# version_signature sources). patch(1) refuses to create a file that
	# already exists, so drop those paths first and let the diff recreate them.
	local difffile="${WORKDIR}/${MY_DIFF%.gz}"
	local f
	while read -r f; do
		[[ -n "${f}" && -f "${f}" ]] || continue
		einfo "Removing pre-existing ${f} so the Ubuntu diff can recreate it"
		rm -f "${f}" || die
	done < <(grep -B2 '^@@ -0,0 ' "${difffile}" | grep '^+++ ' | sed 's|^+++ [^/]*/||; s/[[:space:]].*//' | sort -u)

	eapply -p1 "${difffile}"

	local p
	for p in "${WORKDIR}/${DGX_P}"/patches/*.patch; do
		[[ -e "${p}" ]] || continue
		eapply "${p}"
	done

	eapply_user

	# Ship the DGX Spark defconfig as a normal in-tree defconfig instead of
	# baking a .config into the ebuild - keeps this a plain sources package,
	# same as gentoo-sources: the user configures/builds it themselves.
	cp "${WORKDIR}/${DGX_P}/configs/config.aarch64" \
		"${S}/arch/arm64/configs/dgx_spark_defconfig" || die

	# Upstream's defconfig leaves this off even though the driver is present
	# in-tree (from the Ubuntu diff) and this hardware's onboard 10GbE NIC
	# (PCI 10ec:8127) needs it - CONFIG_R8169 does not support this chip.
	"${S}"/scripts/config \
		--file "${S}/arch/arm64/configs/dgx_spark_defconfig" \
		--module R8127 || die

	echo "-dgx-spark" > "${S}/localversion.10-pkgname" || die
}

src_compile() { :; }

src_install() {
	dodir /usr/src
	cp -a "${S}" "${D}/usr/src/${KV_DIR}" || die
}

pkg_postinst() {
	elog "DGX Spark kernel sources installed to /usr/src/${KV_DIR}"
	elog "A known-good starting point is provided as"
	elog "arch/arm64/configs/dgx_spark_defconfig, matching the config NVIDIA"
	elog "ships on the stock Ubuntu-based DGX OS. To use it:"
	elog "  cd /usr/src/${KV_DIR} && make ARCH=arm64 dgx_spark_defconfig"
	elog ""
	elog "This targets NVIDIA GB10 Grace-Blackwell (aarch64) hardware only,"
	elog "and upstream (${HOMEPAGE}) describes the build as early/experimental."
}
