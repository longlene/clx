# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_13 )

inherit distutils-r1

DESCRIPTION="Datadog Python APM Client"
HOMEPAGE="
	https://pypi.org/project/ddtrace/
	https://github.com/DataDog/dd-trace-py
"
SRC_URI="https://files.pythonhosted.org/packages/04/5b/02c10b6dfacf501dba90a8daf025a275d3f07d566f15cae37a64b90c464a/ddtrace-4.2.1-cp313-cp313-manylinux2014_x86_64.manylinux_2_17_x86_64.whl"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"

QA_PRESTRIPPED="
	/usr/lib/python3.13/site-packages/ddtrace/appsec/_iast/_stacktrace.cpython-313-x86_64-linux-gnu.so
	/usr/lib/python3.13/site-packages/ddtrace/appsec/_iast/_ast/iastpatch.cpython-313-x86_64-linux-gnu.so
	/usr/lib/python3.13/site-packages/ddtrace/internal/_encoding.cpython-313-x86_64-linux-gnu.so
	/usr/lib/python3.13/site-packages/ddtrace/internal/_rand.cpython-313-x86_64-linux-gnu.so
	/usr/lib/python3.13/site-packages/ddtrace/internal/_tagset.cpython-313-x86_64-linux-gnu.so
	/usr/lib/python3.13/site-packages/ddtrace/internal/datadog/profiling/libdd_wrapper.cpython-313-x86_64-linux-gnu.so
	/usr/lib/python3.13/site-packages/ddtrace/internal/_threads.cpython-313-x86_64-linux-gnu.so
	/usr/lib/python3.13/site-packages/ddtrace/appsec/_ddwaf/libddwaf/x86_64/lib/libddwaf.so
	/usr/lib/python3.13/site-packages/ddtrace/internal/datadog/profiling/stack/_stack.cpython-313-x86_64-linux-gnu.so
	/usr/lib/python3.13/site-packages/ddtrace/internal/telemetry/metrics_namespaces.cpython-313-x86_64-linux-gnu.so
	/usr/lib/python3.13/site-packages/ddtrace/profiling/collector/_memalloc.cpython-313-x86_64-linux-gnu.so
	/usr/lib/python3.13/site-packages/ddtrace/profiling/_threading.cpython-313-x86_64-linux-gnu.so
	/usr/lib/python3.13/site-packages/ddtrace/internal/datadog/profiling/ddup/_ddup.cpython-313-x86_64-linux-gnu.so
	/usr/lib/python3.13/site-packages/ddtrace/appsec/_iast/_taint_tracking/_native.cpython-313-x86_64-linux-gnu.so
	/usr/lib/python3.13/site-packages/ddtrace/profiling/collector/_task.cpython-313-x86_64-linux-gnu.so
	/usr/lib/python3.13/site-packages/ddtrace/internal/native/_native.cpython-313-x86_64-linux-gnu.so
	/usr/lib/python3.13/site-packages/ddtrace/profiling/collector/_traceback.cpython-313-x86_64-linux-gnu.so
	/usr/lib/python3.13/site-packages/ddtrace/vendor/psutil/_psutil_linux.cpython-313-x86_64-linux-gnu.so
	/usr/lib/python3.13/site-packages/ddtrace/vendor/psutil/_psutil_posix.cpython-313-x86_64-linux-gnu.so
"

python_compile() {
	distutils_wheel_install "${BUILD_DIR}/install" \
		"${DISTDIR}/${A}"
}

