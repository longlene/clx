# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A Rails-based frontend to the Resque job queue system"
HOMEPAGE="https://github.com/resque/resque-web"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/resque-0"
ruby_add_rdepend ">=dev-ruby/twitter-bootstrap-rails-0"
ruby_add_rdepend ">=dev-ruby/jquery-rails-0"
ruby_add_rdepend ">=dev-ruby/sass-rails-0"
ruby_add_rdepend ">=dev-ruby/coffee-rails-0"

