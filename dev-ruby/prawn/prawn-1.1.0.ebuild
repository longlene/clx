# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="  Prawn is a fast, tiny, and nimble PDF generator for Ruby
"
HOMEPAGE="http://prawn.majesticseacreature.com"

LICENSE="RUBY GPL-2 GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/pdf-core-0.2.5"
ruby_add_rdepend ">=dev-ruby/ttfunk-1.2.0"

