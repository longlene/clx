# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Ruby on Rails Admin Panel (Engine) to allow trusted users edit structured content"
HOMEPAGE="http://www.typuscmf.com/"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bcrypt-ruby-3.0.0"
ruby_add_rdepend ">=dev-ruby/jquery-rails-0"
ruby_add_rdepend ">=dev-ruby/rails-3.1.3"

