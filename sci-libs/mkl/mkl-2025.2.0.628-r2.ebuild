# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker

VER="$(ver_cut 1-2)"
MY_PV="${VER}-$(ver_cut 1-3)-$(ver_cut 4)"
DPCPP_PV="2025.0-2025.0.3-1401"

DESCRIPTION="Intel Math Kernel Library"
HOMEPAGE="https://www.intel.com/content/www/us/en/developer/tools/oneapi/onemkl.html"
SRC_URI="
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-mkl-classic-devel-${MY_PV}_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-mkl-classic-include-${MY_PV}_amd64.deb

	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-mkl-core-${MY_PV}_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-mkl-core-devel-${MY_PV}_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-mkl-devel-${MY_PV}_amd64.deb

	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-mkl-cluster-${MY_PV}_amd64.deb
	https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-mkl-cluster-devel-${MY_PV}_amd64.deb

	sycl? (
		https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-mkl-sycl-${MY_PV}_amd64.deb
		https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-mkl-sycl-blas-${MY_PV}_amd64.deb
		https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-mkl-sycl-data-fitting-${MY_PV}_amd64.deb
		https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-mkl-sycl-devel-${MY_PV}_amd64.deb
		https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-mkl-sycl-dft-${MY_PV}_amd64.deb
		https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-mkl-sycl-include-${MY_PV}_amd64.deb
		https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-mkl-sycl-lapack-${MY_PV}_amd64.deb
		https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-mkl-sycl-rng-${MY_PV}_amd64.deb
		https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-mkl-sycl-sparse-${MY_PV}_amd64.deb
		https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-mkl-sycl-stats-${MY_PV}_amd64.deb
		https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-mkl-sycl-vm-${MY_PV}_amd64.deb

		https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-dpcpp-cpp-runtime-${DPCPP_PV}_amd64.deb
		https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-shared-runtime-${DPCPP_PV}_amd64.deb
		https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-openmp-${DPCPP_PV}_amd64.deb
	)
"

S="${WORKDIR}"

LICENSE="ISSL"
SLOT="0"
KEYWORDS="~amd64"
IUSE="sycl tbb"

RESTRICT="strip"

# MKL uses Intel/LLVM OpenMP by default.
# One can change the threadding layer to "gnu" or "tbb"
# through the MKL_THREADING_LAYER env var.
RDEPEND="
	app-eselect/eselect-blas
	app-eselect/eselect-lapack
	dev-libs/opencl-icd-loader
	llvm-runtimes/openmp
	tbb? ( dev-cpp/tbb )
"
#sys-cluster/mpich[fortran]

BDEPEND="
	app-arch/xz-utils[extra-filters(+)]
	app-eselect/eselect-blas
	app-eselect/eselect-lapack
"

QA_PREBUILT="*"
QA_TEXTRELS="*"
QA_SONAME="*"

src_prepare() {
	default
	rm -r opt/intel/oneapi/mkl/${VER}/share/mkl/benchmarks/ || die
}

src_install() {
	local libdir=$(get_libdir)
	local libroot=opt/intel/oneapi/mkl/${VER}/lib

	# Symlink pkgconfig and cmake files
	pushd "${libroot}/pkgconfig" >/dev/null || die
	for file in *.pc; do
		dosym "../../../${libroot}/pkgconfig/${file}" \
			"/usr/${libdir}/pkgconfig/${file}"
	done
	popd >/dev/null || die
	pushd "${libroot}/cmake/mkl" >/dev/null || die
	for file in *.cmake; do
		dosym "../../../../${libroot}/cmake/mkl/${file}" \
			"/usr/${libdir}/cmake/mkl/${file}"
	done
	popd >/dev/null || die

	# Move everything over to the image directory
	mv "${S}/"* "${ED}" || die

	# Create convenience symlink that does not include the version number
	dosym "${VER}" /opt/intel/oneapi/mkl/latest

	local lib=../../../../${libroot}/libmkl_rt.so
	dodir "/usr/${libdir}"/{blas,lapack}/mkl
	dosym "${lib}" "/usr/${libdir}/blas/mkl/libblas.so"
	dosym "${lib}" "/usr/${libdir}/blas/mkl/libblas.so.3"
	dosym "${lib}" "/usr/${libdir}/blas/mkl/libcblas.so"
	dosym "${lib}" "/usr/${libdir}/blas/mkl/libcblas.so.3"
	dosym "${lib}" "/usr/${libdir}/lapack/mkl/liblapack.so"
	dosym "${lib}" "/usr/${libdir}/lapack/mkl/liblapack.so.3"
	dosym "${lib}" "/usr/${libdir}/lapack/mkl/liblapacke.so"
	dosym "${lib}" "/usr/${libdir}/lapack/mkl/liblapacke.so.3"

	newenvd - "70intel-mkl" <<-_EOF_
		MKLROOT="${EPREFIX}/opt/intel/oneapi/mkl/${VER}"
		PATH="${EPREFIX}/opt/intel/oneapi/mkl/${VER}/bin/intel64"
		# we need to duplicate it in ROOTPATH for Portage to respect...
		ROOTPATH="${EPREFIX}/opt/intel/oneapi/mkl/${VER}/bin/intel64"
		LDPATH="${EPREFIX}/opt/intel/oneapi/mkl/${VER}/lib/intel64"
	_EOF_
}

pkg_postinst() {
	local libdir=$(get_libdir) me="mkl"

	# check blas
	eselect blas add ${libdir} "${EROOT}"/usr/${libdir}/blas/${me} ${me}
	local current_blas=$(eselect blas show ${libdir} | cut -d' ' -f2)
	if [[ ${current_blas} == "${me}" || -z ${current_blas} ]]; then
		eselect blas set ${libdir} ${me}
		elog "Current eselect: BLAS/CBLAS ($libdir) -> [${current_blas}]."
	else
		elog "Current eselect: BLAS/CBLAS ($libdir) -> [${current_blas}]."
		elog "To use blas [${me}] implementation, you have to issue (as root):"
		elog "\t eselect blas set ${libdir} ${me}"
	fi

	# check lapack
	eselect lapack add ${libdir} "${EROOT}"/usr/${libdir}/lapack/${me} ${me}
	local current_lapack=$(eselect lapack show ${libdir} | cut -d' ' -f2)
	if [[ ${current_lapack} == "${me}" || -z ${current_lapack} ]]; then
		eselect lapack set ${libdir} ${me}
		elog "Current eselect: LAPACK ($libdir) -> [${current_blas}]."
	else
		elog "Current eselect: LAPACK ($libdir) -> [${current_blas}]."
		elog "To use lapack [${me}] implementation, you have to issue (as root):"
		elog "\t eselect lapack set ${libdir} ${me}"
	fi
}

pkg_postrm() {
	eselect blas validate
	eselect lapack validate
}
