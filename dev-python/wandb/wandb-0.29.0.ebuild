# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="A tool for visualizing and tracking your machine learning experiments"
HOMEPAGE="https://github.com/wandb/wandb"
SRC_URI="https://github.com/wandb/wandb/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/click-8.2.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/sentry-sdk-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/protobuf-5[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/platformdirs[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.8[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.6[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-api-1.43.0[${PYTHON_USEDEP}]
	>=dev-python/xxhash-3.0.0[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-lang/go
"
#BDEPEND="
#	test? (
#	)
#"

#distutils_enable_tests pytest
