# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A Like/Dislike recommendation engine for Ruby apps using Redis"
HOMEPAGE="https://github.com/davidcelis/recommendable"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-3.0.0"
ruby_add_rdepend ">=dev-ruby/redis-2.2.0"
ruby_add_rdepend ">=dev-ruby/hooks-0.2.1"
ruby_add_rdepend ">=dev-ruby/minitest-4.2"
ruby_add_rdepend ">=dev-ruby/minifacture-0"
ruby_add_rdepend ">=dev-ruby/yard-0"
ruby_add_rdepend ">=dev-ruby/rails-3.1.0"
ruby_add_rdepend ">=dev-ruby/database_cleaner-0"

