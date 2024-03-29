# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Write React UI components in pure Ruby"
HOMEPAGE="http://reactrb.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/opal-0.8.0"
ruby_add_rdepend ">=dev-ruby/opal-activesupport-0.2.0"
ruby_add_rdepend "=dev-ruby/opal-browser-0.2.0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend "=dev-ruby/rspec-rails-3.3.3"
ruby_add_rdepend ">=dev-ruby/timecop-0"
ruby_add_rdepend ">=dev-ruby/opal-rspec-0"
ruby_add_rdepend ">=dev-ruby/sinatra-0"
ruby_add_rdepend ">=dev-ruby/opal-jquery-0"
ruby_add_rdepend "=dev-ruby/rails-4.2.4"
ruby_add_rdepend ">=dev-ruby/react-rails-0"
ruby_add_rdepend ">=dev-ruby/opal-rails-0"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend "=dev-ruby/sqlite3-1.3.10"
ruby_add_rdepend "=dev-ruby/therubyracer-0.12.2"

