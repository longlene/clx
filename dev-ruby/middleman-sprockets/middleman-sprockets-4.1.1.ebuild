# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Sprockets support for Middleman"
HOMEPAGE="https://github.com/middleman/middleman-sprockets"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/middleman-core-4.0"
ruby_add_rdepend ">=dev-ruby/sprockets-3.0"
ruby_add_rdepend ">=dev-ruby/capybara-2.5.0"

