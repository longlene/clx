# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Redis Database lightweight and simple to use queue manager"
HOMEPAGE="https://github.com/belogub/redisque"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/json-1.7.5"
ruby_add_rdepend ">=dev-ruby/redis-3.0.2"
ruby_add_rdepend ">=dev-ruby/rspec-0"

