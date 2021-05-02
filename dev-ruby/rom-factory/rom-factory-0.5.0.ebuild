# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION=""
HOMEPAGE="https://github.com/rom-rb/rom-factory"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/dry-configurable-0.7"
ruby_add_rdepend ">=dev-ruby/dry-core-0.3"
ruby_add_rdepend ">=dev-ruby/dry-struct-0.3"
ruby_add_rdepend ">=dev-ruby/rom-core-4.0"
ruby_add_rdepend ">=dev-ruby/faker-1.7"

