# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Rodauth is an authentication and account management framework for
rack applications"
HOMEPAGE="https://github.com/jeremyevans/rodauth"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sequel-4"
ruby_add_rdepend ">=dev-ruby/roda-2.6.0"
ruby_add_rdepend ">=dev-ruby/tilt-0"
ruby_add_rdepend ">=dev-ruby/rack_csrf-0"
ruby_add_rdepend ">=dev-ruby/bcrypt-0"
ruby_add_rdepend ">=dev-ruby/mail-0"
ruby_add_rdepend ">=dev-ruby/rotp-0"
ruby_add_rdepend ">=dev-ruby/rqrcode-0"
ruby_add_rdepend ">=dev-ruby/jwt-0"
ruby_add_rdepend ">=dev-ruby/minitest-5.0.0"
ruby_add_rdepend ">=dev-ruby/minitest-hooks-1.1.0"
ruby_add_rdepend ">=dev-ruby/capybara-2.1.0"

