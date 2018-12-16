# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A ruby gem that get chinese stock infomation"
HOMEPAGE="https://github.com/astonfu/cstock"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rest-client-1.6"
ruby_add_rdepend ">=dev-ruby/rspec-3.2"
ruby_add_rdepend ">=dev-ruby/byebug-0"

