# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Smallest Rails Apps launcher"
HOMEPAGE="http://github.com/teamon/minirails"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/foreman-0.78.0"
ruby_add_rdepend ">=dev-ruby/rack-1.6.4"
ruby_add_rdepend ">=dev-ruby/railties-4.2.4"
ruby_add_rdepend ">=dev-ruby/activerecord-4.2.4"
ruby_add_rdepend ">=dev-ruby/pg-0.18.3"
ruby_add_rdepend ">=dev-ruby/bundler-1.8"
ruby_add_rdepend ">=dev-ruby/rake-10.0"

