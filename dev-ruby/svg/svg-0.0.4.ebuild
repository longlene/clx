# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

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


