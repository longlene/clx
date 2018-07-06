# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION=" A gem with tools for machine learning"
HOMEPAGE="https://www.github.com/dansbits/lurn"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/terminal-table-1.7.3"
ruby_add_rdepend ">=dev-ruby/ruby-stemmer-0.9.6"
ruby_add_rdepend ">=dev-ruby/daru-0.1.6"