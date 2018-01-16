# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Intended to be a gem which will help to build complex Simple Vector Graphics (SVG)"
HOMEPAGE="https://github.com/joelbyler/svg"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""


