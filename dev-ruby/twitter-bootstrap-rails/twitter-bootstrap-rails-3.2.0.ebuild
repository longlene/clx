# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="twitter-bootstrap-rails project integrates Bootstrap CSS toolkit for Rails 3"
HOMEPAGE="https://github.com/seyhunak/twitter-bootstrap-rails"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/railties-4.1"
ruby_add_rdepend ">=dev-ruby/actionpack-4.1"
ruby_add_rdepend ">=dev-ruby/execjs-2.2"
ruby_add_rdepend ">=dev-ruby/rails-4.1"
ruby_add_rdepend ">=dev-ruby/less-2.6"
ruby_add_rdepend ">=dev-ruby/therubyracer-0.12"

