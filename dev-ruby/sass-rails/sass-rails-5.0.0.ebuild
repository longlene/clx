# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Sass adapter for the Rails asset pipeline"
HOMEPAGE="https://github.com/rails/sass-rails"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/railties-4.0.0"
ruby_add_rdepend ">=dev-ruby/sass-3.1"
ruby_add_rdepend ">=dev-ruby/sprockets-rails-2.0"
ruby_add_rdepend ">=dev-ruby/sprockets-2.8"
ruby_add_rdepend ">=dev-ruby/tilt-1.1"
ruby_add_rdepend ">=dev-ruby/rails-0"
ruby_add_rdepend ">=dev-ruby/sqlite3-0"

