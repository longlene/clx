# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby22 ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="XSS/CSRF safe JWT auth designed for SPA"
HOMEPAGE="http://rubygems.org/gems/jwt_sessions"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/jwt-2.1"
ruby_add_rdepend ">=dev-ruby/redis-3"
ruby_add_rdepend ">=dev-ruby/bundler-1.16"
ruby_add_rdepend ">=dev-ruby/minitest-5.11"
ruby_add_rdepend ">=dev-ruby/pry-0.11"
ruby_add_rdepend ">=dev-ruby/rake-12.3"

