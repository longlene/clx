# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A simple to use Rails-Engine-Gem that offers an admin interface for trusted user"
HOMEPAGE="http://antpaw.github.io/bhf"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rails-4.2"
ruby_add_rdepend ">=dev-ruby/turbolinks-2"
ruby_add_rdepend ">=dev-ruby/kaminari-0"
ruby_add_rdepend ">=dev-ruby/haml-rails-0"
ruby_add_rdepend ">=dev-ruby/sass-rails-5"
ruby_add_rdepend ">=dev-ruby/shoulda-3"
ruby_add_rdepend ">=dev-ruby/rdoc-3"
ruby_add_rdepend ">=dev-ruby/bundler-1"
ruby_add_rdepend ">=dev-ruby/jeweler-2"
ruby_add_rdepend ">=dev-ruby/simplecov-0"

